import 'package:fixit/models/service.dart';
import 'package:flutter/material.dart';

class AppConstants{

  static String iconsRoot = 'assets/icons/';

  static List<Service> services = [
    Service('Cleaning', '${iconsRoot}cleaning.png'),
    Service('Plumber', '${iconsRoot}plumber.png'),
    Service('Electrician', '${iconsRoot}electrician.png'),
    Service('Painter', '${iconsRoot}painter.png'),
    Service('Carpenter', '${iconsRoot}carpenter.png'),
    Service('Gardener', '${iconsRoot}gardener.png'),
    Service('Tailor', '${iconsRoot}tailor.png'),
    Service('Maid', '${iconsRoot}menage.png'),
    Service('Driver', '${iconsRoot}driver.png'),
    Service('Cook', '${iconsRoot}traiteur.png'),
  ];
  
  static final List<dynamic> rooms =[
    ['Living Room', '${iconsRoot}living-room.png', Colors.red, 0],
    ['Bedroom', '${iconsRoot}bedroom.png', Colors.orange, 1],
    ['Bathroom', '${iconsRoot}bath.png', Colors.blue, 1],
    ['Kitchen', '${iconsRoot}kitchen.png', Colors.purple, 0],
    ['Office', '${iconsRoot}office.png', Colors.green, 0]
  ];

  static final List<dynamic> days = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  static final List<String> hours = [
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  static final List<String> repeat = [
    'No repeat',
    'Every day',
    'Every week',
    'Every month'
  ];

  static final List<dynamic> exteraCleaning = [
    ['Washing', '${iconsRoot}washing.png', '10'],
    ['Fridge', '${iconsRoot}fridge.png', '8'],
    ['Oven', '${iconsRoot}oven.png', '8'],
    ['Vehicle', '${iconsRoot}vehicle.png', '20'],
    ['Windows', '${iconsRoot}windows.png', '20'],
  ];
}

enum AniProps { opacity, translateY }