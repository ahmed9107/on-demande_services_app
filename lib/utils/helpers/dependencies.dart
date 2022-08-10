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
  Get.lazyPut(() => StartController());
  Get.lazyPut(() => DateTimeController());
}