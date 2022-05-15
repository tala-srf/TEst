import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash3UI extends StatelessWidget {
const Splash3UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff7a489d),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/Untitled-1.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                " من فضلك اختر الفئة العمرية ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
         //           //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
              ),
              const Text(
                "المناسبة",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
         //           //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Hero(
                          tag: "element",
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 5),
                            child: Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(28),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .popAndPushNamed('/newaccount');
                                },
                                splashColor: Colors.black26,
                                child: Image.asset(
                                  "assets/image/character-2218201.png",
                                  height: 250,
                                  width: 150,
                                ),
                              ),
                            ),
                          )),
                      const Text(
                        "يافعين",
                        style: TextStyle(
                            color: Color(0xff7a489d),
                            fontSize: 25,
                 //           //fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Hero(
                        tag: "element1",
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(28),
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.black26,
                            child: Lottie.asset(
                              "assets/lottie/lf20_laBOSy.json",
                              height: 250,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "أطفال",
                        style: TextStyle(
                            color: Color(0xff26da76),
                            fontSize: 25,
                 //           //fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
