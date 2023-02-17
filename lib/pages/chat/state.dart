import 'package:flutter_chat_app/app/entities/msgcontent.dart';
import 'package:get/get.dart';

class ChatState {
  RxList<MsgContent> msgcontentList = <MsgContent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "unknon".obs;
}
