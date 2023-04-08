import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/other_tools/fake_story_screen/views/fake_story_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/other_tools/whatsapp_info_screen/views/whatsapp_info_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/scanner_tools_screen/controllers/scanner_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:get/get.dart';
import 'package:open_settings/open_settings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/other_tools_screen_controller.dart';

class OtherToolsScreenView extends GetView<OtherToolsScreenController> {
  const OtherToolsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    ScannerToolsScreenController controller = Get.put(ScannerToolsScreenController());
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
            height: height,
            width: width,
            title: 'Other Tools',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              height: height,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20.sp),
                    Image.asset(ConstantsImage.screen2_logo, height: 58.sp),
                    SizedBox(height: 20.sp),
                    Text('Scanning WhatsApp Tools', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.5.sp), textAlign: TextAlign.center),
                    SizedBox(height: 18.sp),
                    const Text('This tools helps to create a fake story and \n '
                        'set to in dark mode and find WhatsApp \n '
                        'about informaion',
                        style: TextStyle(fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                    SizedBox(height: 22.sp),
                    trendingToolsScreenController.thinTile(
                        tileHeight: 30.sp,
                        tileWidth: width * 0.56,
                        backSpace: width * 0.22,
                        imagePath: ConstantsImage.fake_story_icon,
                        imagePadding: 13.sp,
                        title: 'Fake Story',
                        onTap: () {
                          Get.to(FakeStoryScreenView());
                          adService.checkCounterAd();
                        }
                    ),
                    SizedBox(height: 18.sp),
                    trendingToolsScreenController.thinTile(
                        tileHeight: 30.sp,
                        tileWidth: width * 0.56,
                        backSpace: width * 0.1,
                        imagePath: ConstantsImage.info_icon,
                        imagePadding: 12.5.sp,
                        title: 'WhatsApp Info',
                        onTap: () {
                          Get.to(WhatsappInfoScreenView());
                          adService.checkCounterAd();
                        }
                    ),
                    SizedBox(height: 18.sp),
                    trendingToolsScreenController.thinTile(
                        tileHeight: 30.sp,
                        tileWidth: width * 0.56,
                        backSpace: width * 0.22,
                        imagePath: ConstantsImage.dark_mode_icon,
                        imagePadding: 12.sp,
                        title: 'Dark Mode',
                        onTap: () {
                          OpenSettings.openDisplaySetting();
                        }
                    ),
                    SizedBox(height: 18.sp),
                  ],
                ),
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
