import 'dart:ui';

import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Color borderColor;
  final double animationValue;

  LinePainter({required this.borderColor, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = borderColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height * animationValue), paint);
    canvas.drawCircle(Offset(size.width / 2, 0), 6, paint);
    if (animationValue >= 0.88) {
      canvas.drawCircle(Offset(size.width / 2, size.height), 6, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BorderPainter extends CustomPainter {
  final double animation;
  final bool isLeftBox;
  final Color borderColor;
  final double borderRadius;

  BorderPainter({
    required this.animation,
    required this.isLeftBox,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (isLeftBox) {
      drawLeftBoxBorder(path, size);
    } else {
      drawRightBoxBorder(path, size);
    }

    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      final Path extractPath = pathMetric.extractPath(0.0, pathMetric.length * animation);
      canvas.drawPath(extractPath, paint);
    }
  }

  void drawLeftBoxBorder(Path path, Size size) {
    path.moveTo(size.width, 0);
    path.lineTo(borderRadius, 0);
    path.arcToPoint(Offset(0, borderRadius), radius: Radius.circular(borderRadius), clockwise: false);
    path.lineTo(0, size.height - borderRadius);
    path.arcToPoint(Offset(borderRadius, size.height), radius: Radius.circular(borderRadius), clockwise: false);
    path.lineTo(size.width, size.height);
  }

  void drawRightBoxBorder(Path path, Size size) {
    path.moveTo(0, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.arcToPoint(Offset(size.width, borderRadius), radius: Radius.circular(borderRadius), clockwise: true);
    path.lineTo(size.width, size.height - borderRadius);
    path.arcToPoint(Offset(size.width - borderRadius, size.height),
        radius: Radius.circular(borderRadius), clockwise: true);
    path.lineTo(0, size.height);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
