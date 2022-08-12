import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceContainer extends StatelessWidget {
  final void Function()? onTap;
  final Color containerColor;
  final Color borderColor;
  final String image;
  final double imageHeight;
  final double fontSize;
  final String name;
  final int index;
  const ServiceContainer({
    Key? key,
    this.onTap,
    required this.image,
    required this.name,
    required this.index,
    required this.containerColor,
    required this.borderColor,
    required this.imageHeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(Dimensions.height10),
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius5*3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: imageHeight),
            const SizedBox(height: 20,),
            Text(
              name,
              style: GoogleFonts.roboto(fontSize: fontSize),)
          ]
        ),
      ),
    );
  }
}