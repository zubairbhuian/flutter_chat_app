import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/application/controller.dart';
import 'package:flutter_chat_app/pages/application/pages/chat.dart';
import 'package:flutter_chat_app/pages/application/pages/profile.dart';
import 'package:get/get.dart';

import '../contact/index.dart';



class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var pageIndex = controller.state.page;
    final pages = [
      const ChatPage(),
      const ContactPage(),
      const ProfilePage(),
    ];
    final List<IconData> icons = [
      Icons.message,
      Icons.contact_page,
      Icons.person,
    ];
    return Obx(() => Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
              iconSize: 30,
              activeColor: const Color.fromARGB(255, 103, 169, 224),
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.defaultEdge,
              icons: icons,
              activeIndex: pageIndex.value,
              onTap: (index) {
                pageIndex.value = index;
                
              
              }),
          body: pages[pageIndex.value],
        ));
  }
}
