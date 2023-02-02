import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        flexibleSpace: Container(
          // height: 108,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 122, 15, 244),
              Color.fromARGB(255, 133, 2, 227)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Contact'),
      ),
      body: Text('chat')
    );
  }
}
