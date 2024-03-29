import 'package:ajyal/bloc/bloc_badge/bloc/badge_bloc.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/badge_position.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ajyal/bloc/bloc_books/bloc/books_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';
import 'package:ajyal/models/books_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksUI extends StatelessWidget {
  const BooksUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BooksBloc>(context).add(LoadBooksEvent());
    BlocProvider.of<DatauserBloc>(context).add(LoaddatEvent());
    BlocProvider.of<BadgeBloc>(context).add(LoadBadgeEvent());

    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        if (state is LoadingBooks) {
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
        } else if (state is FetchBooks) {
          List<Data>? c = state.categoryBook.data;
          List<Widget> _tab = [];
          List<Widget> _view = [];
          for (int index = 0; index < c!.length; index++) {
            List<Books>? s = state.categoryBook.data?[index].books;

            _tab.add(Text("${state.categoryBook.data?[index].name}"));
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
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('${s[ind].title} ',
                                style: const TextStyle(
                                    color: Color(0xff26da76),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 8),
                            child: Text(
                              'المؤلف:${s[ind].author}',
                              style: const TextStyle(
                                  color: Color(0xff665589), fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Color(0xff26da76),
                                ),
                                child: const Center(
                                  child: Text('تعرف أكثر',
                                      style: TextStyle(
                                          color: Color(0xff665589),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
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
        if (state is LoadState) {
          return Center();
        } else if (state is Success12356State) {
          String? imge = state.data.data?.student?.images;
          var data = state.data.data;
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
                                  title: BlocBuilder<BadgeBloc, BadgeState>(
                                    builder: (context, state) {
                                      if (state is LoadingBadge) {
                                        return Center();
                                      } else if (state is FetchBadge) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Text("الاسم : ",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff665589),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17,
                                                      )),
                                                ),
                                                Text("${data?.name}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Text("الحالة : ",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff665589),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17,
                                                      )),
                                                ),
                                                Text("${data?.student?.bio}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11,
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
                                                      padding: EdgeInsets.only(
                                                          right: 8.0),
                                                      child: Text(
                                                          "أوسمة المهارات:",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff665589),
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
                                                  badgeTextColor:
                                                      Color(0xff665589),
                                                  position:
                                                      BadgePosition.topRight(),
                                                  itemCount: state.badge
                                                      .coursesCount!.length,
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
                                                      padding: EdgeInsets.only(
                                                          right: 8.0),
                                                      child: Text(
                                                          "أوسمة الكتب:",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff665589),
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
                                                  badgeTextColor:
                                                      Color(0xff665589),
                                                  position:
                                                      BadgePosition.topRight(),
                                                  itemCount: state
                                                      .badge.booksCount!.length,
                                                  borderRadius: 20,
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Image.asset(
                                            "assets/image/no-results-found.png");
                                      }
                                    },
                                  ),
                                );
                              });
                        },
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Color(0xff665589),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                              color: Color(0xff665589),
                              image: DecorationImage(
                                image: imge == null
                                    ? NetworkImage("")
                                    : NetworkImage(imge),
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
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
                            "مرحباً ${state.data.data?.name}",
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
                              child: Text('${b.title} ',
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
                                    Navigator.of(context).push<void>(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            PdfView(title: b.title,pdf: b.pdf),
                                      ),
                                    );
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
                                  child: Text("${b.author}",
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
                                      final _url = "${b.link}";
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
                          child: Text("${b.description}",
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

class PdfView extends StatefulWidget {
  PdfView({Key? key, required this.title, required this.pdf}) : super(key: key);
  final String? title;
  final String? pdf;

  @override
  _PdfView createState() => _PdfView();
}

class _PdfView extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.bookmark,
        //       color: Colors.white,
        //       semanticLabel: 'Bookmark',
        //     ),
        //     onPressed: () {
        //       _pdfViewerKey.currentState?.openBookmarkView();
        //     },
        //   ),
        // ],
      ),
      body: SfPdfViewer.network(
        widget.pdf!,
        key: _pdfViewerKey,
      ),
    );
  }
}
