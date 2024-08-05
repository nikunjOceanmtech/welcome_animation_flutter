import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class IntroAnimationArgs extends Equatable {
  final Color borderColor;
  final void Function() onTapForBarier;
  final void Function() onTapForBox;
  final TextStyle? style;
  final double xPos;
  final double yPos;
  final String text;
  final bool isTopText;
  final double borderRadius;
  final Color? skipButtonColor;
  final Color? nextButtonColor;
  final TextStyle? skipButtonStyle;
  final TextStyle? nextButtonStyle;
  final Widget? skipButton;
  final Widget? nextButton;

  const IntroAnimationArgs({
    required this.borderColor,
    required this.onTapForBarier,
    required this.onTapForBox,
    required this.xPos,
    required this.yPos,
    required this.text,
    required this.borderRadius,
    this.style,
    this.isTopText = true,
    this.skipButtonColor,
    this.nextButtonColor,
    this.skipButtonStyle,
    this.nextButtonStyle,
    this.skipButton,
    this.nextButton,
  });

  @override
  List<Object?> get props => [
        borderColor,
        onTapForBarier,
        onTapForBox,
        style,
        xPos,
        yPos,
        text,
        isTopText,
        borderRadius,
        skipButtonColor,
        nextButtonColor,
        skipButtonStyle,
        nextButtonStyle,
        skipButton,
        nextButton,
      ];
}
