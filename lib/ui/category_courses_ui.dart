import 'package:ajyal/ui/magic_direction.dart';
import 'package:ajyal/ui/magic_ui.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/badge_position.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:ajyal/bloc/bloc_courses/bloc/coursesbloc_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';
import 'package:ajyal/models/courses_model.dart';
import 'package:rolling_switch/rolling_switch.dart';

import 'package:video_player/video_player.dart';

class CoursesUi extends StatelessWidget {
  CoursesUi({Key? key}) : super(key: key);
  final _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoursesblocBloc>(context).add(LoadCoursesEvent());
    BlocProvider.of<DatauserBloc>(context).add(LoaddataEvent());

    return BlocBuilder<CoursesblocBloc, CoursesblocState>(
      builder: (context, state) {
        if (state is LoadingCourses) {
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
        } else if (state is FetchCourses) {
          List<CoursesModel> c = state.category;
          List<Widget> _tab = [];
          List<Widget> _view = [];
          for (int index = 0; index < c.length; index++) {
            List<Courses>? s = state.category[index].courses;

            _tab.add(Text("${state.category[index].name}"));
            List<Widget> _children = [];

            //  GlobalKey<ContainedTabBarViewState> _key = GlobalKey();
            _view.add(ClickableListWheelScrollView(
                scrollController: _scrollController,
                itemHeight: 345,
                itemCount: state.category[index].courses!.length,
                onItemTapCallback: (value) {
                  showDialog(
                      context: context,

                      //   barrierColor: Color(0xffc4e5ff),
                      builder: (ctxt) {
                        for (int enrol = 0;
                            enrol < s![value].enrollment!.length;
                            enrol++) {
                          return Column(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Padding(padding: EdgeInsets.all(0.0)),
                              ),
                              Expanded(
                                flex: 9,
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xff665589),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(60))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 30, top: 10),
                                                  child: Text(
                                                      '${state.category[index].courses![value].name} ',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xff26da76),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width >
                                                                  1
                                                              ? 20
                                                              : 10)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0, left: 30),
                                                  child: Row(
                                                    children: [
                                                      LikeButton(
                                                        circleColor:
                                                            const CircleColor(
                                                                start: Color(
                                                                    0xff401F62),
                                                                end: Color(
                                                                    0xffA9FDE5)),
                                                        bubblesColor:
                                                            const BubblesColor(
                                                          dotPrimaryColor:
                                                              Color(0xff665589),
                                                          dotSecondaryColor:
                                                              Color(0xff7a489d),
                                                        ),

                                                        likeBuilder:
                                                            (bool isLiked) {
                                                          return Icon(
                                                            Icons.favorite,
                                                            color: isLiked
                                                                ? const Color(
                                                                    0xff26da76)
                                                                : Colors.grey,
                                                            size: 32,
                                                          );
                                                        },

                                                        isLiked: (s[value]
                                                                .enrollment?[
                                                                    enrol]
                                                                .name ==
                                                            "user"),
                                                        //هون في خطأ بالتسجيل
                                                      ),
                                                      Text("الاشتراك في الكورس",
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xff26da76),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          MediaQuery.of(context)
                                                                              .size
                                                                              .width >
                                                                      1
                                                                  ? 13
                                                                  : 6)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/image/online.png"))),
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.0),
                                              child: Text("لمحة عن الكورس",
                                                  style: TextStyle(
                                                      color: Color(0xff26da76),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0, left: 16),
                                              child: ListView(
                                                children: [
                                                  Text(
                                                      "${state.category[index].courses?[value].description}",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.0),
                                              child: Text("فصول الكورس",
                                                  style: TextStyle(
                                                      color: Color(0xff26da76),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: LectCourse(
                                              c: state.category[index]
                                                  .courses?[value],
                                            ),
                                          )
                                        ])),
                              ),
                            ],
                          );
                        }
                        return const Text("data");
                      });
                },
                child: ListWheelScrollView.useDelegate(
                  controller: _scrollController,
                  itemExtent: 345,
                  squeeze: 1,
                  physics: const FixedExtentScrollPhysics(),
                  perspective: 0.003,
                  childDelegate:
                      ListWheelChildLoopingListDelegate(children: _children),
                )));
            for (int ind = 0; ind < s!.length; ind++) {
              _children.add(Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  elevation: 10, // has value when shape is null
                  shadowColor: const Color(0xff190836),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/image/earth.png"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                            '${state.category[index].courses![ind].name} ',
                            style: const TextStyle(
                                color: Color(0xff26da76),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.category[index].courses![ind].teacher?.fname}',
                              style: const TextStyle(
                                  color: Color(0xff665589), fontSize: 16),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_pin_outlined,
                                  color: Color(0xff665589),
                                ),
                                Text(
                                  'عدد الجلسات :${state.category[index].courses![ind].lectures?.length}',
                                  style: const TextStyle(
                                      color: Color(0xff665589), fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Card(
                          elevation: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text('تعرف أكثر على الكورس',
                                  style: TextStyle(
                                      color: Color(0xff26da76),
                                      fontWeight: FontWeight.bold)),
                              Icon(
                                Icons.emoji_emotions_outlined,
                                color: Color(0xff665589),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            }
          }

          if (_tab.length == c.length) {
            //_tab.add( Text("${state.category[index].name}"));

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

class LectCourse extends StatefulWidget {
  const LectCourse({Key? key, required this.c}) : super(key: key);
  final Courses? c;

  @override
  State<LectCourse> createState() => _LectCourseState();
}

class _LectCourseState extends State<LectCourse> {
  @override
  Widget build(BuildContext context) {
    //  final isMuted = controller.value.volume == 0;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 80,
      ),
      itemCount: widget.c?.lectures?.length,
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: widget.c?.lectures?[i].finished == "yes"
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: const Color(0xff665589),
                    shadowColor: const Color(0xff665589),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(100, 40), //////// HERE
                  ),
                  onPressed: () => showDialog(
                      context: context,

                      //   barrierColor: Color(0xffc4e5ff),
                      builder: (ctxt) {
                        return MediaQuery.of(context).size.height /
                                    MediaQuery.of(context).size.width >
                                1
                            ? AlertDialog(
                                contentPadding: const EdgeInsets.all(0),
                                insetPadding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                ),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(60.0),
                                        topRight: Radius.circular(60.0))),
                                scrollable: true,
                                content: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff665589),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(60),
                                              topRight: Radius.circular(60))),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 30, top: 10),
                                              child: Text(
                                                  '${widget.c?.lectures?[i].title} ',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0, bottom: 8),
                                              child: Video(
                                                i: i,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  const Text("مختصر الفصل",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff26da76),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 23)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: RollingSwitch.icon(
                                                      enableDrag: true,
                                                      onChanged:
                                                          (bool state) {},
                                                      rollingInfoRight:
                                                          const RollingIconInfo(
                                                        icon: Icons.check,
                                                        backgroundColor:
                                                            Color(0xff26da76),
                                                        text: Text('تم'),
                                                      ),
                                                      rollingInfoLeft:
                                                          const RollingIconInfo(
                                                        icon: Icons
                                                            .watch_later_outlined,
                                                        backgroundColor:
                                                            Colors.grey,
                                                        text: Text('أشاهد'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0, left: 16),
                                                child: Text(
                                                    "${widget.c?.lectures?[i].description}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17)),
                                              ),
                                            ),
                                          ]));
                                }))
                            : Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 8),
                                  child: Video(
                                    i: i,
                                  ),
                                ),
                              );
                      }),
                  child: Text("${widget.c?.lectures?[i].title}",
                      style: const TextStyle(
                          color: Color(0xff26da76),
                          fontWeight: FontWeight.bold)),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white10,
                    onPrimary: const Color(0xff665589),
                    shadowColor: const Color(0xff665589),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(100, 40), //////// HERE
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("${widget.c?.lectures?[i].title}",
                          style: const TextStyle(
                              color: Color(0xff26da76),
                              fontWeight: FontWeight.bold)),
                      //  Icon(Icons.block_rounded,color: Colors.red.shade900,)
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class Video extends StatefulWidget {
  int i;
  Video({Key? key, required this.i}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  final List<String> _asset = [
    'assets/video/vvv.mp4',
    'assets/video/pp.mp4',
    'assets/video/vvv.mp4',
    'assets/video/pp.mp4',
    'assets/video/vvv.mp4',
  ];

  final asset = 'assets/video/vvv.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(_asset[widget.i])
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(
      controller: controller,
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(
              alignment: Alignment.topCenter, height: 250, child: buildvideo())
          // ignore: sized_box_for_whitespace
          : Container(
              height: 250,
              child: Center(
                child: Lottie.asset("assets/lottie/loading.json"),
              ),
            );
  Widget buildvideo() => Stack(
        children: <Widget>[
          buildvideoPlayer(),
          Positioned.fill(child: BasicOverLayWidget(controller: controller))
        ],
      );
  Widget buildvideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}

class BasicOverLayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const BasicOverLayWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator())
          ],
        ),
      );
  Widget buildIndicator() =>
      VideoProgressIndicator(controller, allowScrubbing: true);
  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white30,
            size: 20,
          ),
        );
}
