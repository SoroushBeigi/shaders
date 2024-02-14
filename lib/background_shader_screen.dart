import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class BackgroundShaderScreen extends StatelessWidget {
  const BackgroundShaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BackgroundShaderScreen();
  }
}

class _BackgroundShaderScreen extends StatefulWidget {
  const _BackgroundShaderScreen({super.key});

  @override
  State<_BackgroundShaderScreen> createState() =>
      _BackgroundShaderScreenState();
}

class _BackgroundShaderScreenState extends State<_BackgroundShaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderBuilder(
        assetKey: 'shaders/bg.frag',
            (context, shader, child) => CustomPaint(
          size: MediaQuery.of(context).size,
          painter: ShaderPainter(
            shader: shader,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ShaderPainter extends CustomPainter {
  ui.FragmentShader shader;

  ShaderPainter({required this.shader});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
