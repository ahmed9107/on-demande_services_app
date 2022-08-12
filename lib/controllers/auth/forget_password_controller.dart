import 'package:fixit/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController{
  late TextEditingController email;

  /// Reset password
  late TextEditingController newPass;
  late TextEditingController rePassword;

  checkEmail() {
    goToVerifyPage();
  }
  
  goToLogin() {
    Get.offNamed(AppRoute.getLogin());
  }

  goToVerifyPage() {
    Get.offNamed(AppRoute.getVerifyCodePage());
  }

  @override
  void onInit() {
    email = TextEditingController();
    newPass = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    newPass.dispose();
    rePassword.dispose();
    super.dispose();
  }
}