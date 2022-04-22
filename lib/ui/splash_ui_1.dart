import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashUI1 extends StatefulWidget {
  const SplashUI1({Key? key}) : super(key: key);

  @override
  State<SplashUI1> createState() => _SplashUI1State();
}

class _SplashUI1State extends State<SplashUI1> {
  late Timer timer;
  int count = 0;

  @override
  void initState() {
    super.initState();

    timer =
        Timer.periodic(Duration(seconds: 4), (_) => setState(() => count += 1));
    timer = Timer.periodic(
        Duration(seconds: 8),
        (_) =>
            setState(() => Navigator.of(context).popAndPushNamed('/splash2')));
  }

  Widget _renderWidget() {
    return count == 1 ? _renderWidget2() : _renderWidget1();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  Widget _renderWidget1() {
    return const RotationTransition(
      turns: AlwaysStoppedAnimation(15 / 360),
      child: Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Image(
          image: AssetImage(
            "assets/image/Asset-.png",
          ),
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget _renderWidget2() {
    return const Image(
      image: AssetImage("assets/image/Asset 5 (2).png"),
      fit: BoxFit.fill,
      height: 150,
      width: 150,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff7a489d),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/image/بدون عنوان.png"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween(
                    begin: Offset(-1, 0),
                    end: Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: _renderWidget(),
            )));
  }
}
