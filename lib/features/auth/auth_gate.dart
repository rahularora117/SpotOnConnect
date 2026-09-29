import 'package:flutter/material.dart';
import '../../core/models/app_user.dart';
import '../../navigation/main_navigation.dart';
import '../../core/services/session_service.dart';
import 'auth_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppUser?>(
      future: SessionService.loadProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final profile = snapshot.data;
        if (profile == null) return const AuthScreen();

        return MainNavigation(profile: profile);
      },
    );
  }
}