import 'package:fixit/controllers/select_services_controller.dart';
import 'package:fixit/routes/routes.dart';
import 'package:fixit/utils/constants/theme.dart';
import 'package:fixit/utils/localisation/translation.dart';
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
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          theme: Themes.light,
          initialRoute: AppRoute.getSplashPage(),
          getPages: AppRoute.routes,
        );
      }
    );
  }
}
