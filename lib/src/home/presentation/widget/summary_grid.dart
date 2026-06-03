import 'package:flutter/material.dart';

class SummaryGrid extends StatelessWidget {
  final int total;
  final int aktif;
  final int departments;

  const SummaryGrid({
    super.key,
    required this.total,
    required this.aktif,
    required this.departments,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _SummaryItem('Total Karyawan', '$total', Icons.people, Colors.blue),
      _SummaryItem('Aktif', '$aktif', Icons.check_circle, Colors.green),
      _SummaryItem('Departemen', '$departments', Icons.business, Colors.orange),
      _SummaryItem('Baru Bulan Ini', '5', Icons.person_add, Colors.purple),
    ];

    // ← ganti GridView.count langsung dengan LayoutBuilder
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - 12) / 2;
        final cardHeight = cardWidth / 1.5; // ← turunkan dari 1.8 ke 1.5

        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: cardWidth / cardHeight,
          children: items.map((item) => _SummaryCard(item: item)).toList(),
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final _SummaryItem item;

  const _SummaryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(102),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, color: item.color, size: 18),
          const Spacer(),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              item.value,
              style: TextStyle(
                fontSize: 18, // ← kurangi lagi
                fontWeight: FontWeight.bold,
                color: item.color,
              ),
            ),
          ),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10, // ← kurangi lagi
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  _SummaryItem(this.label, this.value, this.icon, this.color);
}
