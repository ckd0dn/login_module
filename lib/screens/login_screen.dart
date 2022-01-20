import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:login/controller/apple_controller.dart';
import 'package:login/controller/google_controller.dart';
import 'package:login/controller/kakao_controller.dart';
import 'package:login/controller/login_controller.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode loginFocusNodeEmail = FocusNode();
  final FocusNode loginFocusNodePassword = FocusNode();
  final formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;

  @override
  void initState() {

    // _initKaKaoTalkInstalled();

    super.initState();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();

    loginFocusNodeEmail.dispose();
    loginFocusNodePassword.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final googleController = Get.put(GoogleController());
    final kakaoController = Get.put(KakaoController());
    final appleController = Get.put(AppleController());


    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 35,
          elevation: 0,
          //automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "로그인",
            style: TextStyle(
                fontSize: 14, fontFamily: "GodoB", color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: loginEmailController,
                  focusNode: loginFocusNodeEmail,
                  keyboardType:
                  TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // 외곽선
                  ),
                  onFieldSubmitted: (_) {
                    loginFocusNodePassword.requestFocus();
                  },
                  validator: (val) {
                    if(val!.length < 1) {
                      return '이메일을 입력해주세요';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: loginFocusNodePassword,
                  controller: loginPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // 외곽선
                  ),
                  onFieldSubmitted: (_) async {
                    bool isLogin;
                    isLogin = await loginController.doLogin(loginEmailController, loginPasswordController);
                    if(isLogin){
                      Get.to(HomeScreen());
                    }
                  },
                  validator: (val) {
                    if (val!.length < 1) {
                      return '비밀번호를 입력해주세요';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(onPressed: () async {
                        bool isLogin;
                        isLogin = await googleController.handleSignIn();
                        if(isLogin){
                          Get.to(HomeScreen());
                        }
                       },
                          child: const Text("구글로그인")),
                    ),
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(onPressed: () async {
                        bool isLogin;
                        isLogin = await appleController.SignWithApple();
                        if(isLogin){
                          Get.to(HomeScreen());
                        }
                      },
                          child: const Text("애플로그인")),
                    ),
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(onPressed: () async {
                        bool isLogin;
                        isLogin = await kakaoController.SignWithKakao();
                        if(isLogin){
                          Get.to(HomeScreen());
                        }
                      },
                          child: const Text("카카오 로그인")),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: () async {
                    Get.to(SignUpScreen());
                  },
                      child: const Text("회원가입")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
