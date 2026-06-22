import 'package:flutter/material.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';

class CategoryFilterChips extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int? selectedCategoryId;
  final ValueChanged<int?> onSelected;

  const CategoryFilterChips({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildChip(
            context,
            label: 'Semua',
            isSelected: selectedCategoryId == null,
            onTap: () => onSelected(null),
          ),
          const SizedBox(width: 8),
          ...categories.expand(
            (category) => [
              _buildChip(
                context,
                label: category.name,
                isSelected: selectedCategoryId == category.id,
                onTap: () => onSelected(category.id),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}