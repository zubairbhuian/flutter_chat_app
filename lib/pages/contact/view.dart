import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/contact/controller.dart';
import 'package:flutter_chat_app/pages/contact/widgets/contact_list.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

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
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/chat");
                },
                child: const Text("Next"))
          ],
        ),
        body: const ContactList());
  }
}
