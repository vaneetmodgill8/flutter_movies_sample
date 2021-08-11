import 'dart:async';
import 'package:movies_title/app/routes/app_pages.dart';
import 'package:movies_title/app/utils/asset_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashView();
  }
}

class SplashView extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer =
        Timer(Duration(seconds: 3), () => {Get.toNamed(Routes.MoviesView)});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Image(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          image: AssetImage(AssetStrings.appIcon),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
