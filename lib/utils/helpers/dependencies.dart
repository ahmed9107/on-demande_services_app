import 'package:fixit/controllers/auth/forget_password_controller.dart';
import 'package:fixit/controllers/auth/login_controller.dart';
import 'package:fixit/controllers/auth/signup_controller.dart';
import 'package:fixit/controllers/auth/verify_code_controller.dart';
import 'package:fixit/controllers/datetime_controller.dart';
import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/controllers/start_page_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPrefs);

  // Controllers
  Get.lazyPut(() => SelectServiceController());
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => ForgetPassController());
  Get.lazyPut(() => VerifyCodeController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => StartController(sharedPref: Get.find()));
  Get.lazyPut(() => DateTimeController());
}