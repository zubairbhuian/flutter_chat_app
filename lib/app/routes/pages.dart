import 'package:get/get.dart';

import '../../pages/welcome/binding.dart';
import '../../pages/welcome/view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
  // static const INITIAL = AppRoutes.INITIAL;
  // static const INITIAL = AppRoutes.INITIAL;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBinding())
  ];
}
