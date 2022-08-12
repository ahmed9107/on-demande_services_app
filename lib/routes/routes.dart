

import 'package:fixit/utils/middleware/middleware.dart';
import 'package:fixit/view/pages/auth/forget_password_page.dart';
import 'package:fixit/view/pages/auth/login.dart';
import 'package:fixit/view/pages/auth/reset_password_page.dart';
import 'package:fixit/view/pages/auth/signup.dart';
import 'package:fixit/view/pages/auth/verify_code.dart';
import 'package:fixit/view/pages/select_service.dart';
import 'package:fixit/view/pages/splash_screen.dart';
import 'package:fixit/view/pages/start.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashPage = "/splash-page";
  static const String startScreen = "/start";
  static const String initial = "/layout";
  static const String searchPage = "/search";
  static const String selectServicesPage = "/select_services";
  static const String editProfilePage = "/edit-profile";
  static const String notificationPage = "/notification";
  static const String verifyCode = "/pass_verifycode";
  static const String signupVerifyCode = "/signup_verifycode";
  static const String forgetPassword = "/forget_password";
  static const String chatPage = "/chat";
  static const String login = "/";
  static const String signup = "/signup";
  static const String address = "/address";
  static const String resetPass = "/reset_pass";

  static String getSplashPage() => splashPage;
  static String getStartPage() => startScreen;
  static String getLogin() => login;
  static String getSignUpPage() => signup;
  static String getForgetPassPage() => forgetPassword;
  static String getResetPassPage() => resetPass;
  static String getVerifyCodePage() => verifyCode;
  static String getSelectServicesPage() => selectServicesPage;

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn),

    GetPage(
      name: startScreen,
      page: () => const StartPage(),
      transition: Transition.fadeIn,
      middlewares: [AppMiddleware(sharedPref: Get.find())]),

    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: signup,
      page: () => const SignUpPage(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: selectServicesPage,
      page: () => const SelectService(),
      transition: Transition.fadeIn),

    GetPage(
      name: forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.fadeIn),

    GetPage(
      name: resetPass,
      page: () => const ResetPassword(),
      transition: Transition.fadeIn),
    
    GetPage(
      name: verifyCode,
      page: () => const VerifyCode(),
      transition: Transition.fadeIn),
  ];
}