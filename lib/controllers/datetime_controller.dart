import 'package:fixit/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DateTimeController extends GetxController{

  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  final List<int> _selectedExteraCleaning = [];

  int get selectedDay => _selectedDay;
  int get selectedRepeat => _selectedRepeat;
  String get selectedHour => _selectedHour;
  List<int> get selectedExteraCleaning => _selectedExteraCleaning;

  void selectedDayIndex(int index){
    _selectedDay = AppConstants.days[index][0];
    update();
  }
  
  void selectedHourIndex(int index){
    _selectedHour = AppConstants.hours[index];
    update();
  }
  
  void selectRepeatIndex(int index){
    _selectedRepeat = index;
    update();
  }
  
  void selectExteraCleaning(int index){
    if (_selectedExteraCleaning.contains(index)) {
      _selectedExteraCleaning.remove(index);
    } else {
      _selectedExteraCleaning.add(index);
    }
    update();
  }

  final ItemScrollController scrollController = ItemScrollController();

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.scrollTo(
        index: 24,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.onInit();
  }

}