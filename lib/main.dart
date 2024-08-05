import 'package:flutter/material.dart';
import 'package:welcome_animation_flutter/box_animation_view.dart';
import 'package:welcome_animation_flutter/intro_animation_args.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Border Animation',
      home: HomePage(),
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
  GlobalKey animationPostionKey = GlobalKey();
  RenderBox? object;

  Color allColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => setState(() {
                isAnimation1Show = !isAnimation1Show;
                object = animationPostionKey.currentContext?.findRenderObject() as RenderBox;
              }),
              child: Text("Show Animation"),
            ),
          ),
          Positioned(
            top: 600 - 50,
            left: 110 - 50,
            child: Container(
              key: animationPostionKey,
              color: Colors.transparent,
              width: 200,
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://oceanmtech.b-cdn.net/dmt/data_file/20240619173057-bzwax9.jpg",
                  height: 180,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 110,
            child: Container(
              // key: animationPostionKey,
              color: Colors.transparent,
              width: 200,
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://oceanmtech.b-cdn.net/dmt/data_file/20240619173057-bzwax9.jpg",
                  height: 180,
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: (isAnimation1Show || isAnimation2Show) ? Colors.black.withOpacity(0.7) : null,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                isAnimation1Show
                    ? BoxAnimationView(
                        introAnimationArgs: IntroAnimationArgs(
                          borderRadius: 15,
                          borderColor: allColor,
                          onTapForBarier: () => setState(() => isAnimation1Show = false),
                          onTapForBox: () {
                            isAnimation2Show = true;
                            isAnimation1Show = false;
                            setState(() {});
                          },
                          style: TextStyle(
                            color: allColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          xPos: object?.localToGlobal(Offset.zero).dx ?? 0,
                          yPos: (object?.localToGlobal(Offset.zero).dy ?? 0) - 112,
                          // yPos: (object?.localToGlobal(Offset.zero).dy ?? 0) - 92,
                          text: "Tap on NikunjNikunjNikunj\nNikunjNikunjNikunj",
                        ),
                      )
                    : const SizedBox.shrink(),
                isAnimation2Show
                    ? BoxAnimationView(
                        introAnimationArgs: IntroAnimationArgs(
                          borderRadius: 15,
                          borderColor: allColor,
                          onTapForBarier: () => setState(() => isAnimation2Show = false),
                          onTapForBox: () {
                            isAnimation2Show = false;
                            setState(() {});
                          },
                          style: TextStyle(
                            color: allColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          xPos: 110,
                          yPos: 50,
                          text: "Tap on",
                          isTopText: false,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
