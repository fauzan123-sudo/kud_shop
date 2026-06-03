import 'package:flutter/material.dart';

class ProfileInfoItem {
  final IconData icon;
  final String label;
  final String value;

  ProfileInfoItem(this.icon, this.label, this.value);
}

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<ProfileInfoItem> items;

  const ProfileInfoCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...items.map(
            (item) => Semantics(
              // ← label yang jelas untuk screen reader
              label:
                  '${item.label}: ${item.value.isNotEmpty ? item.value : 'tidak tersedia'}',
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    ExcludeSemantics(
                      // ← icon tidak perlu dibaca
                      child: Icon(
                        item.icon,
                        size: 20,
                        color: Colors.blue.shade600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.value.isNotEmpty ? item.value : '-',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
