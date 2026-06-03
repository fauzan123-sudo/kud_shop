import 'package:flutter/material.dart';

class QuickMenu extends StatelessWidget {
  final void Function(int index) onNavigate;

  const QuickMenu({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final menus = [
      _QuickMenuItem('Data Karyawan', Icons.people_outline, Colors.blue, 1),
      _QuickMenuItem('Profil Saya', Icons.person_outline, Colors.purple, 2),
    ];

    return Column(
      children: menus
          .map(
            (menu) => _QuickMenuTile(
              menu: menu,
              onTap: () => onNavigate(menu.tabIndex),
            ),
          )
          .toList(),
    );
  }
}

class _QuickMenuTile extends StatelessWidget {
  final _QuickMenuItem menu;
  final VoidCallback onTap;

  const _QuickMenuTile({required this.menu, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: menu.color.withAlpha(26),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(menu.icon, color: menu.color),
        ),
        title: Text(
          menu.label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

class _QuickMenuItem {
  final String label;
  final IconData icon;
  final Color color;
  final int tabIndex;

  _QuickMenuItem(this.label, this.icon, this.color, this.tabIndex);
}
