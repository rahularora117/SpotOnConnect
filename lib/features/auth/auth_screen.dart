// lib/features/auth/auth_screen.dart
import 'package:flutter/material.dart';
import '../profile_setup/profile_setup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _nickname = TextEditingController();
  final _age = TextEditingController();
  final _selfie = TextEditingController();
  String _lookingFor = 'Dating';
  bool _verifiedSelfie = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _nickname.dispose();
    _age.dispose();
    _selfie.dispose();
    super.dispose();
  }

  void _continue() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileSetupScreen(
          nickname: _nickname.text.trim(),
          age: _age.text.trim(),
          lookingFor: _lookingFor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 12),
            const Text(
              'SpotOn Connect',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            const Text(
              'Meet. Connect. Belong.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1E153D),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verified access',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Selfie verification helps keep fake profiles out and real people in.',
                    style: TextStyle(color: Colors.white70, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nickname,
              decoration: const InputDecoration(
                labelText: 'Nickname',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _age,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _lookingFor,
              items: const [
                DropdownMenuItem(value: 'Dating', child: Text('Dating')),
                DropdownMenuItem(value: 'Friends', child: Text('Friends')),
                DropdownMenuItem(value: 'Networking', child: Text('Networking')),
                DropdownMenuItem(value: 'Social', child: Text('Social')),
              ],
              onChanged: (value) => setState(() => _lookingFor = value ?? 'Dating'),
              decoration: const InputDecoration(
                labelText: 'What are you looking for?',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _selfie,
              readOnly: true,
              decoration: InputDecoration(
                labelText: _verifiedSelfie ? 'Selfie verified' : 'Selfie verification',
                hintText: 'Tap to verify selfie',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    setState(() => _verifiedSelfie = true);
                    _selfie.text = 'Verified';
                  },
                ),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: _continue,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}