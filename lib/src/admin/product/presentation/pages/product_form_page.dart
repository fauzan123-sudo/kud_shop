import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/component/widgets/textfiled/app_text_field.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_event.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kud_shop/core/usecases/usecase.dart';

class ProductFormPage extends StatefulWidget {
  final ProductEntity? product; // null = tambah, tidak null = edit

  const ProductFormPage({super.key, this.product});

  bool get isEdit => product != null;

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();

  // ─── State ────────────────────────────────────────────────
  List<CategoryEntity> _categories = [];
  CategoryEntity? _selectedCategory;
  String _selectedUnit = 'tablet';
  bool _isActive = true;
  File? _imageFile;
  String? _existingImageUrl;
  bool _isUploadingImage = false;

  final List<String> _units = [
    'tablet',
    'kapsul',
    'botol',
    'sachet',
    'ampul',
    'tube',
    'strip',
    'pcs',
  ];

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _fillFormIfEdit();
  }

  void _fillFormIfEdit() {
    if (widget.isEdit) {
      final p = widget.product!;
      _nameController.text = p.name;
      _priceController.text = p.price.toStringAsFixed(0);
      _stockController.text = p.stock.toString();
      _descriptionController.text = p.description ?? '';
      _selectedUnit = p.unit;
      _isActive = p.isActive;
      _existingImageUrl = p.imageUrl;
    }
  }

  Future<void> _loadCategories() async {
    final result = await sl<GetCategories>()(const NoParams());
    result.fold((_) {}, (categories) {
      setState(() {
        _categories = categories;
        if (widget.isEdit && widget.product!.categoryId != null) {
          _selectedCategory = categories.firstWhere(
            (c) => c.id == widget.product!.categoryId,
            orElse: () => categories.first,
          );
        }
      });
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() => _imageFile = File(picked.path));
    }
  }

  Future<String?> _uploadImage() async {
    if (_imageFile == null) return _existingImageUrl;

    setState(() => _isUploadingImage = true);
    try {
      final supabase = Supabase.instance.client;
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${_nameController.text.trim().replaceAll(' ', '_')}.jpg';

      await supabase.storage
          .from('product-images')
          .upload(fileName, _imageFile!);

      final url = supabase.storage
          .from('product-images')
          .getPublicUrl(fileName);

      return url;
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal upload foto');
      return _existingImageUrl;
    } finally {
      if (mounted) setState(() => _isUploadingImage = false);
    }
  }

  void _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final imageUrl = await _uploadImage();

    final name = _nameController.text.trim();
    final price = double.tryParse(_priceController.text.trim()) ?? 0;
    final stock = int.tryParse(_stockController.text.trim()) ?? 0;
    final description = _descriptionController.text.trim();

    if (widget.isEdit) {
      context.read<ProductBloc>().add(
        ProductEvent.update(
          id: widget.product!.id,
          categoryId: _selectedCategory?.id,
          name: name,
          description: description.isEmpty ? null : description,
          price: price,
          stock: stock,
          imageUrl: imageUrl,
          unit: _selectedUnit,
          isActive: _isActive,
        ),
      );
    } else {
      context.read<ProductBloc>().add(
        ProductEvent.create(
          categoryId: _selectedCategory?.id,
          name: name,
          description: description.isEmpty ? null : description,
          price: price,
          stock: stock,
          imageUrl: imageUrl,
          unit: _selectedUnit,
          isActive: _isActive,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductActionSuccess) {
          AppSnackbar.success(
            context,
            widget.isEdit
                ? 'Produk berhasil diperbarui'
                : 'Produk berhasil ditambahkan',
          );
          context.pop();
        }
        if (state is ProductError) {
          AppSnackbar.error(context, state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Text(widget.isEdit ? 'Edit Produk' : 'Tambah Produk'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            final isLoading = state is ProductLoading || _isUploadingImage;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─── Foto Produk ──────────────────────────
                    _buildImagePicker(),
                    const SizedBox(height: 20),

                    // ─── Nama Produk ──────────────────────────
                    AppTextField(
                      controller: _nameController,
                      label: 'Nama Produk',
                      hint: 'Masukkan nama produk',
                      prefixIcon: Icons.medication_outlined,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama produk wajib diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // ─── Kategori ────────────────────────────
                    _buildCategoryDropdown(),
                    const SizedBox(height: 16),

                    // ─── Harga & Stok ─────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: _priceController,
                            label: 'Harga (Rp)',
                            hint: '0',
                            prefixIcon: Icons.attach_money,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harga wajib diisi';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppTextField(
                            controller: _stockController,
                            label: 'Stok',
                            hint: '0',
                            prefixIcon: Icons.inventory_2_outlined,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Stok wajib diisi';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ─── Satuan ───────────────────────────────
                    _buildUnitDropdown(),
                    const SizedBox(height: 16),

                    // ─── Deskripsi ────────────────────────────
                    AppTextField(
                      controller: _descriptionController,
                      label: 'Deskripsi',
                      hint: 'Masukkan deskripsi produk (opsional)',
                      prefixIcon: Icons.description_outlined,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),

                    // ─── Status Aktif ─────────────────────────
                    _buildActiveSwitch(),
                    const SizedBox(height: 32),

                    // ─── Tombol Simpan ────────────────────────
                    AppButton(
                      label: widget.isEdit ? 'Update Produk' : 'Simpan Produk',
                      isLoading: isLoading,
                      onPressed: _onSubmit,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ─── Widgets ──────────────────────────────────────────────

  Widget _buildImagePicker() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade300,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: _imageFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(_imageFile!, fit: BoxFit.cover),
                )
              : _existingImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    _existingImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
                  ),
                )
              : _buildImagePlaceholder(),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 48,
          color: Colors.grey.shade400,
        ),
        const SizedBox(height: 8),
        Text(
          'Tap untuk pilih foto',
          style: AppTextStyle.bodySmall.copyWith(color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kategori', style: AppTextStyle.label),
        const SizedBox(height: 8),
        DropdownButtonFormField<CategoryEntity>(
          value: _selectedCategory,
          decoration: InputDecoration(
            hintText: 'Pilih kategori',
            prefixIcon: const Icon(Icons.category_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          items: _categories
              .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
              .toList(),
          onChanged: (value) => setState(() => _selectedCategory = value),
        ),
      ],
    );
  }

  Widget _buildUnitDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Satuan', style: AppTextStyle.label),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedUnit,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.straighten_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          items: _units
              .map((u) => DropdownMenuItem(value: u, child: Text(u)))
              .toList(),
          onChanged: (value) {
            if (value != null) setState(() => _selectedUnit = value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Satuan wajib dipilih';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildActiveSwitch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(
            Icons.toggle_on_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status Produk', style: AppTextStyle.label),
                Text(
                  _isActive
                      ? 'Aktif — tampil di toko'
                      : 'Nonaktif — disembunyikan',
                  style: AppTextStyle.caption,
                ),
              ],
            ),
          ),
          Switch(
            value: _isActive,
            onChanged: (value) => setState(() => _isActive = value),
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
