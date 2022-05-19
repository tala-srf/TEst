// ignore_for_file: prefer_const_constructors

import 'package:ajyal/models/signin_model.dart';
import 'package:ajyal/ui/magic_direction.dart';
import 'package:ajyal/ui/magic_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/badge_position.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ajyal/bloc/bloc_all_user/bloc/alluser_bloc.dart';

import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';

class ProfileUi extends StatelessWidget {
 ProfileUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DatauserBloc>(context).add(LoaddataEvent());
    BlocProvider.of<AlluserBloc>(context).add(Loaddata1Event());
    return MagicWidget(
      MediaQuery.of(context).size.height / MediaQuery.of(context).size.width > 1
          ? MagicDirection.vertical
          : MagicDirection.horizental,
      // ignore: prefer_const_literals_to_create_immutables
      [
        Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Header(),
            )),
        Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 8),
              child: Center1(),
            )),
        Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: End(),
            ))
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Section1(),
              )),
          Expanded(
            flex: 7,
            child: Container(
              //  height: MediaQuery.of(context).size.height * 0.27,
              decoration: const BoxDecoration(
                  color: Color(0xff26da76),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("علاماتي المميزة",
                        style: TextStyle(
                          color: Color(0xff665589),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text("كؤوس الكورسات: ",
                                        style: TextStyle(
                                          color: Color(0xff665589),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: FlutterBadge(
                                      icon: Image.asset(
                                        "assets/image/collection.jpg",
                                        height: 50,
                                        width: 50,
                                      ),
                                      badgeColor: Colors.greenAccent,
                                      badgeTextColor: Color(0xff665589),
                                      position: BadgePosition.topRight(),
                                      itemCount: 20,
                                      borderRadius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text("كؤوس الكتب: ",
                                        style: TextStyle(
                                          color: Color(0xff665589),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: FlutterBadge(
                                      icon: Image.asset(
                                        "assets/image/diary.png",
                                        height: 70,
                                        width: 70,
                                      ),
                                      badgeColor: Colors.greenAccent,
                                      badgeTextColor: Color(0xff665589),
                                      position: BadgePosition.topRight(),
                                      itemCount: 20,
                                      borderRadius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          )
        ]);
  }
}

class Section1 extends StatelessWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatauserBloc, DatauserState>(
      builder: (context, state) {
        if (state is Loading1State) {
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
        } else if (state is Successed123State) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage("assets/image/Avatar-20.png"),
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5),
                          child: Text(
                            "مرحباً ${state.data.login}",
                            style: const TextStyle(
                                color: Color(0xff26da76),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              });
        } else {
          return Image.asset("assets/image/no-results-found.png");
        }
      },
    );
  }
}

class Center1 extends StatelessWidget {
  const Center1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: MediaQuery.of(context).size.height * 0.27,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50), topLeft: Radius.circular(50))),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("معلوماتي الشخصية",
                style: TextStyle(
                  color: Color(0xff26da76),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text("الاسم : ",
                      style: TextStyle(
                        color: Color(0xff665589),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                ),
                Text("دينا غازي ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
              ],
            ),
            
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text("الحالة : ",
                      style: TextStyle(
                        color: Color(0xff665589),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                ),
                Text(" أشرق وكأن الكون كله لك ...  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class End extends StatelessWidget {
  const End({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 4),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff26da76),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Center(
                            child: Text(" أوائل القراءة",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xff665589),
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height /
                                              MediaQuery.of(context).size.width >
                                          1
                                      ? 20
                                      : 10,
                                )),
                          ),
                        ),
                      ),
                    )),
                Expanded(flex: 17, child: Section2()),
              ],
            )),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0,left: 4),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff26da76),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Center(
                            child: Text(" أوائل الكورسات",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xff665589),
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height /
                                              MediaQuery.of(context).size.width >
                                          1
                                      ? 20
                                      : 10,
                                )),
                          ),
                        ),
                      ),
                    )),
                Expanded(flex: 18, child: Section2()),
              ],
            )),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlluserBloc, AlluserState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
        } else if (state is SuccessedState) {
          List<DataUserModel>? _id = state.data1;

          _id?.sort((a, b) => (b.id!).compareTo(a.id!));

          return ListView.builder(
              // itemCount: state.data1?.length == null ? 0 : ((state.data1?.length)! > 3 ? 3 : state.data1?.length),

              itemCount: 3,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        showDialog(
                            context: context,
                            // barrierColor: Color(0xffc4e5ff),
                            builder: (ctxt) {
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 15.0),
                                          child: Text("الاسم : ",
                                              style: TextStyle(
                                                color: Color(0xff665589),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              )),
                                        ),
                                        Text("${_id?[i].login}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 15.0),
                                          child: Text("الحالة : ",
                                              style: TextStyle(
                                                color: Color(0xff665589),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              )),
                                        ),
                                        Text("أشرق وكأن الكون كله لك ..",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Text("كؤوس الكورسات: ",
                                                  style: TextStyle(
                                                    color: Color(0xff665589),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  )),
                                            )),
                                        FlutterBadge(
                                          icon: Image.asset(
                                            "assets/image/collection.jpg",
                                            height: 30,
                                            width: 30,
                                          ),
                                          badgeColor: Colors.white70,
                                          badgeTextColor: Color(0xff665589),
                                          position: BadgePosition.topRight(),
                                          itemCount: _id?[i].id  ?? 0,
                                          borderRadius: 20,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Text("كؤوس الكتب: ",
                                                  style: TextStyle(
                                                    color: Color(0xff665589),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  )),
                                            )),
                                        FlutterBadge(
                                          icon: Image.asset(
                                            "assets/image/diary.png",
                                            height: 50,
                                            width: 50,
                                          ),
                                          badgeColor: Colors.white70,
                                          badgeTextColor: Color(0xff665589),
                                          position: BadgePosition.topRight(),
                                          itemCount:  _id?[i].id  ?? 0,
                                          borderRadius: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.04,
                              color: Color(0xfff5ba33), //f9e949
                            ),
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                  color: Color(0xff75c4b5), //75c4b5
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/Avatar-20.png"),
                                  )),
                            ),
                            Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.28,
                              color: Color(0xfff5ba33), //f9e949
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text("${_id?[i].login}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              });
        } else {
          return Image.asset("assets/image/no-results-found.png");
        }
      },
    );
  }
}
