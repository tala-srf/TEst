import 'package:ajyal/bloc/bloc_badge/bloc/badge_bloc.dart';
import 'package:ajyal/bloc/bloc_delet_enrollment/bloc/deletenrollment_bloc.dart';
import 'package:ajyal/bloc/bloc_enrollment/bloc/enrollment_bloc.dart';
import 'package:ajyal/bloc/bloc_lecture/bloc/finishedlecture_bloc.dart';
import 'package:ajyal/models/enrollment_model.dart';
import 'package:ajyal/models/finished_lecture_model.dart';
import 'package:ajyal/ui/magic_direction.dart';
import 'package:ajyal/ui/magic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/badge_position.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:ajyal/bloc/bloc_courses/bloc/coursesbloc_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';
import 'package:ajyal/bloc/bloc_posts/bloc/posts_bloc.dart';
import 'package:ajyal/models/courses_model.dart';
import 'package:ajyal/models/post_model.dart';

import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class FavoriteUI extends StatelessWidget {
  FavoriteUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsBloc>(context).add(LoadEvent());
    BlocProvider.of<DatauserBloc>(context).add(LoaddataEvent());
    BlocProvider.of<CoursesblocBloc>(context).add(LoadCoursesEvent());
    BlocProvider.of<BadgeBloc>(context).add(LoadBadgeEvent());
    return MagicWidget(
      MediaQuery.of(context).size.height / MediaQuery.of(context).size.width > 1
          ? MagicDirection.vertical
          : MagicDirection.horizental,
      [
        const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 7, right: 16, bottom: 16),
              child: Section1(),
            )),
        Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: const [
                          Text(" المنشورات المفضلة",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xff665589),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              )),

                          //  ButtonWidget()
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 8, child: Section2())
              ],
            )),
        Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: const Text("مهاراتي  ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xff665589),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )),
                    ),
                  ),
                ),
                const Expanded(flex: 8, child: Section3()),
              ],
            ))
      ],
    );
  }
}

// class Section1 extends StatelessWidget {
//   const Section1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DatauserBloc, DatauserState>(
//       builder: (context, state) {
//         if (state is Loading1State) {
//           return Center();
//         } else if (state is Successed123State) {
//           return ListView.builder(
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ClipOval(
//                       child: Material(
//                           // Button color
//                           child: InkWell(
//                         splashColor: Colors.white24, // Splash color
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               // barrierColor: Color(0xffc4e5ff),
//                               builder: (ctxt) {
//                                 return AlertDialog(
//                                   title: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           const Padding(
//                                             padding:
//                                                 EdgeInsets.only(right: 15.0),
//                                             child: Text("الاسم : ",
//                                                 style: TextStyle(
//                                                   color: Color(0xff665589),
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 17,
//                                                 )),
//                                           ),
//                                           Text("${state.data.data?.name}",
//                                               style: const TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 17,
//                                               )),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                          const Padding(
//                                             padding:
//                                                 EdgeInsets.only(right: 15.0),
//                                             child: Text("الحالة : ",
//                                                 style: TextStyle(
//                                                   color: Color(0xff665589),
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 17,
//                                                 )),
//                                           ),
//                                           Text("${state.data.data?.student?.bio}",
//                                               style:const TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 17,
//                                               )),
//                                         ],
//                                       ),
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           const Expanded(
//                                               flex: 5,
//                                               child: Padding(
//                                                 padding:
//                                                     EdgeInsets.only(right: 8.0),
//                                                 child: Text("كؤوس الكورسات: ",
//                                                     style: TextStyle(
//                                                       color: Color(0xff665589),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 17,
//                                                     )),
//                                               )),
//                                           FlutterBadge(
//                                             icon: Image.asset(
//                                               "assets/image/collection.jpg",
//                                               height: 30,
//                                               width: 30,
//                                             ),
//                                             badgeColor: Colors.white70,
//                                             badgeTextColor: Color(0xff665589),
//                                             position: BadgePosition.topRight(),
//                                             itemCount: 10,
//                                             borderRadius: 20,
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           const Expanded(
//                                               flex: 5,
//                                               child: Padding(
//                                                 padding:
//                                                     EdgeInsets.only(right: 8.0),
//                                                 child: Text("كؤوس الكتب: ",
//                                                     style: TextStyle(
//                                                       color: Color(0xff665589),
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 17,
//                                                     )),
//                                               )),
//                                           FlutterBadge(
//                                             icon: Image.asset(
//                                               "assets/image/diary.png",
//                                               height: 50,
//                                               width: 50,
//                                             ),
//                                             badgeColor: Colors.white70,
//                                             badgeTextColor: Color(0xff665589),
//                                             position: BadgePosition.topRight(),
//                                             itemCount: 20,
//                                             borderRadius: 20,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               });
//                         },
//                         child: const CircleAvatar(
//                           radius: 32,
//                           backgroundImage:
//                               AssetImage("assets/image/Avatar-20.png"),
//                           backgroundColor: Color(0xff665589),
//                         ),
//                       )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5),
//                       child: Container(
//                         height: 22,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(5),
//                           ),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 5.0, left: 5),
//                           child: Text(
//                             "مرحباً ${state.data.data?.name}",
//                             style: const TextStyle(
//                                 color: Color(0xff26da76),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               });
//         } else {
//           return Image.asset("assets/image/no-results-found.png");
//         }
//       },
//     );
//   }
// }
class Section1 extends StatelessWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatauserBloc, DatauserState>(
      builder: (context, state) {
        if (state is Loading1State) {
          return Center();
        } else if (state is Successed12356State) {
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
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is FetchPosts) {
          return ListView.builder(
              itemCount: state.posts.data?.length,
              itemBuilder: (context, index) {
                return BlocBuilder<DatauserBloc, DatauserState>(
                  builder: (context, state) {
                    if (state is Successed12356State) {
                      int? i = state.data.data?.student?.id;
                      // String? i1 = state.data.login;
                      index;
                      return BlocBuilder<PostsBloc, PostsState>(
                        builder: (context, state) {
                          if (state is loadingPosts) {
                            return Center(
                                child:
                                    Lottie.asset("assets/lottie/loading.json"));
                          } else if (state is FetchPosts) {
                            List<Likes> l = state.posts.data![index].likes!;
                            var r = l.where((e) => e.studentId == i);
                            int count = r.toList().length;
                            //List t= r.toList() ;
                            //dynamic r1 = l.where((e) => e.login == i1);
                            if (count != 0) {
                              String createat =
                                  "${state.posts.data![index].createdAt}";
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // if you need this
                                    side: BorderSide(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                  elevation: 10, // has value when shape is null
                                  shadowColor: Color(0xff190836),
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/image/AVATARZ - Tomas.png"),
                                          backgroundColor: Color(0xff26da76),
                                        ),
                                        title: Text(
                                            ' الأستاذ ${state.posts.data![index].teacherId}',
                                            style: const TextStyle(
                                              color: Color(0xff26da76),
                                              fontWeight: FontWeight.bold,
                                            )),
                                        subtitle: Text(
                                          createat.substring(0, 10),
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${state.posts.data![index].content}',
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                      ),
                                      //  state.posts[index].title != null
                                      //    ? Image.network(
                                      //      "${state.posts[index].title}",
                                      //    width: double.infinity,
                                      //  height: 300,
                                      //)
                                      // : Image.asset(
                                      //   "assets/image/holding-smartphone.png"),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Container();

                            //  if(state.posts[index].reactions[index].login){}

                          } else {
                            return const Text("");
                          }
                        },
                      );
                    } else if (state is Loading1State) {
                      return Center(
                          child: Lottie.asset("assets/lottie/loading.json"));
                    } else {
                      return const Text("");
                    }
                  },
                );
              });
        }
        return Center(child: Lottie.asset("assets/lottie/loading.json"));
      },
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatauserBloc, DatauserState>(
      builder: (context, state) {
        if (state is Successed12356State) {
          //  int? i = state.data.id;
         int? i1 = state.data.data?.student?.id;
          List<Widget> _children = [];
          return BlocBuilder<CoursesblocBloc, CoursesblocState>(
            builder: (context, state) {
              if (state is LoadingCourses) {
                return const Center();
              } else if (state is FetchCourses) {
                for (int index = 0;
                    index < state.category.data!.length;
                    index++) {
                  List<Courses>? s = state.category.data![index].courses;
                  for (int ind = 0; ind < s!.length; ind++) {
                    List<Enrollments>? l =
                        state.category.data![index].courses![ind].enrollments;
                    var r = l?.where((e) => e.studentId == i1);
                    int count = r!.toList().length;

                    //List t= r.toList() ;
                    //dynamic r1 = l.where((e) => e.login == i1);

                    if (count != 0) {
                      _children.add(InkWell(
                          splashColor: Colors.white24, // Splash color
                          onTap: () async{
                            SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                            int? idstudent = sharedPreferences.getInt('id_student') ?? 0;
                            showDialog(
                                context: context,

                                //   barrierColor: Color(0xffc4e5ff),
                                builder: (ctxt) {
                                  List<Enrollments>? newgfgList =
                                      s[ind].enrollments;
                                  int? index1 = newgfgList?.indexWhere(
                                      (element) => element.studentId == idstudent);
                                  // for (int enrol = 0;
                                  //     enrol < s![ind].enrollments!.length;
                                  //     enrol++) {

                                  return Column(
                                    children: [
                                      const Expanded(
                                        flex: 1,
                                        child: Padding(
                                            padding: EdgeInsets.all(0.0)),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xff665589),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(60),
                                                    topRight:
                                                        Radius.circular(60))),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 30,
                                                                  top: 10),
                                                          child: Text(
                                                              '${state.category.data![index].courses![ind].name} ',
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xff26da76),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      MediaQuery.of(context).size.height / MediaQuery.of(context).size.width >
                                                                              1
                                                                          ? 20
                                                                          : 10)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0,
                                                                  left: 30),
                                                          child: Row(
                                                            children: [
                                                              LikeButton(
                                                                circleColor: const CircleColor(
                                                                    start: Color(
                                                                        0xff401F62),
                                                                    end: Color(
                                                                        0xffA9FDE5)),
                                                                bubblesColor:
                                                                    const BubblesColor(
                                                                  dotPrimaryColor:
                                                                      Color(
                                                                          0xff665589),
                                                                  dotSecondaryColor:
                                                                      Color(
                                                                          0xff7a489d),
                                                                ),

                                                                likeBuilder: (bool
                                                                    isLiked) {
                                                                  return Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: isLiked
                                                                        ? const Color(
                                                                            0xff26da76)
                                                                        : Colors
                                                                            .grey,
                                                                    size: 32,
                                                                  );
                                                                },

                                                                isLiked:
                                                                    (index1 !=
                                                                        -1),
                                                                onTap:
                                                                    (isLiked) {
                                                                  return onLikeButtonTapped(
                                                                      isLiked,
                                                                      context,
                                                                      s[ind],idstudent);
                                                                },
                                                                //هون في خطأ بالتسجيل
                                                              ),
                                                              Text(
                                                                  "الاشتراك في المهارة",
                                                                  style: TextStyle(
                                                                      color: const Color(
                                                                          0xff26da76),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize: MediaQuery.of(context).size.height / MediaQuery.of(context).size.width >
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
                                                      padding: EdgeInsets.only(
                                                          right: 10.0),
                                                      child: Text(
                                                          "لمحة عن المهارة",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff26da76),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 23)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16.0,
                                                              left: 16),
                                                      child: ListView(
                                                        children: [
                                                          Text(
                                                              "${state.category.data![index].courses?[ind].description}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      13)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10.0),
                                                      child: Text("فصول المهارة",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff26da76),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 23)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: LectCourse(
                                                      c: state
                                                          .category
                                                          .data![index]
                                                          .courses?[ind],
                                                          idstudent: idstudent,
                                                    ),
                                                  )
                                                ])),
                                      ),
                                    ],
                                  );
                                  // }
                                  // return const Text("data");
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, top: 5, bottom: 18),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // if you need this
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                              elevation: 10,
                              // has ind when shape is null
                              shadowColor: const Color(0xff190836),
                              clipBehavior: Clip.antiAlias,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 70.0, left: 70),
                                      child: Image.asset(
                                        "assets/image/cryptocurrency-encryption.png",
                                        height: 100,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                          '${state.category.data![index].courses![ind].name} ',
                                          style: const TextStyle(
                                            color: Color(0xff26da76),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${state.category.data![index].courses![ind].teacherId}',
                                            style: const TextStyle(
                                                color: Color(0xff665589),
                                                fontSize: 16),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30.0),
                                            child: Text(
                                              '${state.category.data![index].name}',
                                              style: const TextStyle(
                                                  color: Color(0xff665589),
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 12),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, left: 8),
                                              child: Text(
                                                '${state.category.data![index].courses![ind].description} ',
                                                style: const TextStyle(
                                                    color: Color(0xff665589),
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )));
                    }
                  }
                }
                return ListView(
                  scrollDirection: (MediaQuery.of(context).size.height /
                              MediaQuery.of(context).size.width >
                          1)
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: _children,
                );

                //  if(state.posts[index].reactions[index].login){}

              } else {
                return const Text("");
              }
            },
          );
        } else if (state is Loading1State) {
          return const Center();
        } else {
          return const Text("");
        }
      },
    );
  }

  Future<bool?> onLikeButtonTapped(isLiked, context, Courses c,int?  idstudent) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('id_course', c.id ?? 0);

    //sharedPreferences.setInt('id_delet_like', p.id ?? 0);
    for (int index = 0; index < c.enrollments!.length; index++) {
      int? index1 =
          c.enrollments?.indexWhere((element) => element.studentId == idstudent);
      if (index1 != -1) {
        sharedPreferences.setInt(
            "id_delet_enrolment", c.enrollments![index].id ?? 0);
      }
    }

    int? index1 =
        c.enrollments?.indexWhere((element) => element.studentId == idstudent);

    int? idPos = sharedPreferences.getInt('id_course');
    EnrollmentModel? create = EnrollmentModel(courseId: "$idPos");
    if (index1 == -1) {
      // p.likes?.add(r);
      BlocProvider.of<EnrollmentBloc>(context)
          .add(CreateEnrollmentEvent(create: create));
      //BlocProvider.of<UpdatapostBloc>(context).add(UpdataEvent(p));
    }
    if (index1 != -1) {
      //sharedPreferences.setInt('id_delet_like', p.likes[].id ?? 0);
      BlocProvider.of<DeletenrollmentBloc>(context).add(DeletenrollmEvent());
      // p.likes?.removeWhere((
      //   element,
      // ) =>
      //     element.id == r.id);

    }

    return Future.value(!isLiked);
  }
}

class ButtonWidget extends StatefulWidget {
  ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: const Text("عرض الكل <<"));
  }
}

class LectCourse extends StatefulWidget {
  const LectCourse({Key? key, required this.c,this.idstudent}) : super(key: key);
  final Courses? c;
  final int? idstudent;

  @override
  State<LectCourse> createState() => _LectCourseState();
}

class _LectCourseState extends State<LectCourse> {
  @override
  Widget build(BuildContext context) {
    List<int> magic = [];
    //  final isMuted = controller.value.volume == 0;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 80,
      ),
      itemCount: widget.c?.lectures?.length,
      itemBuilder: (BuildContext context, int i) {
        List<FinishedLecture>? newgfgList =
            widget.c?.lectures?[i].finishedLecture;
        int? index1 =
            newgfgList?.indexWhere((element) => element.studentId == widget.idstudent);
        Wakelock.enable();

        // ignore: unused_local_variable

        if (index1 == -1) {
          magic.add(i);
        }
        if (index1 != -1) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: const Color(0xff665589),
                  shadowColor: const Color(0xff665589),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctxt) {
                        return MediaQuery.of(context).size.height /
                                    MediaQuery.of(context).size.width <
                                1
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                decoration: const BoxDecoration(
                                    color: Color(0xff665589),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(60),
                                        topRight: Radius.circular(60))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 8),
                                  child: Video(
                                    i: i,
                                  ),
                                ))
                            : AlertDialog(
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
                                  return MediaQuery.of(context).size.height /
                                              MediaQuery.of(context)
                                                  .size
                                                  .width <
                                          1
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          decoration: const BoxDecoration(
                                              color: Color(0xff665589),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(60),
                                                  topRight:
                                                      Radius.circular(60))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, bottom: 8),
                                            child: Video(
                                              i: i,
                                            ),
                                          ))
                                      : Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          decoration: const BoxDecoration(
                                              color: Color(0xff665589),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(60),
                                                  topRight:
                                                      Radius.circular(60))),
                                          child:
                                              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                                                      enableDrag: false,
                                                      initialState: true,
                                                      onChanged: (bool state) {
                                                        state;
                                                      },
                                                      rollingInfoRight:
                                                          const RollingIconInfo(
                                                        icon: Icons.check,
                                                        backgroundColor:
                                                            Color(0xff26da76),
                                                        text: Text('  تم'),
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
                                                    top: 15,
                                                    right: 16.0,
                                                    left: 16),
                                                child: Text(
                                                    "${widget.c?.lectures?[i].description}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17)),
                                              ),
                                            ),
                                          ]));
                                }));
                      });
                },
                child: Text("${widget.c?.lectures?[i].title}",
                    style: const TextStyle(
                        color: Color(0xff26da76), fontWeight: FontWeight.bold)),
              ));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: (i != magic[0])
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white10,
                      onPrimary: Colors.white10,
                      shadowColor: Colors.white10,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      minimumSize: const Size(100, 40), //////// HERE
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("${widget.c?.lectures?[i].title}",
                            style: const TextStyle(
                                color: Color(0xff665589),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: const Color(0xff665589),
                      shadowColor: const Color(0xff665589),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      minimumSize: const Size(100, 40), //////// HERE
                    ),
                    onPressed: () {
                      String? create = '${widget.c?.lectures?[i].id}';
                      List<FinishedLecture>? newgfgList =
                          widget.c?.lectures?[i].finishedLecture;
                      int? index1 = newgfgList
                          ?.indexWhere((element) => element.studentId == widget.idstudent);
                      showDialog(
                          context: context,
                          builder: (ctxt) {
                            return MediaQuery.of(context).size.height /
                                        MediaQuery.of(context).size.width <
                                    1
                                ? Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff665589),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(60))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, bottom: 8),
                                      child: Video(
                                        i: i,
                                      ),
                                    ))
                                : AlertDialog(
                                    contentPadding: const EdgeInsets.all(0),
                                    insetPadding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.1,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60.0),
                                            topRight: Radius.circular(60.0))),
                                    scrollable: true,
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return MediaQuery.of(context).size.height /
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width <
                                              1
                                          ? Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.9,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff665589),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(60),
                                                      topRight:
                                                          Radius.circular(60))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16.0, bottom: 8),
                                                child: Video(
                                                  i: i,
                                                ),
                                              ))
                                          : Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.9,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff665589),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(60),
                                                      topRight: Radius.circular(60))),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16.0, bottom: 8),
                                                  child: Video(
                                                    i: i,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      const Text("مختصر الفصل",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff26da76),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 23)),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child:
                                                            RollingSwitch.icon(
                                                          enableDrag: false,
                                                          initialState: false,
                                                          onChanged:
                                                              (bool state) {
                                                            if (index1 == -1) {
                                                              BlocProvider.of<
                                                                          FinishedlectureBloc>(
                                                                      context)
                                                                  .add(CreateFinishedEvent(
                                                                      create: FinishedLectureModel(
                                                                          lectureId:
                                                                              create)));
                                                            }
                                                          },
                                                          rollingInfoRight:
                                                              const RollingIconInfo(
                                                            icon: Icons.check,
                                                            backgroundColor:
                                                                Color(
                                                                    0xff26da76),
                                                            text: Text('  تم'),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            right: 16.0,
                                                            left: 16),
                                                    child: Text(
                                                        "${widget.c?.lectures?[i].description}",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17)),
                                                  ),
                                                ),
                                              ]));
                                    }));
                          });
                    },
                    child: Text("${widget.c?.lectures?[i].title}",
                        style: const TextStyle(
                            color: Color(0xff26da76),
                            fontWeight: FontWeight.bold)),
                  ),
          );
        }
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
