import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeScreen();
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({super.key});

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: ()=>context.push('/shaders',extra: 'bg.frag'),
                child: const Text('Background Shader'),
              ),
              ElevatedButton(
                onPressed: ()=>context.push('/shaders',extra: 'gradient.frag'),
                child: const Text('Gradient Shader'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
