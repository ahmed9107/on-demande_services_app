import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/view/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/helpers/dependencies.dart' as dependency;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectServiceController>(builder: (_) {
      return const GetMaterialApp(
          home: StartPage(),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
