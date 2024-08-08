import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:welcome_animation_flutter/highlighted_box_cliper_1.dart';
import 'package:welcome_animation_flutter/lottie_animation_parms.dart';

class LottieAnimationWithCircle extends StatefulWidget {
  final LottieAnimationParms lottieAnimationParms;
  const LottieAnimationWithCircle({super.key, required this.lottieAnimationParms});

  @override
  State<LottieAnimationWithCircle> createState() => _LottieAnimationWithCircleState();
}

class _LottieAnimationWithCircleState extends State<LottieAnimationWithCircle> with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double>? _lineAnimation;
  late Animation<double>? _borderAnimation;
  GlobalKey globalKey = GlobalKey();
  Offset offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    loadAnimation();
  }

  void loadAnimation() {
    _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _borderAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Interval(0.0, 0.5)),
    );

    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Interval(0.5, 1.0)),
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
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: widget.lottieAnimationParms.onTapForImage,
      child: Center(
        child: Stack(
          children: [
            getClipPathOverlay(),
            widget.lottieAnimationParms.arrowPostion == ArrowPostion.leftTop
                ? buildLeftTopView()
                : const SizedBox.shrink(),
            widget.lottieAnimationParms.arrowPostion == ArrowPostion.leftBottom
                ? buildLeftBottomView()
                : const SizedBox.shrink(),
            widget.lottieAnimationParms.arrowPostion == ArrowPostion.rightTop
                ? buildRightTopView()
                : const SizedBox.shrink(),
            widget.lottieAnimationParms.arrowPostion == ArrowPostion.rightBottom
                ? buildRightBottomView()
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget buildLeftTopView() {
    return Positioned(
      left: widget.lottieAnimationParms.animationOffset.dx,
      top: widget.lottieAnimationParms.animationOffset.dy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.lottieAnimationParms.animationCircleSize.height,
            width: widget.lottieAnimationParms.animationCircleSize.width,
            child: Transform.rotate(
              angle: pi * 3,
              child: CircularProgressIndicator(
                key: globalKey,
                value: _lineAnimation?.value,
                strokeWidth: 3,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: widget.lottieAnimationParms.animationCircleSize.width / 2),
              Container(
                child: widget.lottieAnimationParms.animationWidget ??
                    Lottie.asset(
                      'assets/animations/arrow_animation_lottie.json',
                      controller: _borderAnimation,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLeftBottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 50),
            Transform.flip(
              flipY: true,
              child: Container(
                child: Lottie.asset(
                  'assets/animations/arrow_animation_lottie.json',
                  controller: _borderAnimation,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            key: globalKey,
            value: _lineAnimation?.value,
            strokeWidth: 5,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildRightTopView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Transform.rotate(
            angle: pi * 3,
            child: CircularProgressIndicator(
              key: globalKey,
              value: _lineAnimation?.value,
              strokeWidth: 5,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.flip(
              flipX: true,
              child: Lottie.asset(
                'assets/animations/arrow_animation_lottie.json',
                controller: _borderAnimation,
              ),
            ),
            SizedBox(width: 30),
          ],
        )
      ],
    );
  }

  Widget buildRightBottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.flip(
              flipY: true,
              flipX: true,
              child: Container(
                child: Lottie.asset(
                  'assets/animations/arrow_animation_lottie.json',
                  controller: _borderAnimation,
                ),
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            key: globalKey,
            value: _lineAnimation?.value,
            strokeWidth: 5,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ],
    );
  }

  Widget getClipPathOverlay() {
    return ClipPath(
      clipper: HighlightedBoxClipper(lottieAnimationParms: widget.lottieAnimationParms),
      child: Container(color: Colors.black.withOpacity(0.7)),
    );
  }
}
