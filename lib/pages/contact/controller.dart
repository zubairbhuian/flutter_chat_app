import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app/app/entities/msg.dart';

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
        .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore())
        .get();

    for (var doc in userBase.docs) {
      state.contactList.add(doc.data());
    }
  }

  goChat(UserData toUserdata) async {
    var fromMessage = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("to_uid", isEqualTo: token)
        .where("to_uid", isEqualTo: toUserdata.id)
        .get();

    var toMessage = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: toUserdata.id)
        .where("to_uid", isEqualTo: token)
        .get();
    if (fromMessage.docs.isEmpty && toMessage.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      UserLoginResponseEntity userdata =
          UserLoginResponseEntity.fromJson(jsonDecode(profile));
      var msgdata = Msg(
          from_uid: userdata.accessToken,
          to_uid: toUserdata.id,
          from_name: userdata.displayName,
          to_name: toUserdata.name,
          from_avatar: userdata.photoUrl,
          to_avatar: toUserdata.photourl,
          last_msg: "",
          last_time: Timestamp.now(),
          msg_num: 0);
      print("Demo");
      db
          .collection("message")
          .withConverter(
              fromFirestore: Msg.fromFirestore,
              toFirestore: (Msg msg, options) => msg.toFirestore())
          .add(msgdata)
          .then((value) {
        Get.toNamed("/chat", parameters: {
          "doc_id": value.id,
          "to_uid": toUserdata.id ?? "",
          "to_name": toUserdata.name ?? "",
          "to_avatar": toUserdata.photourl ?? ""
        });
      });
    } else {
      if (fromMessage.docs.isNotEmpty) {
        Get.toNamed("/chat", parameters: {
          "doc_id": fromMessage.docs.first.id,
          "to_uid": toUserdata.id ?? "",
          "to_name": toUserdata.name ?? "",
          "to_avatar": toUserdata.photourl ?? ""
        });
      }
      if (toMessage.docs.isNotEmpty) {
        Get.toNamed("/chat", parameters: {
          "doc_id": toMessage.docs.first.id,
          "to_uid": toUserdata.id ?? "",
          "to_name": toUserdata.name ?? "",
          "to_avatar": toUserdata.photourl ?? ""
        });
      }
    }
  }

  @override
  void onReady() {
    asyncLoadAllData();
    // TODO: implement onReady
    super.onReady();
  }
}
