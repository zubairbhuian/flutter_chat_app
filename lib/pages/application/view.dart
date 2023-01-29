import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("This is")));
  }
}
