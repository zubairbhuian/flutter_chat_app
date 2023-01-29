import 'package:flutter_chat_app/app/routes/app_routes.dart';
import 'package:flutter_chat_app/pages/welcome/state.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = WelcomeState();

  ApplicationController();

  changePage(int index) async {
    state.index.value = index;
  }

  handleSignIn() {
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
