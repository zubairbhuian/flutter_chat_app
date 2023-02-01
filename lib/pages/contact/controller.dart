import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_chat_app/app/entities/user.dart';
import 'package:flutter_chat_app/app/store/user.dart';
import 'package:flutter_chat_app/pages/contact/index.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  ContactController();
  final state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  asyncLoadAllData() async {
    var userBase = await db
        .collection("users")
        .where("id", isEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore())
        .get();

    for (var doc in userBase.docs) {
      state.contactList.add(doc.data());
      print(doc.toString());
    }
  }

  @override
  void onReady() {
    asyncLoadAllData();
    // TODO: implement onReady
    super.onReady();
  }
}
