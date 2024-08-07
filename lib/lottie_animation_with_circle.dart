import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationWithCircle extends StatefulWidget {
  final bool isTopAnimation;
  const LottieAnimationWithCircle({super.key, required this.isTopAnimation});

  @override
  State<LottieAnimationWithCircle> createState() => _LottieAnimationWithCircleState();
}

class _LottieAnimationWithCircleState extends State<LottieAnimationWithCircle> with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double>? _lineAnimation;
  late Animation<double>? _borderAnimation;

  @override
  void initState() {
    super.initState();
    loadAnimation();
  }

  void loadAnimation() {
    _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _borderAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Interval(0.0, 0.3)),
    );

    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Interval(0.3, 1.0)),
    );
    _lineAnimation?.addListener(() => setState(() {}));
    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            widget.isTopAnimation
                ? SizedBox(
                    height: 80,
                    width: 80,
                    child: Transform.rotate(
                      angle: pi * 3,
                      child: CircularProgressIndicator(
                        value: _lineAnimation?.value,
                        strokeWidth: 5,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 30),
                Transform.flip(
                  flipY: !widget.isTopAnimation,
                  child: Container(
                    child: Lottie.asset(
                      'assets/animations/arrow_animation_lottie.json',
                      controller: _borderAnimation,
                    ),
                  ),
                ),
              ],
            ),
            !widget.isTopAnimation
                ? SizedBox(
                    height: 80,
                    width: 80,
                    child: Transform.rotate(
                      angle: 0,
                      child: CircularProgressIndicator(
                        value: _lineAnimation?.value,
                        strokeWidth: 3,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
