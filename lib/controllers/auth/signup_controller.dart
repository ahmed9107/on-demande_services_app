import 'package:fixit/models/response.dart';
import 'package:fixit/models/signup.dart';
import 'package:fixit/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  late TextEditingController user;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    user = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  goToLogin() {
    Get.offNamed(AppRoute.getLogin());
  }

  bool _emailError = false;
  bool get emailError => _emailError;
  
  bool _nameError = false;
  bool get nameError => _nameError;
  
  bool _phoneError = false;
  bool get phoneError => _phoneError;
  
  bool _passError = false;
  bool get passError => _passError;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  signup() async {
    if (!GetUtils.isEmail(email.text.trim()) || email.text.trim().isEmpty) {
      _emailError = true;
      update();
      return ResponseModel(false, 'Not valid email!');
    }
    if (!GetUtils.isUsername(user.text.trim()) ||
        user.text.trim().isEmpty ||
        user.text.trim().length < 3 ||
        user.text.trim().length > 20) {
      _emailError = false;
      _nameError = true;
      update();
      return ResponseModel(false, 'Not valid Name!');
    }
    if (!GetUtils.isPhoneNumber(phone.text.trim()) ||
        phone.text.trim().isEmpty ||
        phone.text.trim().length < 6 ||
        phone.text.trim().length > 20) {
      _emailError = false;
      _nameError = false;
      _phoneError = true;
      update();
      return ResponseModel(false, 'Not valid phone number!');
    }
    if (password.text.trim().isEmpty ||
        password.text.trim().length < 8 ||
        password.text.trim().length > 30) {
      _emailError = false;
      _nameError  = false;
      _phoneError = false;
      _passError  = true;
      update();
      return ResponseModel(false, 'Not valid Password!');
    }
    SignUpModel signupModel = SignUpModel(
      email   : email.text.trim(),
      username: user.text.trim(),
      phone   : phone.text.trim(),
      password: password.text.trim(),
    );
    _isLoaded = true;
    update();
    _isLoaded = false;
    update();
    //return response;
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  @override
  void dispose() {
    user.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
