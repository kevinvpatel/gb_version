import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SplashScreenController controller = Get.put(SplashScreenController());

    return Scaffold(
      body: Container(
        width: width,
        child: Image.asset(ConstantsImage.splash_logo, fit: BoxFit.cover),
      ),
    );
  }
}
