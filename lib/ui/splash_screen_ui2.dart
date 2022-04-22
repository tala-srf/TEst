import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashUI2 extends StatefulWidget {
  const SplashUI2({Key? key}) : super(key: key);

  @override
  State<SplashUI2> createState() => _SplashUI2State();
}

class _SplashUI2State extends State<SplashUI2> {
  int x = 0;

  List _select = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];
  void initState() {
    super.initState();
    Widget _widge = _select[0];
  }

  nextScreen() {
    if (x < 2) {
      x++;
      setState(() {
        Widget _widge = _select[x];
      });
    }
  }

  prevScreen() {
    if (x > 0) {
      x--;
      setState(() {
        Widget _widge = _select[x];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xff7a489d),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/image/asd.png"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration:const Duration(seconds: 1),
                    child: _select[x],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          x < 2
                              ? nextScreen()
                              : setState(() {
                                  Navigator.of(context)
                                      .popAndPushNamed('/splash3');
                                });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        focusColor: Colors.black38),
                    x <= 0
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.circle_sharp,
                              color: Color(0xff7a489d),
                            ))
                        : IconButton(
                            onPressed: () {
                              prevScreen();
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            focusColor: Colors.black38,
                          ),
                  ],
                ),
              ],
            )));
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Lottie.asset(
          "assets/lottie/72283-social-media-engagement (1).json",
        ),
        const Center(
            child: Text(
          "شبكة اجتماعية آمنة",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff3ee97f),
              fontSize: 40,
              //fontStyle: FontStyle.italic
              ),
        )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              Center(
                  child: Text(
                "استمتع بتجربة تواصل اجتماعي آمنة من خلال ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              )),
              Center(
                  child: Text(
                "  تطبيق أجيال الذي يوفر لك المحتوي الهادف  ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              )),
            ],
          ),
        )
      ],
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          "assets/image/6497889.png",
        ),
        const Center(
            child: Text(
          "تعلم",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff3ee97f),
              fontSize: 40,
              //fontStyle: FontStyle.italic
              ),
        )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              Center(
                  child: Text(
                "احصل على أفضل مصادر التعليم من خلال الوسائط   ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              )),
              Center(
                  child: Text(
                " المرئية والمسموعة والمقروءة  ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              )),
            ],
          ),
        )
      ],
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          "assets/image/5143499.png",
        ),
        const Center(
            child: Text(
          "مشاركة",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff3ee97f),
              fontSize: 40,
              //fontStyle: FontStyle.italic
              ),
        )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              Center(
                  child: Text(
                "شارك نجاحاتك مع أصدقائك واحصل على العلامة ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              )),
              Center(
                  child: Text(
                "المميزة على ملفك الشخصي ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              )),
            ],
          ),
        )
      ],
    );
  }
}
