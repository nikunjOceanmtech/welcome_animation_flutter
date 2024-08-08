import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome_animation_flutter/lottie_animation_parms.dart';

class HighlightedBoxClipper extends CustomClipper<Path> {
  final LottieAnimationParms lottieAnimationParms;

  HighlightedBoxClipper({required this.lottieAnimationParms});

  @override
  Path getClip(Size size) {
    // Create the outer path covering the whole widget area
    Path outerPath = Path()..addRect(Rect.fromLTWH(0, 0, ScreenUtil().screenWidth, ScreenUtil().screenHeight));

    // Calculate the center and radius of the circle
    double centerX = lottieAnimationParms.animationOffset.dx + (lottieAnimationParms.animationCircleSize.height / 2);
    double centerY = lottieAnimationParms.animationOffset.dy + (lottieAnimationParms.animationCircleSize.height / 2);
    double radius = 1 == 1
        ? (lottieAnimationParms.animationCircleSize.height / 2) - 5
        : size.width < size.height
            ? size.width / 4
            : size.height / 4;

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
