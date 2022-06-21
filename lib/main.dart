// ignore_for_file: prefer_const_constructors
import 'package:ajyal/bloc/bloc_badge/bloc/badge_bloc.dart';
import 'package:ajyal/bloc/bloc_delet_enrollment/bloc/deletenrollment_bloc.dart';
import 'package:ajyal/bloc/bloc_delet_like/bloc/deletlike_bloc.dart';
import 'package:ajyal/bloc/bloc_enrollment/bloc/enrollment_bloc.dart';
import 'package:ajyal/bloc/bloc_lecture/bloc/finishedlecture_bloc.dart';
import 'package:ajyal/bloc/bloc_like/bloc/like_bloc.dart';
import 'package:ajyal/ui/kids.dart';

import 'package:ajyal/ui/pdf_view_ui.dart';
import 'package:ajyal/ui/tabquha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ajyal/bloc/bloc_account/bloc/account_bloc.dart';
import 'package:ajyal/bloc/bloc_all_user/bloc/alluser_bloc.dart';

import 'package:ajyal/bloc/bloc_auth/bloc/auth_bloc.dart';
import 'package:ajyal/bloc/bloc_books/bloc/books_bloc.dart';
import 'package:ajyal/bloc/bloc_comment/bloc/comment_bloc.dart';
import 'package:ajyal/bloc/bloc_courses/bloc/coursesbloc_bloc.dart';
import 'package:ajyal/bloc/bloc_datauser/bloc/datauser_bloc.dart';

import 'package:ajyal/bloc/bloc_posts/bloc/posts_bloc.dart';

import 'package:ajyal/ui/new_account_ui.dart';
import 'package:ajyal/ui/splash3_ui.dart';
import 'package:ajyal/ui/category_courses_ui.dart';

import 'package:ajyal/ui/home_ui.dart';

import 'package:ajyal/ui/post.dart';
import 'package:ajyal/ui/profile_ui.dart';
import 'package:ajyal/ui/signin.dart';
import 'package:ajyal/ui/splash_paege.dart';
import 'package:ajyal/ui/splash_screen_ui2.dart';
import 'package:ajyal/ui/splash_ui_1.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'bloc/bloc_delet_comment/bloc/deletcomment_bloc.dart';

main() async {
  WidgetsFlutterBinding();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String token = sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';

  runApp(MyApp(
    token: token,
  ));
}

@immutable
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required String token,
  }) : super(key: key);
  String token = 'EMPTY_TOKEN';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
        BlocProvider(
          create: (_) => PostsBloc(),
        ),
        BlocProvider(
          create: (_) => CommentBloc(),
        ),
        BlocProvider(
          create: (_) => AccountBloc(),
        ),
        BlocProvider(
          create: (_) => DatauserBloc(),
        ),
        // BlocProvider(
        //   create: (_) => UpdatapostBloc(),
        // ),
        // BlocProvider(
        //   create: (_) => NewcommentBloc(),
        // ),
        BlocProvider(
          create: (_) => DeletcommentBloc(),
        ),
        BlocProvider(create: (_) => CoursesblocBloc()),
        BlocProvider(create: (_) => BooksBloc()),
        BlocProvider(create: (_) => AlluserBloc()),
        BlocProvider(create: (_) => LikeBloc()),
        BlocProvider(create: (_) => EnrollmentBloc()),
        BlocProvider(create: (_) => DeletenrollmentBloc()),
        BlocProvider(create: (_) => DeletlikeBloc()),
        BlocProvider(create: (_) => FinishedlectureBloc()),
        BlocProvider(create: (_) => BadgeBloc())
  


      ],
      child: MainApp(
        token: token,
      ),
    );
  }
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({
    Key? key,
    required String? token,
  }) : super(key: key);

  String? token;

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString() == 'EMPTY_TOKEN') {
              return const Splash3UI();
            } else {
              return Home();
            }
          } else {
            return const SplashPage();
          }
        },
        future: tokenCall(),
      ),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/image/Asset 5 (2).png",
      backgroundColor: const Color(0xff7a489d),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],

        //debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        theme: lightTheme(),
        routes: {
          '/Post': (ctxt) => Post(),
          '/SignIn': (ctxt) => SignIn(),
          '/profile': (ctxt) => ProfileUi(),
          '/home': (ctxt) => Home(),
          '/course': (ctxt) => CoursesUi(),
          '/splash2': (ctxt) => const SplashUI2(),
          '/splash3': (ctxt) => Splash3UI(),
          '/newaccount': (ctxt) => NewAcccont(),
          "/splash1": (cxtc) => SplashUI1(),
          "/pdf": (cxtc) => PdfView(),
          "/kids": (cxtc) => Kids(),
           "/game": (cxtc) => Game(),
        },
        home: example1);
  }

  Future<String> tokenCall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';
  }

  ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme(
          background: Colors.white,
          brightness: Brightness.light,
          primary: Color(0xff26da76),
          onPrimary: Colors.white,
          primaryVariant: Colors.black,
          onBackground: Colors.black,
          secondary: Color(0xff665589),
          onSecondary: Colors.white,
          secondaryVariant: Colors.white,
          error: Color(0xff26da76),
          onError: Colors.white,
          onSurface: Colors.white,
          surface: Colors.black),
      textTheme: const TextTheme(
          headline1: TextStyle(color: Color(0xffB183CE), fontFamily: 'Tahoma')),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
          textStyle: MaterialStateProperty.all(const TextStyle(
              color: Color(0xff26da76), fontWeight: FontWeight.bold)),
          backgroundColor: MaterialStateProperty.all(const Color(0xffffffff)),
          shadowColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
    );
  }
}
