import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  ui.FragmentShader shader;

  BackgroundPainter({required this.shader});

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