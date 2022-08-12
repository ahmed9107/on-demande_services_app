import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        color: Theme.of(context).primaryColorLight,
        size: 150,
      ),
    );
  }
}