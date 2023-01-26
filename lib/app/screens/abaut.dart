import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app/screens/home.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('This is demo about page'),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const HomeScreen());
              },
              child: const Text('Next'))
        ],
      ),
    );
  }
}
