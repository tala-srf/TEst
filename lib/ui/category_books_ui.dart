import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/badge_position.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ajyal/bloc/bloc_books/bloc/books_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';
import 'package:ajyal/models/books_model.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';

class BooksUI extends StatelessWidget {
  BooksUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BooksBloc>(context).add(LoadBooksEvent());
    BlocProvider.of<DatauserBloc>(context).add(LoaddataEvent());
  

   
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        if (state is LoadingBooks) {
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
        } else if (state is FetchBooks) {
          List<BooksModel> c = state.categoryBook;
  List<Widget> _tab = [];
    List<Widget> _view = [];
          for (int index = 0; index < c.length; index++) {
            List<Books>? s = state.categoryBook[index].books;

            _tab.add(Text("${state.categoryBook[index].name}"));
            List<Widget> _children = [];
             

            _view.add(GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: _children,
            ));
            for (int ind = 0; ind < s!.length; ind++) {
              _children.add(Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  splashColor: Colors.white24, // Splash color
                  onTap: () {
                    showDialog(
                        context: context,

                        //   barrierColor: Color(0xffc4e5ff),
                        builder: (ctxt) {
                          return WidgetOneBook(
                            b: s[ind],
                          );
                        });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    elevation: 10, // has value when shape is null
                    shadowColor: const Color(0xff190836),
                    clipBehavior: Clip.antiAlias,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/diary.png"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text('${s[ind].name} ',
                                style: const TextStyle(
                                    color: Color(0xff26da76),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 8),
                            child: Text(
                              'المؤلف:${s[ind].auther}',
                              style: const TextStyle(
                                  color: Color(0xff665589), fontSize: 15),
                            ),
                          ),
                          Card(
                            elevation: 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Text(
                                  'تعرف أكثر على الكتاب',
                                  style: TextStyle(
                                      color: Color(0xff26da76),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Color(0xff665589),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
            }
          }

          if (_tab.length != c.length) {
            //_tab.add( Text("${state.category[index].name}"));

            return const Text("");
          }

          return Column(
            children: [
              const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0, right: 9),
                    child: Section1(),
                  )),
              Expanded(
                  flex: 17,
                  child: Section2(
                    tab: _tab,
                    view: _view,
                  )),
            ],
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  
  }
}

class Section1 extends StatelessWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatauserBloc, DatauserState>(
      builder: (context, state) {
        if (state is Loading1State) {
          return Center();
        } else if (state is Successed123State) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Material(
                          // Button color
                          child: InkWell(
                        splashColor: Colors.white24, // Splash color
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
                                            padding:
                                                EdgeInsets.only(right: 15.0),
                                            child: Text("الاسم : ",
                                                style: TextStyle(
                                                  color: Color(0xff665589),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                )),
                                          ),
                                          Text("${state.data.login}",
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
                                            padding:
                                                EdgeInsets.only(right: 15.0),
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
                                          const Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                child: Text("كؤوس الكورسات: ",
                                                    style: TextStyle(
                                                      color: Color(0xff665589),
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            itemCount: 10,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            itemCount: 20,
                                            borderRadius: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const CircleAvatar(
                          radius: 32,
                          backgroundImage:
                              AssetImage("assets/image/Avatar-20.png"),
                          backgroundColor: Color(0xff665589),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 21,
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

class Section2 extends StatelessWidget {
  Section2({Key? key, required this.tab, required this.view}) : super(key: key);
  List<Widget> view;
  List<Widget> tab;
  @override
  Widget build(BuildContext context) {
    return ContainedTabBarView(
        tabs: tab,
        tabBarProperties: TabBarProperties(
          width: 200,
          height: 32,
          background: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(1, -1),
                ),
              ],
            ),
          ),
          position: TabBarPosition.top,
          alignment: TabBarAlignment.center,
          indicatorColor: Colors.transparent,
          labelColor: const Color(0xff15da6d),
          unselectedLabelColor: Colors.black.withOpacity(0.2),
        ),
        views: view);
  }
}

class WidgetOneBook extends StatelessWidget {
  WidgetOneBook({Key? key, required this.b}) : super(key: key);
  Books b;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: Padding(padding: EdgeInsets.all(0)),
        ),
        Expanded(
          flex: 9,
          child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff665589),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: ListView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: Text('${b.name} ',
                                  style: const TextStyle(
                                      color: Color(0xff26da76),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23)),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 30),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xff26da76))),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed("/pdf");
                                  },
                                  child: const Text('قراءة الكتاب',
                                      style: TextStyle(
                                          color: Color(0xff665589),
                                          fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Container(
                            height: 250,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/books.jpeg"))),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text("اسم المؤلف:",
                                      style: TextStyle(
                                          color: Color(0xff26da76),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text("${b.auther}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  const Text("هل أنت مستعد للحصول على الجائزة؟",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10)),
                                  ElevatedButton(
                                    onPressed: () async {
                                      const _url =
                                          "https://pub.dev/packages/url_launcher";
                                      if (await canLaunch(_url)) {
                                        await launch(_url,
                                            forceSafariVC: false);
                                      } else {
                                        print("object");
                                      }
                                    },
                                    child: const Text('اضغط للاختبار',
                                        style: TextStyle(
                                            color: Color(0xff26da76),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, right: 10.0),
                          child: Text("لمحة عن الكتاب:",
                              style: TextStyle(
                                  color: Color(0xff26da76),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text("${b.title}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                      ]),
                ],
              )),
        ),
      ],
    );
  }
}
