// lib/features/profile_setup/profile_setup_screen.dart
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  final String nickname;
  final String age;
  final String lookingFor;

  const ProfileSetupScreen({
    super.key,
    required this.nickname,
    required this.age,
    required this.lookingFor,
  });

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _bio = TextEditingController();
  final _photo1 = TextEditingController();
  final _photo2 = TextEditingController();

  @override
  void dispose() {
    _bio.dispose();
    _photo1.dispose();
    _photo2.dispose();
    super.dispose();
  }

  void _done() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile setup')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nickname.isEmpty ? 'Your profile' : widget.nickname,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 6),
                Text('Age ${widget.age.isEmpty ? '-' : widget.age} • ${widget.lookingFor}'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _photo1,
            decoration: const InputDecoration(
              labelText: 'Photo 1 URL',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _photo2,
            decoration: const InputDecoration(
              labelText: 'Photo 2 URL',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _bio,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Bio',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'What are you looking for?',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              Chip(label: Text('Dating')),
              Chip(label: Text('Friends')),
              Chip(label: Text('Networking')),
              Chip(label: Text('Social')),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _done,
            child: const Text('Finish profile'),
          ),
        ],
      ),
    );
  }
}