import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/sign_in/controller.dart';

import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Center(
          child: ElevatedButton(
              onPressed: () {
                controller.handleSignIn();
              },
              child: const Text("Sign In With Google"))),
    ));
  }
}
