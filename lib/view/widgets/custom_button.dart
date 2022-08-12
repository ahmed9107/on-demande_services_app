import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.width10,
          right:Dimensions.width10
        ),
        width: double.maxFinite,
        height: Dimensions.height50*1.1,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            )
          ),
        ),
      ),
    );
  }
}
