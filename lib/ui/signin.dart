import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';


import 'package:ajyal/bloc/bloc_auth/bloc/auth_bloc.dart';
import 'package:ajyal/models/me.dart';


// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff665589),
        body: Hero(
          tag: "element",
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/image/Untitled-1.png"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("تسجيل الدخول",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xff665589),
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff665589),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is SuccessedSignInState)
                          // ignore: curly_braces_in_flow_control_structures
                          Navigator.of(context).popAndPushNamed('/home');
                        else if (state is FaildAuthState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('عذراً هناك خطأ')));
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthInitial)
                          // ignore: curly_braces_in_flow_control_structures
                          return SignInForm(
                              emailController: emailController,
                              passwordController: passwordController);
                        else if (state is ProcessingSignInState)
                          // ignore: curly_braces_in_flow_control_structures
                          return  Center(
                              child: Lottie.asset("assets/lottie/loading.json"));
                        else if (state is FaildAuthState)
                          // ignore: curly_braces_in_flow_control_structures
                          return SignInForm(
                              emailController: emailController,
                              passwordController: passwordController);
                        else
                          // ignore: curly_braces_in_flow_control_structures
                          return const Text('');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("مرحباً بك مجدداً ",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Color(0xff26da76),
                fontWeight: FontWeight.bold,
                fontSize: 32,
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 280,
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: " اسم المستخدم",
                ),
                controller: emailController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 280,
              height: 50,
              child: TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: " كلمة المرور",
                ),
                controller: passwordController,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final user = AuthModel(
                  rememberMe: true,
                  username: emailController.text,
                  password: passwordController.text);
              BlocProvider.of<AuthBloc>(context).add(SignInEvent(user: user));
            },
            child: const Text('تسجيل الدخول',
                style: TextStyle(
                    color: Color(0xff26da76), fontWeight: FontWeight.bold)),
          ),
          const Text("مستخدم جديد؟",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          TextButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed("/newaccount");
            
            },
            child: const Text('بإمكانك إنشاء حساب من هنا',
                style: TextStyle(
                    color: Color(0xff26da76), fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
