import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class StartController extends GetxController{
  
  int selectedService = 4;

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