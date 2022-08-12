import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone, 
          style: GoogleFonts.roboto(
            color: Theme.of(context).primaryColorLight
          )),
        SizedBox(width: Dimensions.width10),
        InkWell(
          onTap: onTap,
          child: Text(texttwo,
            style: TextStyle(
              color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
