import 'package:gb_version_flutter/app/modules/onboarding_screen/views/onboarding_screen_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.to(const OnboardingScreenView());
      // Get.to(HomeScreenView());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
