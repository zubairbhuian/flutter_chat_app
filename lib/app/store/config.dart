import 'package:flutter_chat_app/app/store/storage.dart';
import 'package:get/get.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  // bool isFirstOpen = false;

  // saveAlreadyOpen
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool('STORAGE_DEVICE_FIRST_OPEN_KEY', true);
  }
}
