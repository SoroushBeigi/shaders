import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:shaders/painters/bg_painter.dart';
import 'package:shaders/painters/gradient_painter.dart';

class BaseScreen extends StatelessWidget {
  final String shaderKey;
  const BaseScreen({required this.shaderKey,super.key});

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
          painter: shaderKeyToPainter(widget.shaderKey,shader)
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  CustomPainter shaderKeyToPainter(String key,FragmentShader shader){
    switch(key){
      case 'bg.frag':
      return BackgroundPainter(shader: shader,color: Colors.green);
      case 'gradient.frag':
      return GradientPainter(shader: shader);
      default:
      return BackgroundPainter(shader: shader,color: Colors.red);
    }
  }
}


