import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;
  const SmallText(
      {Key? key,
      this.color = const Color(0xff8e8e8e),
      required this.text,
      this.size = 12.0,
      this.height = 1.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(color: color, fontSize: size, height: height),
    );
  }
}
