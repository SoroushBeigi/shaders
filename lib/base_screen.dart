import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class BaseShaderScreen extends StatelessWidget {
  final String shaderKey;
  const BaseShaderScreen({required this.shaderKey,super.key});

  @override
  Widget build(BuildContext context) {
    return _BackgroundShaderScreen(shaderKey: shaderKey,);
  }
}

class _BackgroundShaderScreen extends StatefulWidget {
  final String shaderKey;
  const _BackgroundShaderScreen({required this.shaderKey,super.key});

  @override
  State<_BackgroundShaderScreen> createState() =>
      _BackgroundShaderScreenState();
}

class _BackgroundShaderScreenState extends State<_BackgroundShaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderBuilder(
        assetKey: 'shaders/${widget.shaderKey}',
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
