
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login/api/api.dart';
import 'package:login/api/apidio.dart';
import 'package:login/constants/firestore_constants.dart';
import 'package:login/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{





  Future<bool> doLogin(TextEditingController email, TextEditingController password) async {
    String statusCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> map = {
      "email": email.text,
      "password": password.text
    };

    try {
      var response = await ApiDio_Post(Api.LOGIN, map).connect();

      Map<String, dynamic> datas = json.decode(response.toString());
      statusCode = datas['statusCode'].toString();
      print(datas);
      if (statusCode == "200") {
        String accessToken = datas['data']['accessToken'];
        String refreshToken = datas['data']['refreshToken'];
        String token = accessToken;
        print(token);

        prefs.setString(FirestoreConstants.token, token);
        print("전역토큰 > ${prefs.get(FirestoreConstants.token)}");
        return true;

      }
      Fluttertoast.showToast(
          msg: "로그인에 실패하였습니다.",
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
          msg: "로그인에 실패하였습니다.",
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