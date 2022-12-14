import 'dart:async';
import 'package:fixit/routes/routes.dart';
import 'package:fixit/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  /// TickerProviderStateMixin => this for animation if you need to do animation
  late Animation<double> animation;
  late AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..forward();
    animation = CurvedAnimation(parent: animController, curve: Curves.linear);
    Timer(const Duration(seconds: 3), () => Get.offNamed(AppRoute.getStartPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                child: Image.asset('assets/images/a.png',
                  color: Theme.of(context).primaryColorLight,
                  width: Dimensions.height210),
              )),
        ],
      ),
    );
  }
}
