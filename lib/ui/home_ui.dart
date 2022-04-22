import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ajyal/bloc/bloc_auth/bloc/auth_bloc.dart';
import 'package:ajyal/ui/category_books_ui.dart';
import 'package:ajyal/ui/category_courses_ui.dart';
import 'package:ajyal/ui/favorite_ui.dart';

import 'package:ajyal/ui/post.dart';
import 'package:ajyal/ui/profile_ui.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> pages = [
    FavoriteUI(),
    Post(),
    ProfileUi(),
    CoursesUi(),
    BooksUI(),
  ];
  @override
  // ignore: must_call_super
  void initState() {
    index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff7a489d),
        resizeToAvoidBottomInset: false, //لح

        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Button(),
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
            child: pages[index],
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: const Color(0xff15da6d),

          items: const [
            TabItem(
                icon: Icons.favorite_border,
                activeIcon: Icon(
                  Icons.favorite_border,
                  color: Color(0xff7a489d),
                )),
            TabItem(
                icon: Icons.article_outlined,
                activeIcon: Icon(
                  Icons.article_outlined,
                  color: Color(0xff7a489d),
                )),
            TabItem(
                icon: Icons.home_outlined,
                activeIcon: Icon(
                  Icons.home_outlined,
                  color: Color(0xff7a489d),
                )),
            TabItem(
                icon: Icons.cast_for_education_sharp,
                activeIcon: Icon(
                  Icons.cast_for_education_sharp,
                  color: Color(0xff7a489d),
                )),
            TabItem(
                icon: Icons.menu_book_sharp,
                activeIcon: Icon(
                  Icons.menu_book_sharp,
                  color: Color(0xff7a489d),
                )),
          ],
          initialActiveIndex: 2,

          //optional, default as 0
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ));
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/splash1', (route) => !route.isFirst);
    }, builder: (context, state) {
      if (state is ProcessingLogOutState) {
        return Lottie.asset("assets/lottie/loading.json");
      } else {
        return FabCircularMenu(
            fabMargin: EdgeInsets.all(8),
            fabColor: const Color(0xff15da6d),
            ringWidth: 40,
            ringDiameter: 200,
            fabSize: 50,
            ringColor: Colors.white,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                  }),
              IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {
                   
                  })
            ]);
      }
    });
  }
}
