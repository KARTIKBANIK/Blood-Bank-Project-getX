import 'package:get/get.dart';

import '../modules/drawer_page/bindings/drawer_page_binding.dart';
import '../modules/drawer_page/views/drawer_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction_screen/bindings/introduction_screen_binding.dart';
import '../modules/introduction_screen/views/introduction_screen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/service_ui/bindings/service_ui_binding.dart';
import '../modules/service_ui/views/service_ui_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/slider/bindings/slider_binding.dart';
import '../modules/slider/views/slider_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: _Paths.INTRODUCTION_SCREEN,
      page: () => IntroductionScreenView(),
      binding: IntroductionScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.CUSTOM_SLIDE,
    //   page: () => const CustomSlideView(),
    //   binding: CustomSlideBinding(),
    // ),
    GetPage(
      name: _Paths.SLIDER,
      page: () => const SliderView(),
      binding: SliderBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_UI,
      page: () => const ServiceUiView(),
      binding: ServiceUiBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_PAGE,
      page: () => const DrawerPageView(),
      binding: DrawerPageBinding(),
    ),
  ];
}
