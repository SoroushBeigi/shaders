import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  ui.FragmentShader shader;

  GradientPainter({required this.shader});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint()..shader = shader;
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}