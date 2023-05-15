import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/facebook_screen/controllers/facebook_screen_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FacebookInstagramInfoScreenView extends GetView<FacebookScreenController> {
  const FacebookInstagramInfoScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FacebookScreenController controller = Get.put(FacebookScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
            title: 'How To Use',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('How To Use', style: TextStyle(fontSize: 19.5.sp, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            height: height,
            width: width,
            child: pageView(data: Get.arguments == 'Facebook' ? controller.lstFacebookInfo : controller.lstInstagramInfo, width: width)
        ),
      ),
    );
  }

  Widget pageView({required List data, required double width}) {
    print('Get.arguments -> ${Get.arguments}');
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: controller.pageController,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.5),
                  child: Image.asset(data[index], fit: BoxFit.contain),
                );
              }
          ),
        ),
        Container(
          height: 37.sp,
          width: width,
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: data.length,
            axisDirection: Axis.horizontal,
            effect: SlideEffect(
              activeDotColor: ConstantsColor.themeColor,
              dotHeight: 10,
              dotColor: Colors.grey.shade800,
              dotWidth: 10,
            ),
          ),
        ),
      ],
    );
  }

}