import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  final ui.FragmentShader shader;
  final Color color1;
  final Color color2;
  GradientPainter({required this.shader,required this.color1,required this.color2});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint()..shader = shader;

    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    shader.setFloat(2, color1.red / 255 * color1.opacity);
    shader.setFloat(3, color1.green / 255 * color1.opacity);
    shader.setFloat(4, color1.blue / 255 * color1.opacity);
    shader.setFloat(5, color1.opacity);

    shader.setFloat(6, color2.red / 255 * color2.opacity);
    shader.setFloat(7, color2.green / 255 * color2.opacity);
    shader.setFloat(8, color2.blue / 255 * color2.opacity);
    shader.setFloat(9, color2.opacity);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}