import 'package:flutter/material.dart';

class DashboardPageAdmin extends StatelessWidget {
  const DashboardPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), actions: const []),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(children: []),
      ),
    );
  }
}
