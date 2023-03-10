import 'package:flutter_chat_app/app/routes/app_routes.dart';
import 'package:flutter_chat_app/pages/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();

  WelcomeController();

  changePage(int index) async {
    state.index.value = index;
  }

  handleSignIn() {
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
