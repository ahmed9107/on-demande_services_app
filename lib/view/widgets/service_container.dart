import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceContainer extends StatelessWidget {
  final String image;
  final String name;
  final int index;
  const ServiceContainer({
    Key? key,
    required this.image,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectServiceController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.selectServiceIndex(index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(Dimensions.height10),
            decoration: BoxDecoration(
              color: controller.selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
              border: Border.all(
                color: controller.selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(Dimensions.radius5*3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(image, height: Dimensions.height80),
                const SizedBox(height: 20,),
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.font20),)
              ]
            ),
          ),
        );
      }
    );
  }
  /* serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.all(Dimensions.height8),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index ? Colors.blue.shade100 : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(image, height: Dimensions.height60/2),
            SizedBox(height: Dimensions.height10),
            Text(name, style: TextStyle(fontSize: Dimensions.font14),)
          ]
        ),
      ),
    );
  } */
}