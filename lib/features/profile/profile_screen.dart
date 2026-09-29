// lib/features/profile/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800',
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Rahul, 27',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Stuttgart, Germany',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Selfie verification'),
              subtitle: const Text('Verified profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Photos'),
              subtitle: const Text('2 photos minimum'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Looking for'),
              subtitle: const Text('Dating • Friends • Networking'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}