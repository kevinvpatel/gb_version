import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/modules/onboarding_screen/views/screens.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OnboardingScreenController controller = Get.put(OnboardingScreenController());

    return WillPopScope(
      onWillPop: () {
        controller.selectedPage.value--;
        Screens.pageController.animateToPage(controller.selectedPage.value, duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
        return Future.value(false);
      },
      child: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: Screens.pageController,
          scrollDirection: Axis.horizontal,
          itemCount: controller.lstScreens.length,
          onPageChanged: (page) {
            controller.selectedPage.value = page;
          },
          itemBuilder: (context, index) => controller.lstScreens[index]
        ),
      ),
    );
  }
}
