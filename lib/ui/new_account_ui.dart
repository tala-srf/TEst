import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:ajyal/bloc/bloc_account/bloc/account_bloc.dart';
import 'package:ajyal/models/new_account_model.dart';

class NewAcccont extends StatelessWidget {
  NewAcccont({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController logincontroler = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff7a489d),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/Untitled-1.png"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          )),
          child: BlocConsumer<AccountBloc, AccountState>(
            listener: (context, state) {
              if (state is SuccessedAccontState) {
                Navigator.of(context).popAndPushNamed("/SignIn");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('شكراً لك رجاءً انتظر التنشيط')));
              } else if (state is FaildAccount) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('عذراً يوجد خطأ ')));
              }
            },
            builder: (context, state) {
              if (state is AccountInitial) {
                return NEWForm(
                    emailController: emailController,
                    logincontroler: logincontroler,
                    passwordController: passwordController,
                    lastnamecontroller: lastnamecontroller,
                    firstnamecontroller: firstnamecontroller);
              } else if (state is LoadAccountState) {
                return Center(
                    child: Lottie.asset("assets/lottie/loading.json"));
              } else if (state is FaildAccount) {
                return NEWForm(
                    emailController: emailController,
                    logincontroler: logincontroler,
                    passwordController: passwordController,
                    lastnamecontroller: lastnamecontroller,
                    firstnamecontroller: firstnamecontroller);
              } else
                // ignore: curly_braces_in_flow_control_structures
                return const Text('something went wrong');
            },
          ),
        ));
  }
}

class NEWForm extends StatelessWidget {
  NEWForm({
    Key? key,
    required this.emailController,
    required this.logincontroler,
    required this.passwordController,
    required this.lastnamecontroller,
    required this.firstnamecontroller,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController logincontroler;
  final TextEditingController lastnamecontroller;
  final TextEditingController firstnamecontroller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "إنشاء حساب",
              style: TextStyle(
                  color: Color(0xff665589),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "أهلاً بك في منصة أجيال ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "نحن سعيدون جداً باشتراكك معنا، من فضلك أدخل معلوماتك",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const Text(
              "الصحيحة لكي تحصل على تجرب استخدام صُممت خصيصاً لك",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 280,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Color(0xff665589),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 280,
                              height: 50,
                              child: TextField(
                                style:
                                    const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  hintText: " اسم المستخدم",
                                ),
                                controller: logincontroler,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 280,
                              height: 50,
                              child: TextField(
                                style:
                                    const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  hintText: "البريد الإلكتروني",
                                ),
                                controller: emailController,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 280,
                              height: 50,
                              child: TextField(
                                style:
                                    const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  hintText: "العمر ",
                                ),
                                controller: firstnamecontroller,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 280,
                              height: 50,
                              child: TextField(
                                style:
                                    const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  hintText: "كلمة المرور",
                                ),
                                controller: passwordController,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: const Color(0xff26da76),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final account = NewAccountModel(
                    createdBy: 'admin',
                    lastName: lastnamecontroller.text,
                    firstName: firstnamecontroller.text,
                    email: emailController.text,
                    password: passwordController.text,
                    login: lastnamecontroller.text);

                BlocProvider.of<AccountBloc>(context)
                    .add(CreateAcountEvent(account));
              },
              child: const Text(
                ' إنشاء حساب',
                style: TextStyle(
                    color: Color(0xff26da76), fontWeight: FontWeight.bold),
              ),
            ),
            const Text("مستخدم قديم؟",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            TextButton(
                onPressed: () {
                    Navigator.of(context).popAndPushNamed("/SignIn");
                },
                child: const Text("بإمكانك تسجيل الدخول من هنا",
                    style: TextStyle(
                        color: Color(0xff26da76), fontWeight: FontWeight.w700)))
          ],
        ),
      ),
    );
  }
}
