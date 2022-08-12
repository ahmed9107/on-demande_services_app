import 'dart:async';
import 'dart:math';

import 'package:fixit/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartController extends GetxController{
  final SharedPreferences sharedPref;
  StartController({required this.sharedPref});
  
  int selectedService = 4;

  getStarted() {
    sharedPref.setString('onboarding', '1');
    Get.offAllNamed(AppRoute.getLogin());
  }

  @override
  void onInit() {
    // Randomly select from service list every 2 seconds
    Timer.periodic(const Duration(seconds: 2), (timer) { 
      selectedService = Random().nextInt(9);
      update();
    });
    super.onInit();
  }
}