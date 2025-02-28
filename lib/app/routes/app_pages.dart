import 'package:get/get.dart';

import 'package:todo_assignment/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:todo_assignment/app/modules/homePage/views/home_page_view.dart';
import 'package:todo_assignment/app/modules/signUp/bindings/sign_up_binding.dart';
import 'package:todo_assignment/app/modules/signUp/views/sign_up_view.dart';
import 'package:todo_assignment/app/modules/signin/bindings/signin_binding.dart';
import 'package:todo_assignment/app/modules/signin/views/signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
