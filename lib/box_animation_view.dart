import 'dart:math';

import 'package:flutter/material.dart';
import 'package:welcome_animation_flutter/intro_animation_args.dart';
import 'package:welcome_animation_flutter/painter.dart';
import 'package:welcome_animation_flutter/text_animation_view.dart';

class BoxAnimationView extends StatefulWidget {
  final IntroAnimationArgs introAnimationArgs;

  const BoxAnimationView({super.key, required this.introAnimationArgs});

  @override
  State<BoxAnimationView> createState() => _BoxAnimationViewState();
}

class _BoxAnimationViewState extends State<BoxAnimationView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;
  late Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.3)),
    );

    _borderAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.3, 1.0)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: widget.introAnimationArgs.xPos,
          top: widget.introAnimationArgs.yPos,
          child: Column(
            crossAxisAlignment: (widget.introAnimationArgs.hintAlign == HintTextAndLineAlign.end)
                ? CrossAxisAlignment.end
                : (widget.introAnimationArgs.hintAlign == HintTextAndLineAlign.start)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topPartView(),
              boxView(borderColor: widget.introAnimationArgs.borderColor),
              bottomPartView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomPartView() {
    return Column(
      crossAxisAlignment: (widget.introAnimationArgs.hintAlign == HintTextAndLineAlign.end)
          ? CrossAxisAlignment.end
          : (widget.introAnimationArgs.hintAlign == HintTextAndLineAlign.start)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      children: [
        !widget.introAnimationArgs.isTopText
            ? Transform.rotate(
                angle: pi / 1,
                child: lineView(borderColor: widget.introAnimationArgs.borderColor),
              )
            : const SizedBox.shrink(),
        !widget.introAnimationArgs.isTopText ? SizedBox(height: 15) : const SizedBox.shrink(),
        !widget.introAnimationArgs.isTopText
            ? TextAnimationView(style: widget.introAnimationArgs.style, text: widget.introAnimationArgs.text)
            : const SizedBox.shrink(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget topPartView() {
    return Column(
      crossAxisAlignment: (widget.introAnimationArgs.lineAlign == HintTextAndLineAlign.end)
          ? CrossAxisAlignment.end
          : (widget.introAnimationArgs.lineAlign == HintTextAndLineAlign.start)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      children: [
        Container(
          child: widget.introAnimationArgs.isTopText
              ? TextAnimationView(style: widget.introAnimationArgs.style, text: widget.introAnimationArgs.text)
              : const SizedBox.shrink(),
        ),
        widget.introAnimationArgs.isTopText ? SizedBox(height: 15) : const SizedBox.shrink(),
        widget.introAnimationArgs.isTopText
            ? lineView(borderColor: widget.introAnimationArgs.borderColor)
            : const SizedBox.shrink(),
        widget.introAnimationArgs.isTopText ? SizedBox(height: 7) : const SizedBox.shrink(),
      ],
    );
  }

  Widget lineView({required Color borderColor}) {
    return SizedBox(
      height: 50,
      child: AnimatedBuilder(
        animation: _lineAnimation,
        builder: (context, child) {
          return CustomPaint(
            painter: LinePainter(
              borderColor: borderColor,
              animationValue: _lineAnimation.value,
            ),
          );
        },
      ),
    );
  }

  Widget boxView({required Color borderColor}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Transform.rotate(
        angle: !widget.introAnimationArgs.isTopText ? pi / 1 : 0,
        child: Row(
          children: [
            SizedBox(
              width: widget.introAnimationArgs.boxSize.width,
              height: widget.introAnimationArgs.boxSize.height,
              child: AnimatedBuilder(
                animation: _borderAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: BorderPainter(
                      borderRadius: widget.introAnimationArgs.borderRadius,
                      borderColor: widget.introAnimationArgs.borderColor,
                      isLeftBox: true,
                      animation: _borderAnimation.value,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: widget.introAnimationArgs.boxSize.width,
              height: widget.introAnimationArgs.boxSize.height,
              child: AnimatedBuilder(
                animation: _borderAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: BorderPainter(
                      borderRadius: widget.introAnimationArgs.borderRadius,
                      borderColor: widget.introAnimationArgs.borderColor,
                      isLeftBox: false,
                      animation: _borderAnimation.value,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Widget boxView() {
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(15),
//     child: Transform.rotate(
//       angle: !widget.introAnimationArgs.isTopText ? pi / 1 : 0,
//       child: Row(
//         children: [
//           SizedBox(
//             width: widget.introAnimationArgs.boxSize.width,
//             height: widget.introAnimationArgs.boxSize.height,
//             child: AnimatedBuilder(
//               animation: _borderAnimation,
//               builder: (context, child) {
//                 return CustomPaint(
//                   painter: BorderPainter(
//                     borderRadius: widget.introAnimationArgs.borderRadius,
//                     borderColor: widget.introAnimationArgs.borderColor,
//                     isLeftBox: true,
//                     animation: _borderAnimation.value,
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             width: widget.introAnimationArgs.boxSize.width,
//             height: widget.introAnimationArgs.boxSize.height,
//             child: AnimatedBuilder(
//               animation: _borderAnimation,
//               builder: (context, child) {
//                 return CustomPaint(
//                   painter: BorderPainter(
//                     borderRadius: widget.introAnimationArgs.borderRadius,
//                     borderColor: widget.introAnimationArgs.borderColor,
//                     isLeftBox: false,
//                     animation: _borderAnimation.value,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
