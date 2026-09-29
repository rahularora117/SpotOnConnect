import 'package:flutter/material.dart';

import 'app_theme.dart';

class SpotOnApp extends StatelessWidget {
  const SpotOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpotOnConnect',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      home: const Scaffold(
        body: Center(
          child: Text(
            'SpotOnConnect',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}