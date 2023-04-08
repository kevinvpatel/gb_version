import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/controllers/select_tv_screen_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spring/spring.dart';

class ScreenCastProcessScreenView extends GetView<SelectTvScreenController> {
  const ScreenCastProcessScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SelectTvScreenController controller = Get.put(SelectTvScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    controller.isComplete.value = [false, false, false, false];

    Future.delayed(Duration(milliseconds: 2000), () {
      controller.springController.value[0].play();
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 2200), () {
      controller.isComplete.value[0] = true;
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 4000), () {
      controller.springController.value[1].play();
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 4200), () {
      controller.isComplete.value[1] = true;
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 6000), () {
      controller.springController.value[2].play();
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 6200), () {
      controller.isComplete.value[2] = true;
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 8000), () {
      controller.springController.value[3].play();
      controller.update();
    });
    Future.delayed(Duration(milliseconds: 8200), () {
      controller.isComplete.value[3] = true;
      controller.update();
    });


    return WillPopScope(
      onWillPop: () {
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ConstantWidgets.backgroundTemplate(
            height: height,
            width: width,
            title: 'Screen Cast',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('Screen Cast', style: TextStyle(fontSize: 19.sp, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  controller.progressHeading(index: 3),
                  SizedBox(height: 20.sp),
                  controller.progressLine(title: 'Scanning for TV\'s', index: 0),
                  SizedBox(height: 12.sp),
                  controller.progressLine(title: 'Detecting Model', index: 1),
                  SizedBox(height: 12.sp),
                  controller.progressLine(title: 'Installing Drivers', index: 2),
                  SizedBox(height: 12.sp),
                  controller.progressLine(title: 'Connecting', index: 3),
                  Spacer(),
                  controller.nextButton(index: 3, adService: adService),
                  Spacer(),
                  ///Native Advertise
                  Container(
                    height: 50.sp,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17.sp),
                        boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 4, spreadRadius: 1)]
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(17.sp),
                        child: AdService.nativeAd(width: width, height: 52.sp, smallAd: true, radius: 17.sp)
                    ),
                  ),
                  SizedBox(height: 20.sp)
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}