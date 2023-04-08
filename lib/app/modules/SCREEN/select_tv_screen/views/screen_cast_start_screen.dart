import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/controllers/select_tv_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/views/how_to_use_screen.dart';
import 'package:get/get.dart';
import 'package:open_settings/open_settings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenCastStartScreenView extends GetView<SelectTvScreenController> {
  const ScreenCastStartScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SelectTvScreenController controller = Get.put(SelectTvScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

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
              child: Column(
                children: [
                  SizedBox(height: 30.sp),
                  Image.asset(ConstantsImage.screen_cast_icon),
                  SizedBox(height: 30.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ConstantWidgets.button(
                          onPressed: () async {
                            OpenSettings.openCastSetting();
                          },
                          child: Text('Start', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                          width: width * 0.26,
                          height: 26.sp
                      ),
                      ConstantWidgets.button(
                          onPressed: () async {
                            OpenSettings.openCastSetting();
                          },
                          child: Text('Stop', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color.fromRGBO(255, 150, 150, 1), Color.fromRGBO(221, 0, 0, 1)]
                          ),
                          width: width * 0.26,
                          height: 26.sp
                      )
                    ],
                  ),
                  SizedBox(height: 30.sp),
                  Text('Follow the instructions to finish some setting.\n'
                      'Then the screen of your Android phone will be \n'
                      'displayed on your PC.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30.sp),
                  InkWell(
                    onTap: () {
                      Get.to(const HowToUseScreenView());
                      adService.checkCounterAd();
                    },
                    child: Text('How To Use?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}