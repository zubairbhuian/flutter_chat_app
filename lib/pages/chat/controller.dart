import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app/entities/msgcontent.dart';
import 'package:flutter_chat_app/app/store/user.dart';
import 'package:flutter_chat_app/pages/chat/state.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  ChatState chatState = ChatState();

  var doc_id;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.parameters;
    doc_id = data["doc_id"];
    chatState.to_uid.value = data["to_id"] ?? "";
    chatState.to_name.value = data["to_name"] ?? "";
    chatState.to_avatar.value = data["to_avatar"] ?? "";
  }

  sendMassage() async {
    String sendContent = textController.text;
    final content = MsgContent(
        uid: user_id,
        content: sendContent,
        type: "text",
        addTime: Timestamp.now());

    db
        .collection("message")
        .doc(doc_id)
        .collection("msgList")
        .withConverter(
            fromFirestore: MsgContent.fromFirestore,
            toFirestore: (MsgContent msgContent, option) =>
                msgContent.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      print("document snapshort added with id : ${doc.id}");
      textController.clear();
      Get.focusScope!.unfocus();
    });
    await db.collection("message").doc("doc_id").update({
      "last_msg":sendContent,
      "last_time":Timestamp.now()
    });
  }
}
