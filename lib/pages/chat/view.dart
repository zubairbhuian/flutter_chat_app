import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});
  AppBar _buildAppbar() {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 70,
      flexibleSpace: Container(
        // height: 108,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 122, 15, 244),
                Color.fromARGB(255, 133, 2, 227)
              ],
              transform: GradientRotation(80),
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: InkWell(
                onTap: () {
                  print("Press");
                },
                child: SizedBox(
                  width: 44.w,
                  height: 44.w,
                  child: CachedNetworkImage(
                    imageUrl: controller.chatState.to_avatar.value,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        padding: const EdgeInsets.all(0),
                        margin: null,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44.w),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 0.w, bottom: 0.w, right: 0.w, left: 10.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.chatState.to_name.value,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      controller.chatState.to_location.value,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: SafeArea(
            child: Container(
          margin: null,
          padding: null,
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 245, 245, 245),
          child: Stack(children: [
            Positioned(
                bottom: 0,
                height: 50.h,
                child: Container(
                  width: 360.w,
                  color: Colors.blue,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 0),
                        width: 200.w,
                        color: Colors.green,
                        child: const TextField(),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.w, bottom: 0),
                        width: 50.w,
                        color: const Color.fromARGB(255, 22, 9, 143),
                        child: const TextField(),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.w, bottom: 0),
                        width: 50.w,
                        color: const Color.fromARGB(255, 12, 20, 12),
                        child: const TextField(),
                      )
                    ],
                  ),
                )),
          ]),
        )));
  }
}
