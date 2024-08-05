import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class IntroAnimationArgs extends Equatable {
  final Color borderColor;
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
  final Size boxSize;
  final HintTextAndLineAlign? hintAlign;
  final HintTextAndLineAlign? lineAlign;

  const IntroAnimationArgs({
    required this.borderColor,
    required this.xPos,
    required this.yPos,
    required this.text,
    required this.borderRadius,
    required this.boxSize,
    this.style,
    this.isTopText = true,
    this.skipButtonColor,
    this.nextButtonColor,
    this.skipButtonStyle,
    this.nextButtonStyle,
    this.skipButton,
    this.nextButton,
    this.hintAlign,
    this.lineAlign,
  });

  IntroAnimationArgs copyWith({
    Color? borderColor,
    TextStyle? style,
    double? xPos,
    double? yPos,
    String? text,
    bool? isTopText,
    double? borderRadius,
    Color? skipButtonColor,
    Color? nextButtonColor,
    TextStyle? skipButtonStyle,
    TextStyle? nextButtonStyle,
    Widget? skipButton,
    Widget? nextButton,
    Size? boxSize,
    HintTextAndLineAlign? hintAlign,
    HintTextAndLineAlign? lineAlign,
  }) {
    return IntroAnimationArgs(
      borderColor: borderColor ?? this.borderColor,
      style: style ?? this.style,
      xPos: xPos ?? this.xPos,
      yPos: yPos ?? this.yPos,
      text: text ?? this.text,
      isTopText: isTopText ?? this.isTopText,
      borderRadius: borderRadius ?? this.borderRadius,
      skipButtonColor: skipButtonColor ?? this.skipButtonColor,
      nextButtonColor: nextButtonColor ?? this.nextButtonColor,
      skipButtonStyle: skipButtonStyle ?? this.skipButtonStyle,
      nextButtonStyle: nextButtonStyle ?? this.nextButtonStyle,
      skipButton: skipButton ?? this.skipButton,
      nextButton: nextButton ?? this.nextButton,
      boxSize: boxSize ?? this.boxSize,
      hintAlign: hintAlign ?? this.hintAlign,
      lineAlign: lineAlign ?? this.lineAlign,
    );
  }

  @override
  List<Object?> get props => [
        borderColor,
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
        boxSize,
        hintAlign,
        lineAlign,
      ];
}

enum HintTextAndLineAlign { start, center, end }
