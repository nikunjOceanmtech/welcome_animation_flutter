import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome_animation_flutter/animation_view.dart';
import 'package:welcome_animation_flutter/animation_view_cubit.dart';
import 'package:welcome_animation_flutter/box_animation_view.dart';
import 'package:welcome_animation_flutter/intro_animation_args.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  DeviceType getDeviceType({required BuildContext context}) {
    final data = MediaQueryData.fromView(View.of(context));
    return data.size.shortestSide < 550 ? DeviceType.mobile : DeviceType.tablet;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: getDeviceType(context: context) == DeviceType.tablet ? const Size(834, 1194) : const Size(414, 896),
      child: MaterialApp(
        title: 'Border Animation',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isAnimation1Show = false;
  bool isAnimation2Show = false;
  GlobalKey animationPostionKey1 = GlobalKey();
  GlobalKey animationPostionKey2 = GlobalKey();
  RenderBox? object1;
  RenderBox? object2;

  String hintText1 = "Click Here";

  Color allColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => setState(
                () {
                  animationViewCubit.updateScreenIndex(nextScreen: 0);
                  object1 = animationPostionKey1.currentContext?.findRenderObject() as RenderBox;
                  object2 = animationPostionKey2.currentContext?.findRenderObject() as RenderBox;
                },
              ),
              child: Text("Show Animation"),
            ),
          ),
          Positioned(
            top: 600 - 50,
            left: 110 - 50,
            child: Container(
              key: animationPostionKey1,
              color: Colors.transparent,
              width: 200.h,
              height: 200.h,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://oceanmtech.b-cdn.net/dmt/data_file/20240619173057-bzwax9.jpg",
                  height: 180.h,
                ),
              ),
            ),
          ),
          Positioned(
            top: 600 - 450,
            left: 110,
            child: Container(
              key: animationPostionKey2,
              color: Colors.transparent,
              width: 200.h,
              height: 200.h,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://oceanmtech.b-cdn.net/dmt/data_file/20240619173057-bzwax9.jpg",
                  height: 180.h,
                ),
              ),
            ),
          ),
          AnimationView(
            listOfAnimationPart: [
              BoxAnimationView(
                key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
                introAnimationArgs: IntroAnimationArgs(
                  borderRadius: 15,
                  borderColor: allColor,
                  style: TextStyle(
                    color: allColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  xPos: (object1?.localToGlobal(Offset.zero).dx) ?? 0,
                  yPos: (object1?.localToGlobal(Offset.zero).dy ?? 0),
                  text: hintText1,
                  boxSize: Size(100.h, 200.h),
                  lineAlign: HintTextAndLineAlign.start,
                  hintAlign: HintTextAndLineAlign.end,
                  isTopText: false,
                ),
              ),
              BoxAnimationView(
                key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
                introAnimationArgs: IntroAnimationArgs(
                  borderRadius: 15,
                  borderColor: allColor,
                  style: TextStyle(
                    color: allColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  xPos: (object2?.localToGlobal(Offset.zero).dx ?? 0),
                  yPos: (object2?.localToGlobal(Offset.zero).dy ?? 0) - (hintText1.length < 40 ? 95 : 115),
                  text: hintText1,
                  boxSize: Size(100.h, 200.h),
                  lineAlign: HintTextAndLineAlign.start,
                  hintAlign: HintTextAndLineAlign.end,
                  isTopText: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final AnimationViewCubit animationViewCubit = AnimationViewCubit();
