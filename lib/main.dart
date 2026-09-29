import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock app to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://kdiiotfgrtwgwydefoms.supabase.co',
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(
    const ProviderScope(
      child: SpotOnApp(),
    ),
  );
}