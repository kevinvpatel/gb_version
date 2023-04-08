import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/modules/onboarding_screen/views/screens.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreenController extends GetxController {
  //TODO: Implement OnboardingScreenController

  List<Widget> lstScreens = [Screens.screen1(), Screens.screen2(), Screens.screen3()];

  RxInt selectedPage = 0.obs;

  Widget roundedButton({required Function() onPressed, required Widget child, required String label}) {
    return Column(
      children: [
        SizedBox(
          height: 31.5.sp, width: 31.5.sp,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(196, 255, 188, 1),
                  padding: EdgeInsets.all(11.5.sp),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.sp))
              ),
              child: child
          ),
        ),
        SizedBox(height: 8.sp),
        Text(label, style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),)
      ],
    );
  }




  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
