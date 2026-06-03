import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String position;
  final String avatarUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.position,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Foto profil $name, posisi $position',
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            ExcludeSemantics(
              // ← avatar tidak perlu dibaca ulang
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.blue.shade100,
                backgroundImage: avatarUrl.isNotEmpty
                    ? NetworkImage(avatarUrl)
                    : null,
                child: avatarUrl.isEmpty
                    ? Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              position,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
