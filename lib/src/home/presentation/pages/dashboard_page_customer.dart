import 'package:flutter/material.dart';

class DashboardPageCustomer extends StatelessWidget {
  const DashboardPageCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}