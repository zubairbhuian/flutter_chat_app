// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_app/app/routes/app_routes.dart';
import 'package:flutter_chat_app/app/store/config.dart';
import 'package:flutter_chat_app/app/store/user.dart';
import 'package:get/get.dart';

class RouteWlcomMiddleware extends GetMiddleware {
  int? priority = 0;
  RouteWlcomMiddleware({
   this.priority,
  });

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.Application);
    }else{
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
