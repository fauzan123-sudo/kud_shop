import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), actions: const []),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(children: []),
      ),
    );
  }
}
