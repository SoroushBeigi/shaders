import 'package:go_router/go_router.dart';
import 'package:shaders/background_shader_screen.dart';
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
      name: 'bg',
      path: '/bg',
      builder: (context, state) => const BackgroundShaderScreen(),
    ),
  ],
);