import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome_animation_flutter/animation_view_cubit.dart';
import 'package:welcome_animation_flutter/box_animation_view.dart';
import 'package:welcome_animation_flutter/main.dart';

class AnimationView extends StatelessWidget {
  final List<BoxAnimationView?> listOfAnimationPart;
  const AnimationView({super.key, required this.listOfAnimationPart});

  final Color allColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationViewCubit, int>(
      bloc: animationViewCubit,
      builder: (context, state) {
        if (listOfAnimationPart.isEmpty || (state == -1)) {
          return const SizedBox.shrink();
        }
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              listOfAnimationPart[state]!,
              Align(
                alignment: Alignment.bottomCenter,
                child: buttonView(state: state),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buttonView({required int state}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () => animationViewCubit.updateScreenIndex(nextScreen: -1),
            child: Container(
              height: 30,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 20),
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              print("==========${(state + 1) != listOfAnimationPart.length}");
              if ((state + 1) != listOfAnimationPart.length) {
                animationViewCubit.updateScreenIndex(nextScreen: state + 1);
              } else {
                animationViewCubit.updateScreenIndex(nextScreen: -1);
              }
            },
            child: Container(
              height: 30,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                (state + 1) == listOfAnimationPart.length ? "Done" : "Next",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
