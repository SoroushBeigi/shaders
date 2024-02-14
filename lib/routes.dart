import 'package:go_router/go_router.dart';
import 'package:shaders/base_screen.dart';
import 'package:shaders/home_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'shader',
      path: '/shaders',
      builder: (context, state) {
        final key = (state.extra as String?) ?? 'bg.frag';
        return BaseShaderScreen(shaderKey: key);
      },
    ),
  ],
);
