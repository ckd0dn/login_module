
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:login/constants/firestore_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class KakaoController extends GetxController {

  late final bool KaKaoTalkInstalled;
  List<String> kakaoAgreeScope = ["account_email"];



  initKaKaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    KaKaoTalkInstalled = installed;

  }


  Future<bool> SignWithKakao() async {
    try {
      if(KaKaoTalkInstalled){
        var code = await AuthCodeClient.instance.requestWithTalk();
        await _issueAccessToken(code);
        return true;
      }else{
        var code = await AuthCodeClient.instance.request();
        await _issueAccessToken(code);
        return true;
      }
    } catch (error) {
      print(error.toString());
      Fluttertoast.showToast(
          msg: "카카오톡 설치나 로그인후 사용해주세요",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }

  }

  Future<void> _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);

      getUser();

    } catch (error) {
      print(error.toString());
    }
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var user = await UserApi.instance.me();
        String email;
        String id;
      if(user.kakaoAccount!.email != null){
        print( user.kakaoAccount!.email);
        print( user.id);
        email = user.kakaoAccount!.email!;
        id = user.id as String;
        print('카카오로그인성공');
        await prefs.setString(FirestoreConstants.email, email);
        await prefs.setString(FirestoreConstants.id, id);
      }else{
        //동의화면
        UserApi.instance.loginWithNewScopes(kakaoAgreeScope);
      }
    } catch (e) {
      print(e);
    }
  }

}