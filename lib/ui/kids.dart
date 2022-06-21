import 'package:flutter/material.dart';

class Kids extends StatelessWidget {
  const Kids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7a489d),
      appBar: AppBar(
        title: const Text("اختر اللعبة  "),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/Untitled-1.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: ListView.builder(
              itemExtent: MediaQuery.of(context).size.height * 0.23,
              itemCount: 1,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/game");
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Color(0xffe3f93e),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/image/PSDMarchNook116.png",
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/image/wordmark.png",
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            Center(
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color(0xffe94d4f),
                                ),
                                child: const Center(
                                  child: Text('تعرف أكثر  ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
