import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/loading/loading_widget.dart';
import 'package:kud_shop/core/injection/injection.dart';
import '../../domain/entities/address_entity.dart';
import '../bloc/address_bloc.dart';
import '../bloc/address_event.dart';
import '../bloc/address_state.dart';
import '../widget/address_card.dart';
import '../widget/address_form_sheet.dart';

class AddressListPage extends StatelessWidget {
  final bool isSelectionMode;

  const AddressListPage({super.key, this.isSelectionMode = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AddressBloc>()..add(const AddressLoad()),
      child: _AddressListView(isSelectionMode: isSelectionMode),
    );
  }
}

class _AddressListView extends StatefulWidget {
  final bool isSelectionMode;

  const _AddressListView({required this.isSelectionMode});

  @override
  State<_AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<_AddressListView> {
  String _currentUserName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) return;

      final data = await supabase
          .from('profiles')
          .select('name')
          .eq('id', userId)
          .single();

      if (mounted) {
        setState(() => _currentUserName = data['name'] as String? ?? '');
      }
    } catch (_) {
      // Biarkan kosong kalau gagal, user tetap bisa isi manual
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(widget.isSelectionMode ? 'Pilih Alamat' : 'Alamat Saya'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressError) {
            AppSnackbar.error(context, state.message);
          }
          if (state is AddressActionSuccess) {
            AppSnackbar.success(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AddressLoading || state is AddressInitial) {
            return const LoadingWidget();
          }

          if (state is AddressError) {
            return _buildEmpty(
              icon: Icons.error_outline,
              message: state.message,
            );
          }

          final addresses = switch (state) {
            AddressLoaded(:final addresses) => addresses,
            AddressActionSuccess(:final addresses) => addresses,
            _ => <AddressEntity>[],
          };

          if (addresses.isEmpty) {
            return _buildEmpty(
              icon: Icons.location_off_outlined,
              message: 'Belum ada alamat tersimpan',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: addresses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final addr = addresses[index];
              return AddressCard(
                address: addr,
                onTap: widget.isSelectionMode
                    ? () => Navigator.pop(context, addr)
                    : null,
                onEdit: () => AddressFormSheet.show(
                  context,
                  address: addr,
                  defaultRecipientName: _currentUserName,
                ),
                onDelete: () => _confirmDelete(context, addr),
                onSetDefault: () => context.read<AddressBloc>().add(
                  AddressSetDefault(id: addr.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AddressFormSheet.show(
          context,
          defaultRecipientName: _currentUserName,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEmpty({required IconData icon, required String message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyMedium.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, AddressEntity address) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus Alamat'),
        content: Text(
          'Yakin ingin menghapus alamat "${address.recipientName}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AddressBloc>().add(AddressDelete(id: address.id));
              Navigator.pop(dialogContext);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
