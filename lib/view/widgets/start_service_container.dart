import 'package:fixit/controllers/start_page_controller.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StartServiceContainer extends StatelessWidget {
  final String image;
  final String name;
  final int index;
  const StartServiceContainer({
    Key? key,
    required this.image,
    required this.name,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: EdgeInsets.all(Dimensions.height8),
            decoration: BoxDecoration(
              color: controller.selectedService == index ? Colors.white : Colors.grey.shade100,
              border: Border.all(
                color: controller.selectedService == index ? Colors.blue.shade100 : Colors.grey.withOpacity(0),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(image, height: Dimensions.height60/2),
                SizedBox(height: Dimensions.height10),
                Text(name, style: GoogleFonts.roboto(fontSize: Dimensions.font14),)
              ]
            ),
          ),
        );
      }
    );
  }
}