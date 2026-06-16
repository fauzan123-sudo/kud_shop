import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final double radius;

  const ProfileAvatar({
    super.key,
    required this.avatarUrl,
    required this.name,
    this.radius = 48,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue.shade100,
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      child: avatarUrl == null
          ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: TextStyle(
                fontSize: radius * 0.7,
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }
}