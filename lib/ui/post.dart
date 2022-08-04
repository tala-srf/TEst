import 'package:ajyal/bloc/bloc_delet_like/bloc/deletlike_bloc.dart';
import 'package:ajyal/bloc/bloc_like/bloc/like_bloc.dart';
import 'package:ajyal/models/comment_model.dart';
import 'package:ajyal/models/like_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';

import 'package:ajyal/bloc/bloc_comment/bloc/comment_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';

import 'package:ajyal/bloc/bloc_delet_comment/bloc/deletcomment_bloc.dart';

import 'package:ajyal/bloc/bloc_posts/bloc/posts_bloc.dart';

import 'package:ajyal/models/post_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Post extends StatefulWidget {
  Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController createcommentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsBloc>(context).add(LoadEvent());
    BlocProvider.of<DatauserBloc>(context).add(LoaddatEvent());

    return ListPosts(createcommentController: createcommentController);
  }
}

class ListPosts extends StatefulWidget {
  ListPosts({
    Key? key,
    required this.createcommentController,
  }) : super(key: key);

  final TextEditingController createcommentController;

  @override
  State<ListPosts> createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  // ignore: prefer_final_fields
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  @override
  Widget build(BuildContext conte) {
    return

        //  resizeToAvoidBottomInset: false,

        BlocBuilder<PostsBloc, PostsState>(
      builder: (con, state) {
        if (state is loadingPosts) {
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
        } else if (state is FetchPosts) {
          return Padding(
            padding: const EdgeInsets.only(top: 13.5),
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: WaterDropHeader(),
              onLoading: () {
                _refreshController.loadComplete();
              },
              onRefresh: () {
                BlocProvider.of<PostsBloc>(context).add(LoadEvent());
                _refreshController.refreshCompleted();
              },
              child: ListView.builder(
                  itemCount: state.posts.data!.length,
                  itemBuilder: (cont, index) {
                    String createat = "${state.posts.data![index].createdAt}";
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
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
                        shadowColor: Color(0xff190836),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/image/AVATARZ.png"),
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
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '${state.posts.data![index].content}',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            state.posts.data![index].images != null
                                ? Image.network(
                                    "${state.posts.data![index].images}")
                                : Text(""),
                            ContainerWidget(
                              createcommentController:
                                  widget.createcommentController,
                              index: index,
                              p: state.posts.data![index],
                              contex: con,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}

class ContainerWidget extends StatelessWidget {
  ContainerWidget(
      {Key? key,
      required this.createcommentController,
      required this.index,
      required this.p,
      required this.contex})
      : super(key: key);

  final TextEditingController createcommentController;
  final int index;
  final Data p;
  BuildContext contex;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        height: MediaQuery.of(context).size.height / 1 / 10,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffA9FDE5),
        child: Scaffold(
            body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CommentButton1(
                index: index,
                p: p,
                con: contex,
                createcommentController: createcommentController),
            LikeButten(
              index: index,
              p: p,
              con: context,
            ),
          ],
        )));
  }
}

class CommentButton1 extends StatelessWidget {
  const CommentButton1({
    Key? key,
    required this.index,
    required this.p,
    required this.createcommentController,
    required this.con,
  }) : super(key: key);

  final int index;
  final Data p;
  final BuildContext con;
  final TextEditingController createcommentController;

  @override
  Widget build(BuildContext context) {
    return TextButton(     
      onPressed: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        Scaffold.of(con).showBottomSheet((context) {
          return BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
            // if (state is loadingPosts || state is PostsInitial) {
            //   return Center(child: Lottie.asset("assets/lottie/loading.json"));
            // }
            if (state is FetchPosts) {
              sharedPreferences.setInt(
                  'id_post', state.posts.data![index].id ?? 0);

              return Scaffold(
                backgroundColor: Colors.black12,
                //resizeToAvoidBottomInset: false, //لحل مشكلة الكيبورد
                appBar: AppBar(
                  backgroundColor: const Color(0xff26da76),
                ),
                body: Column(
                  children: [
                    Builder(builder: (context) {
                      return BlocBuilder<DatauserBloc, DatauserState>(
                          builder: (context, stat) {
                        if (stat is Success12356State) {
                          return Expanded(
                            flex: 17,
                            child: ListView.builder(
                              itemCount:
                                  state.posts.data![index].comments?.length,
                              itemBuilder: (ctxt, inde) => Padding(
                                padding: const EdgeInsets.all(2),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(2),
                                  tileColor: Colors.white30,
                                  leading: ClipOval(
                                    child: Material(
                                        // Button color
                                        child: InkWell(
                                      splashColor:
                                          Colors.white24, // Splash color
                                      onTap: () {
                                        // showDialog(
                                        //     context: context,
                                        //     // barrierColor: Color(0xffc4e5ff),
                                        //     builder: (ctxt) {
                                        //       return DataUserComment();
                                        //     });
                                      },
                                      child: const CircleAvatar(
                                        radius: 25,
                                        backgroundImage: AssetImage(
                                            "assets/image/Avatar2.png"),
                                        backgroundColor: Color(0xff665589),
                                      ),
                                    )),
                                  ),
                                  hoverColor: Colors.black38,
                                  title: Text(
                                    '${state.posts.data![index].comments?[inde].studentId}',
                                    style: const TextStyle(
                                        fontSize: 24, color: Color(0xff665589)),
                                  ),
                                  subtitle: Text(
                                    '${state.posts.data![index].comments?[inde].content}',
                                    style: TextStyle(
                                        color: Colors.black.withAlpha(155)),
                                  ),
                                  trailing: (stat.data.data?.name ==
                                          state.posts.data![index]
                                              .comments?[inde].studentId)
                                      ? IconButton(
                                          icon:
                                              const Icon(Icons.delete_forever),
                                          tooltip: 'Navigation menu',

                                          onPressed: () async {
                                            SharedPreferences
                                                sharedPreferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            sharedPreferences.setInt(
                                                'id_delet_comment',
                                                state.posts.data![index]
                                                        .comments?[inde].id ??
                                                    0);

                                            showDialog(
                                                context: context,
                                                // barrierColor: Color(0xffc4e5ff),
                                                builder: (ctxt) {
                                                  return ButtenDeletComment(
                                                    delet: state
                                                        .posts
                                                        .data![index]
                                                        .comments?[inde],
                                                    post: state
                                                        .posts.data![index],
                                                  );
                                                });
                                          },
                                          // null disables the button
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Text("data");
                        }
                      });
                    }),
                    BlocConsumer<CommentBloc, CommentState>(
                      listener: (context, state) {
                        if (state is Error1State) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('عذراً هناك خطأ في البيانات')));
                        }
                      },
                      builder: (context, state) {
                        if (state is CommentInitial) {
                          //  final   user = User( login: "${state.user?.login}") ;
                          return CreateComment(
                            createcommentController: createcommentController,
                            p: p,
                          );
                        } else if (state is loadingComments) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Center(child: Text(''));
                        }
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('NOCOMMENT'));
            }
          });
        });
      },
      child: const Text('تعليق ',
          style: TextStyle(color: Color(0xff665589), fontSize: 25)),
    );
  }
}

class ButtenDeletComment extends StatelessWidget {
  const ButtenDeletComment({
    required this.delet,
    required this.post,
    Key? key,
  }) : super(key: key);
  final Comments? delet;
  final Data post;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('هل أنت متأكد من حذف التعليق'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'إلغاء',
            style: TextStyle(color: Color(0xff665589)),
          ),
        ),
        TextButton(
          onPressed: () {
            // BlocProvider.of<UpdatapostBloc>(context).add(UpdataEvent(post));
            BlocProvider.of<DeletcommentBloc>(context).add(DeletCommEvent());
            post.comments?.remove(delet);
            Navigator.of(context).pop();
          },
          child: const Text(
            'حذف',
            style: TextStyle(color: Color(0xff665589)),
          ),
        ),
      ],
    );
  }
}

class LikeButten extends StatelessWidget {
  LikeButten({
    Key? key,
    required this.index,
    required this.p,
    required this.con,
  }) : super(key: key);
  final int index;
  final Data p;
  final BuildContext con;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatauserBloc, DatauserState>(builder: (context, stat) {
      if (stat is Success12356State) {
        return BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            int? r2 = stat.data.data?.student?.id;
            //List<Likes>? copy = [];
//List<Likes>? newgfgList = List.from(p.likes!)..addAll(copy);

            List<Likes>? newgfgList = p.likes;
            int? index1 =
                newgfgList?.indexWhere((element) => element.studentId == r2);

            if (state is FetchPosts) {
              return LikeButton(
                circleColor: const CircleColor(
                    start: Color(0xff401F62), end: Color(0xffA9FDE5)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Color(0xff665589),
                  dotSecondaryColor: Color(0xff7a489d),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite_rounded,
                    color: isLiked ? const Color(0xff665589) : Colors.grey,
                    size: 32,
                  );
                },
                likeCount: state.posts.data![index].likes?.length,
                isLiked: (index1 != -1),
                onTap: (isLiked) {
                  return onLikeButtonTapped(
                      isLiked, Likes(studentId: stat.data.data?.id), context);
                },
              );
            } else {
              return const Text("0");
            }
          },
        );
      } else {
        return const Text("0");
      }
    });
  }

  Future<bool?> onLikeButtonTapped(isLiked, Likes r, context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('id_post', p.id ?? 0);
    int? idstudent = sharedPreferences.getInt('id_student') ?? 0;

    //sharedPreferences.setInt('id_delet_like', p.id ?? 0);
    for (int index = 0; index < p.likes!.length; index++) {
      int? index1 =
          p.likes?.indexWhere((element) => element.studentId == idstudent);
      if (index1 != -1) {
        sharedPreferences.setInt("id_delet_like", p.likes![index].id ?? 0);
      }
    }

    int? index1 =
        p.likes?.indexWhere((element) => element.studentId == idstudent);

    int? idPos = sharedPreferences.getInt('id_post');
    LikeModel? create = LikeModel(postId: "$idPos");
    if (index1 == -1) {
      p.likes?.add(r);
      BlocProvider.of<LikeBloc>(context).add(CreateLikeEvent(create: create));
      //BlocProvider.of<UpdatapostBloc>(context).add(UpdataEvent(p));
    }
    if (index1 != -1) {
      //sharedPreferences.setInt('id_delet_like', p.likes[].id ?? 0);
      BlocProvider.of<DeletlikeBloc>(context).add(Deletlike1Event());
      // p.likes?.remove(r);
      p.likes?.removeWhere((
        element,
      ) =>
          element.id == idstudent);
    }

    return Future.value(!isLiked);
  }
}

class CreateComment extends StatelessWidget {
  const CreateComment({
    Key? key,
    required this.createcommentController,
    required this.p,
  }) : super(key: key);

  final TextEditingController createcommentController;
  final Data p;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              cursorColor: Colors.black26,
              decoration: const InputDecoration(
                fillColor: Colors.white30,
                filled: true,
                focusColor: Colors.black12,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color(0xff665589), width: 2.0),
                ),
              ),
              // controller:

              style: const TextStyle(color: Colors.black),
              controller: createcommentController,
            ),
          ),
          BlocBuilder<DatauserBloc, DatauserState>(
            builder: (context, state) {
              if (state is Success12356State) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onLongPress: () =>
                          MediaQuery.of(context).size.width * 0.25,
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        int? idPost = sharedPreferences.getInt("id_post");
                        Comments? c = Comments(
                            content: createcommentController.text,
                            studentId: "${state.data.data?.name}");
                        p.comments?.add(c);
                        BlocProvider.of<CommentBloc>(context).add(
                            CreateCommentEvent(
                                create: CommentModel(
                                    content: createcommentController.text,
                                    postId: "$idPost")));

                        createcommentController.clear();
                      },
                      child: const Icon(
                        Icons.send,
                        color: Color(0xff26da76),
                      )),
                );
              } else {
                return const Text("data");
              }
            },
          ),
        ],
      ),
    );
  }
}

