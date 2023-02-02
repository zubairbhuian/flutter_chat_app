import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app/entities/user.dart';
import 'package:flutter_chat_app/pages/contact/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget BulitListItems(UserData item) {
      return Container(
        height: 54.w,
        padding:
            EdgeInsets.only(right: 15.w, top: 15.w, left: 15.w, bottom: 0.w),
        child: InkWell(
          onTap: () {
            if(item.id !=null){
 controller.goChat(item);
            }
            
           
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(right: 15.w, left: 0.w, top: 0.w),
                child: SizedBox(
                  width: 54.w,
                  height: 54.w,
                  child: CachedNetworkImage(imageUrl: "${item.photourl}"),
                ),
              ),
              Container(
                width: 200.w,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black45))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${item.name}",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Obx(() => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var item = controller.state.contactList[0];
                return BulitListItems(item);
              }, childCount: controller.state.contactList.length)),
            )
          ],
        ));
  }
}
