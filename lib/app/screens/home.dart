import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app/screens/abaut.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('This is demo home page'),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const AboutScreen());
              },
              child: const Text('Next'))
        ],
      ),
    );
  }
}
