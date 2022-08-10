import 'package:get/get.dart';

class SelectServiceController extends GetxController{
  int selectedService = -1;

  void selectServiceIndex(int index){
    if (selectedService == index) {
      selectedService = -1;
    } else {
      selectedService = index;
    }
    update();
  }

  final List<int> selectedRooms = [];

  void selectedRoomIndex(int index){
    if (selectedRooms.contains(index)) {
      selectedRooms.remove(index);
    } else {
      selectedRooms.add(index);
    }
    update();
  }
}