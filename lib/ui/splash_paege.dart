import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff7a489d),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/بدون عنوان.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          )),
          child: const Center(
            child: Image(
              image: AssetImage("assets/image/Asset5.png"),
              fit: BoxFit.fill,
              height: 150,
              width: 150,
              alignment: Alignment.center,
            ),
          ),
        ));
  }
}
