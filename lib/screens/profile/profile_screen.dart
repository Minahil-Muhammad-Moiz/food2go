import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person)),
            SizedBox(height: 16),
            Text('Ali Khan'),
            SizedBox(height: 8),
            Text('ali@example.com'),
          ],
        ),
      ),
    );
  }
}
