import 'package:fixit/models/response.dart';
import 'package:fixit/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool _emailError = false;
  bool get emailError => _emailError;
  
  bool _emptyError = false;
  bool get emptyError => _emptyError;
  
  final bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  /* Future<ResponseModel>  */login() async {
    if (!GetUtils.isEmail(emailController.text.trim()) || emailController.text.trim().isEmpty) {
      _emailError = true;
      update();
      return ResponseModel(false, 'Not valid email');
    }
    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      _emailError = false;
      _emptyError = true;
      update();
      return ResponseModel(false, 'Empty Fiels!');
    }
    Get.offNamed(AppRoute.getSelectServicesPage());
  }

  /* void saveUserNumberAndPassword(String phone, String password){
    authRepo.saveUserNumberAndPassword(phone, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  } */

  goToSignUp() {
    Get.offNamed(AppRoute.getSignUpPage());
  }

  goToForgetPass() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  /* bool clearSharedData(){
    return authRepo.clearSharedData();
  } */

  /* goToForgetPass() {
    Get.toNamed(AppRoute.forgetPassword);
  } */

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
