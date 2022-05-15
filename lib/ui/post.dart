import 'package:flutter/material.dart';
import 'package:flutter_badged/badge_position.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';

import 'package:ajyal/bloc/bloc_comment/bloc/comment_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';

import 'package:ajyal/bloc/bloc_delet_comment/bloc/deletcomment_bloc.dart';
import 'package:ajyal/bloc/bloc_new_comment/bloc/newcomment_bloc.dart';
import 'package:ajyal/bloc/bloc_posts/bloc/posts_bloc.dart';
import 'package:ajyal/bloc/bloc_updatapost/bloc/updatapost_bloc.dart';

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
    BlocProvider.of<DatauserBloc>(context).add(LoaddataEvent());

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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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
                  itemCount: state.posts.length,
                  itemBuilder: (cont, index) {
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
                                backgroundImage: AssetImage(
                                    "assets/image/AVATARZ - Tomas.png"),
                                backgroundColor: Color(0xff26da76),
                              ),
                              title: Text(
                                  ' الأستاذ ${state.posts[index].owner?.login}',
                                  style: const TextStyle(
                                    color: Color(0xff26da76),
                                    fontWeight: FontWeight.bold,
                                  )),
                              subtitle: Text(
                                '${state.posts[index].createdAt}',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '${state.posts[index].content}',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            state.posts[index].title != null
                                ? Image.network(
                                    "${state.posts[index].title}",
                                    width: double.infinity,
                                    height: 300,
                                  )
                                :Text(""),
                            ContainerWidget(
                              createcommentController:
                                  widget.createcommentController,
                              index: index,
                              p: state.posts[index],
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
  final PostModel p;
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
  final PostModel p;
  final BuildContext con;
  final TextEditingController createcommentController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        Scaffold.of(con).showBottomSheet((context) {
          return BlocBuilder<UpdatapostBloc, UpdatapostState>(
            builder: (context, state) {
              return BlocBuilder<PostsBloc, PostsState>(
                  builder: (context, state) {
                if (state is loadingPosts ||
                    state is PostsInitial ||
                    state is UpDataState) {
                  return Center(
                      child: Lottie.asset("assets/lottie/loading.json"));
                }
                if (state is FetchPosts) {
                  sharedPreferences.setInt(
                      'id_post', state.posts[index].id ?? 0);

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
                            if (stat is Successed123State) {
                              return BlocListener<NewcommentBloc,
                                  NewcommentState>(
                                listener: (context, state) {
                                  if (state is GetComment) {
                                    Comments new1 = state.new1;
                                    p.comments?.add(new1);
                                    BlocProvider.of<UpdatapostBloc>(context)
                                        .add(UpdataEvent(p));
                                  }
                                },
                                child: Expanded(
                                  flex: 17,
                                  child: ListView.builder(
                                    itemCount:
                                        state.posts[index].comments?.length,
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
                                              showDialog(
                                                  context: context,
                                                  // barrierColor: Color(0xffc4e5ff),
                                                  builder: (ctxt) {
                                                    return DataUserComment();
                                                  });
                                            },
                                            child:CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  "assets/image/Avatar-20.png"),
                                              backgroundColor:
                                                  Color(0xff665589),
                                            ),
                                          )),
                                        ),
                                        hoverColor: Colors.black38,
                                        title: Text(
                                          '${state.posts[index].comments?[inde].user?.login}',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Color(0xff665589)),
                                        ),
                                        subtitle: Text(
                                          '${state.posts[index].comments?[inde].title}',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withAlpha(155)),
                                        ),
                                        trailing:(stat.data.id ==
                                                state.posts[index]
                                                    .comments?[inde].user?.id)? IconButton(
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
                                                state.posts[index]
                                                        .comments?[inde].id ??
                                                    0);

                                           
                                              showDialog(
                                                  context: context,
                                                  // barrierColor: Color(0xffc4e5ff),
                                                  builder: (ctxt) {
                                                    return ButtenDeletComment(
                                                      delet: state.posts[index]
                                                          .comments?[inde],
                                                      post: state.posts[index],
                                                    );
                                                  });
                                           
                                          },
                                          // null disables the button
                                        ): null,
                                      ),
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
                                      content:
                                          Text('عذراً هناك خطأ في البيانات')));
                            }
                          },
                          builder: (context, state) {
                            if (state is CommentInitial) {
                              //  final   user = User( login: "${state.user?.login}") ;
                              return CreateComment(
                                createcommentController:
                                    createcommentController,
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
            },
          );
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
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('هل أنت متأكد من حذف التعليق'),
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
            post.comments?.remove(delet);
            BlocProvider.of<UpdatapostBloc>(context).add(UpdataEvent(post));
            BlocProvider.of<DeletcommentBloc>(context).add(DeletCommEvent());
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
  final PostModel p;
  final BuildContext con;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatauserBloc, DatauserState>(builder: (context, stat) {
      if (stat is Successed123State) {
        return BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            Reactions r2 = Reactions(id: stat.data.id, login: stat.data.login);
            List<Reactions>? copy = [];
            List<Reactions>? newgfgList = List.from(p.reactions!)..addAll(copy);
            int? index1 =
                newgfgList.indexWhere((element) => element.id == r2.id);

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
                likeCount: state.posts[index].reactions?.length,
                isLiked: (index1 != -1),
                onTap: (isLiked) {
                  return onLikeButtonTapped(
                      isLiked,
                      Reactions(id: stat.data.id, login: stat.data.login),
                      context);
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

  Future<bool?> onLikeButtonTapped(isLiked, Reactions r, context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('id_post', p.id ?? 0);
    int? index1 = p.reactions?.indexWhere((element) => element.id == r.id);

    if (index1 == -1) {
      p.reactions?.add(r);
      BlocProvider.of<UpdatapostBloc>(context).add(UpdataEvent(p));
    }
    if (index1 != -1) {
      p.reactions?.removeWhere((
        element,
      ) =>
          element.id == r.id);

      BlocProvider.of<UpdatapostBloc>(context).add(UpdataEvent(p));
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
  final PostModel p;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextFormField(
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
              if (state is Successed123State) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onLongPress: () =>
                          MediaQuery.of(context).size.width * 0.25,
                      onPressed: () async {
                        BlocProvider.of<CommentBloc>(context).add(
                            CreateCommentEvent(
                                create: Comments(
                                    title: createcommentController.text,
                                    user: User(
                                        id: state.data.id,
                                        login: state.data.login),
                                    createdAt:
                                        "${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}")));

                        createcommentController.clear();
                        BlocProvider.of<NewcommentBloc>(context)
                            .add(NewCommentEvent());
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

class DataUserComment extends StatelessWidget {
  const DataUserComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
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
              Text("user",
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
              Text("أشرق وكأن الكون كله لك ..",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
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
                itemCount: 10,
                borderRadius: 20,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
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
                itemCount: 20,
                borderRadius: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
