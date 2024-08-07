import 'package:flutter/material.dart';
import 'package:welcome_animation_flutter/intro_animation_args.dart';

class HighlightedBoxClipper extends CustomClipper<Path> {
  final IntroAnimationArgs introAnimationArgs;

  HighlightedBoxClipper({required this.introAnimationArgs});

  @override
  Path getClip(Size size) {
    // Create the outer path covering the whole widget area
    Path outerPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Calculate the center and radius of the circle
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width < size.height ? size.width / 4 : size.height / 4;

    // Create the inner path as a circle
    Path innerPath = Path()..addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    // Subtract the inner circle from the outer rectangle to create the highlighted effect
    return Path.combine(
      PathOperation.difference,
      outerPath,
      innerPath,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
