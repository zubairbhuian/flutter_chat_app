import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/app/routes/app_routes.dart';
import 'package:flutter_chat_app/app/store/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../app/entities/user.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SignInController extends GetxController {
  SignInController();
  final db = FirebaseFirestore.instance;
  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
          final gAuthentication = await user.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: gAuthentication.idToken,
            accessToken: gAuthentication.accessToken);
        await FirebaseAuth.instance.signInWithCredential(credential);
        
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";
        UserLoginResponseEntity userPrfile = UserLoginResponseEntity();
        userPrfile.email = email;
        userPrfile.accessToken = id;
        userPrfile.displayName = displayName;
        userPrfile.photoUrl = photoUrl;
        // UserStore
        UserStore.to.saveProfile(userPrfile);
        //  Add  db user data
        var userDatabase = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userData, options) =>
                  userData.toFirestore(),
            )
            .where("id", isEqualTo: id)
            .get();
        if (userDatabase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photourl: photoUrl,
              location: "",
              fcmtoken: "",
              addtime: Timestamp.now());
          await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userData, options) =>
                    userData.toFirestore(),
              )
              .add(data);
        }
      }
      Fluttertoast.showToast(msg: 'Login Success', timeInSecForIosWeb: 2);
      Get.offAndToNamed(AppRoutes.Application);
    } catch (e) {
      Fluttertoast.showToast(msg: "Login err", timeInSecForIosWeb: 2);
    }
  }
}
