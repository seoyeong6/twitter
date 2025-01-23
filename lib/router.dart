import 'package:go_router/go_router.dart';
import 'package:twitter/screens/login/initial_screen.dart';
import 'package:twitter/screens/login/account_screen2.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const InitialScreen()),
    GoRoute(
      path: '/account_screen_2',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return CreateAccountScreen2(
          name: extra?['name'] ?? '',
          contact: extra?['contact'] ?? '',
          birthday: extra?['birthday'] ?? '',
        );
      },
    ),
  ],
);
