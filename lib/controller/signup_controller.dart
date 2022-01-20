
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login/api/api.dart';
import 'package:login/api/apidio.dart';

class SignUpController extends GetxController{

  Future<bool> doSignUp(TextEditingController email, TextEditingController password) async {

    Map<String, dynamic> map = {
      "email": email.text,
      "password": password.text
    };

    try {
      var response = await ApiDio_Post(Api.SIGN_UP, map).connect();

      Map<String, dynamic> datas = json.decode(response.toString());
      String statusCode = datas['statusCode'].toString();
      print(datas);
      if (statusCode == "200") {
        return true;
      }
      Fluttertoast.showToast(
          msg: "회원가입에 실패했습니다",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;

    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "회원가입에 실패하였습니다.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;

    } finally {

    }
  }

}