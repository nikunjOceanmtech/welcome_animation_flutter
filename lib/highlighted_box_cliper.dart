import 'package:flutter/material.dart';
import 'package:welcome_animation_flutter/intro_animation_args.dart';

class HighlightedBoxClipper extends CustomClipper<Path> {
  final IntroAnimationArgs introAnimationArgs;

  HighlightedBoxClipper({required this.introAnimationArgs});

  @override
  Path getClip(Size size) {
    if (introAnimationArgs.isTopText) {
      Path outerPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
      Path innerPath = Path()
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              introAnimationArgs.xPos + 10,
              (introAnimationArgs.yPos + 13) + (introAnimationArgs.isTopText ? 90 : 0) + 3,
              (introAnimationArgs.boxSize.width * 2) - 20,
              (introAnimationArgs.boxSize.height) - 20,
            ),
            Radius.circular(introAnimationArgs.borderRadius),
          ),
        );

      return Path.combine(
        PathOperation.difference,
        outerPath,
        innerPath,
      );
    }
    Path outerPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    Path innerPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            introAnimationArgs.xPos + 10,
            (introAnimationArgs.yPos + 7.5) + (introAnimationArgs.isTopText ? 90 : 0) + 3,
            (introAnimationArgs.boxSize.width * 2) - 20,
            (introAnimationArgs.boxSize.height) - 20,
          ),
          Radius.circular(introAnimationArgs.borderRadius),
        ),
      );

    return Path.combine(
      PathOperation.difference,
      outerPath,
      innerPath,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
