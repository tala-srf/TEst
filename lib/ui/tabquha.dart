import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int x = 0;

  // ignore: prefer_final_fields
  List _select = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];
  @override
  void initState() {
    super.initState();

    // ignore: unused_local_variable
    Widget _widge = _select[0];
  }

  nextScreen() {
    if (x < 2) {
      x++;
      setState(() {
        // ignore: unused_local_variable
        Widget _widge = _select[x];
      });
    }
  }

  prevScreen() {
    if (x > 0) {
      x--;
      setState(() {
        // ignore: unused_local_variable
        Widget _widge = _select[x];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7a489d),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/Untitled-1.png"),
          fit: BoxFit.fill,
          alignment: Alignment.center,
        )),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 90,
                color: Colors.white,
                child: Row(     crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround ,children: [

                   const Text("ملاحظة: تحتاج لشراء الجهاز الخاص باللعبة",style: TextStyle(fontSize: 13,color: Color(0xff7a489d)),),
                     InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffe94d4f),
                    ),
                    child: const Center(
                      child: Text('أماكن الشراء ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),

                  ],),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
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
                            nextScreen();
                            // x < 2
                            //     ? nextScreen()
                            //     : setState(() {
                            //         Navigator.of(context)
                            //             .popAndPushNamed('/splash3');
                            //       });
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
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffe94d4f),
                    ),
                    child: const Center(
                      child: Text('حمل التطبيق',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
        Image.asset("assets/image/Group 1900.png",
            height: MediaQuery.of(context).size.height * 0.2),
        const Center(
            child: Text(
          "تعلم في ثلاث خطوات",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff7a489d),
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
                "أوصل جهازك المحمول مع اللعبة",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
            
                  fontSize: 19,
                ),
              )),
              Center(
                  child: Text(
                "  باستخدتم البلوتوث",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
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
        Image.asset("assets/image/63.png",
            height: MediaQuery.of(context).size.height * 0.2),
        const Center(
            child: Text(
          " تعلم في ثلاث خطوات",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff7a489d),
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
                "ضع جهازك المحمول في المكان ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              )),
              Center(
                  child: Text(
                " المخصص له وشاهد الفيديو ",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
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
        Image.asset("assets/image/rfid-card-500x500.png",
            height: MediaQuery.of(context).size.height * 0.2),
        const Center(
            child: Text(
          "تعلم في ثلاث خطوات",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff7a489d),
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
                "أحب عن الأسئلة من خلال مطابقة الصورة",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              )),
              Center(
                  child: Text(
                "على الشاشة مع البطاقة المناسبة",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
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
