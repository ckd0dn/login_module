
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login/constants/firestore_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleController extends GetxController {


  Future<bool> SignWithApple() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );

    var appleUser =
    await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    print(appleUser.user!.email);
    print(appleUser.user!.uid);
    String? email = appleUser.user!.email;
    String uid = appleUser.user!.uid;
    await prefs.setString(FirestoreConstants.email, email!);
    await prefs.setString(FirestoreConstants.id, uid);

    return true;
  }


}