import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app/store/storage.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../values/constant.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';
  bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  Locale locale = const Locale('en', 'us');
  List<Locale> languages = [const Locale('en', 'us'), const Locale('zh', 'CN')];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }
}
