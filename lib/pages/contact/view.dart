import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/contact/controller.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget custromAppbar = AppBar(
      title: const Text(
        "Contact",
        style: TextStyle(fontSize: 25),
      ),
    );

    return Scaffold(
      appBar: custromAppbar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("chat"),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                // controller.asyncLoadAllData();
              },
              child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
