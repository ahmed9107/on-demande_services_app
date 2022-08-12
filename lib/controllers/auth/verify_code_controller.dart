import 'package:fixit/routes/routes.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController{
  late String verifyCode;

  checkEmail() {}

  goToResetPassPage() {
    Get.offNamed(AppRoute.getResetPassPage());
  }
}