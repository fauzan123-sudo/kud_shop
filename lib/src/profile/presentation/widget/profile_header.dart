import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final bool isAdmin;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
        children: [
          ProfileAvatar(avatarUrl: avatarUrl, name: name, radius: 48),
          const SizedBox(height: 16),
          Text(name, style: AppTextStyle.h3),
          const SizedBox(height: 6),
          _buildRoleBadge(),
        ],
      ),
    );
  }

  Widget _buildRoleBadge() {
    final color = isAdmin ? Colors.orange : Colors.blue;
    final label = isAdmin ? 'Admin' : 'Customer';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: color.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}