import 'package:go_router/go_router.dart';

import '../features/splash/presentation/splash_screen.dart';

// Uncomment after creating these screens
// import '../features/auth/presentation/login_screen.dart';
// import '../features/home/presentation/home_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      /*
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      */
    ],
  );
}