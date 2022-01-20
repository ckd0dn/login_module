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
import 'package:login/controller/signup_controller.dart';
import 'package:login/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  final FocusNode signupFocusNodeEmail = FocusNode();
  final FocusNode signupFocusNodePassword = FocusNode();
  final formKey = GlobalKey<FormState>();


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    signupEmailController.dispose();
    signupPasswordController.dispose();

    signupFocusNodeEmail.dispose();
    signupFocusNodePassword.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

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
            "회원가입",
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
                  controller: signupEmailController,
                  focusNode: signupFocusNodeEmail,
                  keyboardType:
                  TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // 외곽선
                  ),
                  onFieldSubmitted: (_) {
                    signupFocusNodePassword.requestFocus();
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
                  focusNode: signupFocusNodePassword,
                  controller: signupPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), // 외곽선
                  ),
                  onFieldSubmitted: (_) async {
                    bool isSignUp;
                    isSignUp = await controller.doSignUp(signupEmailController, signupPasswordController);
                    if(isSignUp){
                      Get.to(LoginScreen());
                    }
                  },
                  validator: (val) {
                    if (val!.length < 1) {
                      return '비밀번호를 입력해주세요';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
