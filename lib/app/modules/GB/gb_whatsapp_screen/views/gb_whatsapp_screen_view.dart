import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/chatting_tools_screen/views/chatting_tools_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/other_tools/other_tools_screen/views/other_tools_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/scanner_tools_screen/views/scanner_tools_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/views/trending_tools_screen_view.dart';
import 'package:gb_version_flutter/app/modules/home_screen/views/home_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/gb_whatsapp_screen_controller.dart';

class GbWhatsappScreenView extends GetView<GbWhatsappScreenController> {
  const GbWhatsappScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GbWhatsappScreenController controller = Get.put(GbWhatsappScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        Get.off(const HomeScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
            title: 'GB WhatsApp',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            height: height,
            width: width,
            child: Container(
              height: height,
              // color: Colors.orange,
              margin: EdgeInsets.only(top: 30.sp, left: 15.sp, right: 15.sp, bottom: 20.sp),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    controller.thickTile(
                        tileHeight: 34.sp,
                        width: width,
                        backSpace: width * 0.22,
                        imagePath: ConstantsImage.trending_tool,
                        imagePadding: 10.sp,
                        title: 'Trending Tools',
                        onTap: () {
                          Get.to(const TrendingToolsScreenView());
                          adService.checkCounterAd();
                        }
                    ),
                    SizedBox(height: 25.sp),
                    controller.thickTile(
                        tileHeight: 34.sp,
                        width: width,
                        backSpace: width * 0.08,
                        imagePath: ConstantsImage.chatting_tool,
                        imagePadding: 14.5.sp,
                        title: 'Chatting Tools',
                        onTap: (){
                          Get.to(const ChattingToolsScreenView());
                          adService.checkCounterAd();
                        }
                    ),
                    SizedBox(height: 25.sp),
                    controller.thickTile(
                        tileHeight: 34.sp,
                        width: width,
                        backSpace: width * 0.22,
                        imagePath: ConstantsImage.scanner_tool,
                        imagePadding: 14.sp,
                        title: 'Scanner Tools',
                        onTap: (){
                          Get.to(const ScannerToolsScreenView());
                          adService.checkCounterAd();
                        }
                    ),
                    SizedBox(height: 25.sp),
                    controller.thickTile(
                        tileHeight: 34.sp,
                        width: width,
                        backSpace: width * 0.08,
                        imagePath: ConstantsImage.other_tool,
                        imagePadding: 14.sp,
                        title: 'Other Tools',
                        onTap: (){
                          Get.to(const OtherToolsScreenView());
                          adService.checkCounterAd();
                        }
                    ),
                    SizedBox(height: 25.sp),
                    // Spacer(),

                    ///Native Advertise
                    Container(
                      height: 52.sp,
                      width: width,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 12.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                          boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 4, spreadRadius: 1)]
                      ),
                      child: AdService.nativeAd(width: width, height: 52.sp, smallAd: true, radius: 15.sp),
                    ),
                    SizedBox(height: 12.sp),
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
