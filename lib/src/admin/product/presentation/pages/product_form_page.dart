import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_event.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_state.dart';
import 'package:kud_shop/src/admin/product/presentation/widget/product_category_dropdown.dart';
import 'package:kud_shop/src/admin/product/presentation/widget/product_form_fields.dart';
import 'package:kud_shop/src/admin/product/presentation/widget/product_image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kud_shop/core/usecases/usecase.dart';

class ProductFormPage extends StatefulWidget {
  final ProductEntity? product;

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

  List<CategoryEntity> _categories = [];
  CategoryEntity? _selectedCategory;
  Uint8List? _imageBytes;
  String? _existingImageUrl;
  bool _isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _fillFormIfEdit();
  }

  void _fillFormIfEdit() {
    if (!widget.isEdit) return;
    final p = widget.product!;
    _nameController.text = p.name;
    _priceController.text = p.price
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
    _stockController.text = p.stock.toString();
    _descriptionController.text = p.description ?? '';
    _existingImageUrl = p.imageUrl;
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
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  Future<String?> _uploadImage() async {
    if (_imageBytes == null) return _existingImageUrl;

    setState(() => _isUploadingImage = true);
    try {
      final supabase = Supabase.instance.client;
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_'
          '${_nameController.text.trim().replaceAll(' ', '_')}.jpg';

      await supabase.storage
          .from('product-images')
          .uploadBinary(fileName, _imageBytes!);

      return supabase.storage.from('product-images').getPublicUrl(fileName);
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal upload foto');
      return _existingImageUrl;
    } finally {
      if (mounted) setState(() => _isUploadingImage = false);
    }
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final imageUrl = await _uploadImage();
    if (!mounted) return;
    final name = _nameController.text.trim();
    final price =
        double.tryParse(_priceController.text.trim().replaceAll('.', '')) ?? 0;
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
          unit: 'pcs',
          isActive: true,
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
          unit: 'pcs',
          isActive: true,
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
                ? 'Obat berhasil diperbarui'
                : 'Obat berhasil ditambahkan',
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
          title: Text(widget.isEdit ? 'Edit Obat' : 'Tambah Obat'),
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
                  children: [
                    ProductImagePicker(
                      imageBytes: _imageBytes,
                      existingImageUrl: _existingImageUrl,
                      onTap: _pickImage,
                    ),
                    const SizedBox(height: 20),
                    ProductNameField(controller: _nameController),
                    const SizedBox(height: 16),
                    ProductDescriptionField(controller: _descriptionController),
                    const SizedBox(height: 16),
                    ProductCategoryDropdown(
                      categories: _categories,
                      selectedCategory: _selectedCategory,
                      onChanged: (value) =>
                          setState(() => _selectedCategory = value),
                    ),
                    const SizedBox(height: 16),
                    ProductPriceField(controller: _priceController),
                    const SizedBox(height: 16),
                    ProductStockField(controller: _stockController),
                    const SizedBox(height: 32),
                    AppButton(
                      label: widget.isEdit ? 'Update Obat' : 'Simpan Obat',
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
}
