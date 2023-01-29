import 'package:get/get.dart';

import '../../pages/welcome/index.dart';
import '../../pages/sign_in/index.dart';
import '../../pages/application/index.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const SIGN_IN = AppRoutes.SIGN_IN;
  static const Application = AppRoutes.Application;
  // static const INITIAL = AppRoutes.INITIAL;
  // static const INITIAL = AppRoutes.INITIAL;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBinding()),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => const SignInPage(),
        binding: SignInBinding()),
    GetPage(
        name: AppRoutes.Application,
        page: () => const ApplicationPage(),
        binding: ApplicationBinding()),
  ];
}
