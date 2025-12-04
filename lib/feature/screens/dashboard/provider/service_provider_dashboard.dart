import 'package:flutter/material.dart';

class ServiceProviderDashboard extends StatelessWidget {
  final String userId;
  final String serviceTitle;

  const ServiceProviderDashboard({
    super.key,
    required this.userId,
    required this.serviceTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$serviceTitle Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.work, size: 80, color: Theme.of(context).primaryColor),
            SizedBox(height: 20),
            Text(
              'Welcome $serviceTitle!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineLarge?.color,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your provider dashboard',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}