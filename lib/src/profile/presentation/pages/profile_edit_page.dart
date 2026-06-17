import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/component/widgets/textfiled/app_text_field.dart';
import 'package:kud_shop/src/auth/domain/entities/user_entity.dart';
import 'package:kud_shop/src/profile/presentation/widget/profile_avatar.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  Uint8List? _imageBytes;
  String? _existingAvatarUrl;
  String _userId = '';
  String _role = 'customer';
  bool _isLoading = false;
  bool _isFetching = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    try {
      final supabase = Supabase.instance.client;
      final user = supabase.auth.currentUser;
      if (user == null) return;

      _userId = user.id;
      _emailController.text = user.email ?? '';

      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', _userId)
          .single();

      if (!mounted) return;
      setState(() {
        _nameController.text = data['name'] as String? ?? '';
        _phoneController.text = data['phone'] as String? ?? '';
        _existingAvatarUrl = data['avatar_url'] as String?;
        _role = data['role'] as String? ?? 'customer';
        _isFetching = false;
      });
    } catch (_) {
      if (mounted) setState(() => _isFetching = false);
    }
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 85,
    );
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  /// Mengembalikan URL avatar baru jika ada foto baru yang dipilih,
  /// atau null jika tidak ada perubahan foto.
  /// Melempar exception jika upload gagal — supaya _onSave tahu harus berhenti.
  Future<String?> _uploadAvatar() async {
    if (_imageBytes == null) return null; // tidak ada perubahan foto

    final supabase = Supabase.instance.client;
    final fileName =
        'avatar_${_userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      await supabase.storage
          .from('avatars')
          .uploadBinary(fileName, _imageBytes!);

      return supabase.storage.from('avatars').getPublicUrl(fileName);
    } catch (e) {
      // ─── DEBUG: lihat error asli di console ──────────────
      debugPrint('UPLOAD AVATAR ERROR: $e');
      if (e is StorageException) {
        debugPrint('StorageException message: ${e.message}');
        debugPrint('StorageException statusCode: ${e.statusCode}');
      }
      rethrow;
    }
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    String? newAvatarUrl;
    final hasNewImage = _imageBytes != null;

    if (hasNewImage) {
      try {
        newAvatarUrl = await _uploadAvatar();
      } catch (e) {
        if (mounted) {
          AppSnackbar.error(context, 'Gagal upload foto: $e');
          setState(() => _isLoading = false);
        }
        return; // berhenti, jangan lanjut update profile
      }
    }

    try {
      await Supabase.instance.client
          .from('profiles')
          .update({
            'name': _nameController.text.trim(),
            'phone': _phoneController.text.trim().isEmpty
                ? null
                : _phoneController.text.trim(),
            if (newAvatarUrl != null) 'avatar_url': newAvatarUrl,
          })
          .eq('id', _userId);

      if (!mounted) return;
      AppSnackbar.success(context, 'Profil berhasil diperbarui');

      // Kirim balik data terbaru (bukan AuthEvent.started, supaya
      // tidak memicu redirect ke splash via GoRouterRefreshStream)
      context.pop(
        UserEntity(
          id: _userId,
          email: _emailController.text,
          name: _nameController.text.trim(),
          role: _role,
          phone: _phoneController.text.trim().isEmpty
              ? null
              : _phoneController.text.trim(),
          avatarUrl: newAvatarUrl ?? _existingAvatarUrl,
        ),
      );
    } catch (_) {
      if (mounted) AppSnackbar.error(context, 'Gagal menyimpan perubahan');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isFetching
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    // ─── Avatar picker ────────────────────────
                    _AvatarPicker(
                      imageBytes: _imageBytes,
                      avatarUrl: _existingAvatarUrl,
                      name: _nameController.text,
                      onTap: _pickImage,
                    ),
                    const SizedBox(height: 32),

                    // ─── Form card ────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(10),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'INFORMASI PRIBADI',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),

                          AppTextField(
                            controller: _nameController,
                            label: 'Nama Lengkap',
                            hint: 'Masukkan nama lengkap',
                            prefixIcon: Icons.person_outline,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Nama wajib diisi';
                              }
                              if (value.trim().length < 3) {
                                return 'Nama minimal 3 karakter';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          AppTextField(
                            controller: _phoneController,
                            label: 'Nomor HP',
                            hint: '08xxxxxxxxxx',
                            prefixIcon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (value.length < 9 || value.length > 15) {
                                  return 'Nomor HP tidak valid';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Email — read only
                          AppTextField(
                            controller: _emailController,
                            label: 'Email',
                            prefixIcon: Icons.email_outlined,
                            readOnly: true,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Email tidak dapat diubah',
                            style: AppTextStyle.caption,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    AppButton(
                      label: 'Simpan Perubahan',
                      isLoading: _isLoading,
                      onPressed: _onSave,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
    );
  }
}

// ─── Avatar Picker ────────────────────────────────────────────
class _AvatarPicker extends StatelessWidget {
  final Uint8List? imageBytes;
  final String? avatarUrl;
  final String name;
  final VoidCallback onTap;

  const _AvatarPicker({
    required this.imageBytes,
    required this.avatarUrl,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: imageBytes != null
                  ? CircleAvatar(
                      radius: 56,
                      backgroundImage: MemoryImage(imageBytes!),
                    )
                  : ProfileAvatar(avatarUrl: avatarUrl, name: name, radius: 56),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text('Ketuk untuk ganti foto', style: AppTextStyle.caption),
      ],
    );
  }
}
