import 'package:flutter/material.dart';

enum ArrowPostion { leftTop, leftBottom, rightTop, rightBottom }

class LottieAnimationParms {
  final ArrowPostion arrowPostion;
  final Size animationLottieSize;
  final Size animationCircleSize;
  final Offset animationOffset;
  final Widget? animationWidget;
  final VoidCallback onTapForImage;

  LottieAnimationParms({
    required this.arrowPostion,
    required this.animationCircleSize,
    required this.animationLottieSize,
    required this.animationOffset,
    required this.onTapForImage,
    this.animationWidget,
  });
}
