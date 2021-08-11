// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:movies_title/app/routes/app_pages.dart';
import 'package:movies_title/app/ui/theme/app_theme.dart';
import 'package:movies_title/app/ui/views/splash/splash.dart';

import 'package:movies_title/main.dart';

void main() {
  testWidgets('Superman List Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(
      title: 'Movies Title Sample',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.Splash,
      theme: appThemeData,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.pages,
    ));
    await tester.pump(const Duration(milliseconds: 10000));
    Text firstText = find
        .descendant(
          of: find.byType(Table),
          matching: find.byType(Text),
        )
        .evaluate()
        .first
        .widget;

    expect(firstText.data, 'Superman');
    await tester.tap(find.text('Superman'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
  });
}
