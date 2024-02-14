import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final ui.FragmentShader shader;
  final Color color;
  BackgroundPainter({required this.shader,required this.color});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint()..shader = shader;
    shader.setFloat(0, color.red/255);
    shader.setFloat(1, color.green/255);
    shader.setFloat(2, color.blue/255);
    shader.setFloat(3, color.alpha/255);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}