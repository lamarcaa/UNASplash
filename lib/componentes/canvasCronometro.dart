import 'package:flutter/material.dart';
import 'dart:math';

class CirculoProgresso extends CustomPainter {
  final double progress;
  final int segundos;

  CirculoProgresso(this.progress, this.segundos);

  @override
  void paint(Canvas canvas, Size size) {
    Color cronometroColor =
        (segundos >= 10) ? Color(0xFFFF1100) : Color(0xFF02FF0A);

    final paintCinza = Paint()
      ..color = Color.fromARGB(124, 220, 220, 220)
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintAzul = Paint()
      ..color = cronometroColor
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paintCinza);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      paintAzul,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
