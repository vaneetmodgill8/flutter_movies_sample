import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_title/app/routes/app_pages.dart';
import 'app/ui/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    title: 'Movies Title Sample',
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.Splash,
    theme: appThemeData,
    defaultTransition: Transition.rightToLeft,
    getPages: AppPages.pages,
  ));
}
