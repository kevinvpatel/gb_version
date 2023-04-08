import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/gb_whatsapp_screen/views/gb_whatsapp_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/search_profile_screen/views/search_profile_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_shake_screen/views/whatsapp_shake_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_web_screen/views/whatsapp_web_screen_view.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/my_download_screen/views/my_download_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendingToolsScreenView extends GetView<TrendingToolsScreenController> {
  const TrendingToolsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController controller = Get.put(TrendingToolsScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        Get.off(GbWhatsappScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'Trending Tools',
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            height: height,
            width: width,
            margin: EdgeInsets.only(left: 25.sp, right: 25.sp),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20.sp),
                  Image.asset(ConstantsImage.screen4_logo, height: 54.sp),
                  SizedBox(height: 12.sp),
                  Text('Trending WhatsApp Tools', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                  SizedBox(height: 15.sp),
                  Text('Open chat for WhatsApp without saving the number in contacts. '
                      'Coolest Fonts style text direct share on WhatsApp.', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
                  SizedBox(height: 20.sp),
                  controller.thinTile(
                      tileHeight: 29.sp,
                      tileWidth: width * 0.58,
                      backSpace: width * 0.0,
                      imagePath: ConstantsImage.whatsweb_scan_icon,
                      imagePadding: 11.sp,
                      title: 'WhatsWeb Scan',
                      onTap: () {
                        Get.to(WhatsappWebScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  controller.thinTile(
                      tileHeight: 29.sp,
                      tileWidth: width * 0.58,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.whatsapp_shake_icon,
                      imagePadding: 11.sp,
                      title: 'WhatsApp Shake',
                      onTap: () {
                        Get.to(WhatsappShakeScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  controller.thinTile(
                      tileHeight: 29.sp,
                      tileWidth: width * 0.58,
                      backSpace: width * 0.0,
                      imagePath: ConstantsImage.whatsapp_chat_icon,
                      imagePadding: 11.sp,
                      title: 'WhatsApp Chat',
                      onTap: () {
                        Get.to(WhatsappChatScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  controller.thinTile(
                      tileHeight: 29.sp,
                      tileWidth: width * 0.58,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.search_profile_icon,
                      imagePadding: 11.sp,
                      title: 'Search Profile',
                      onTap: () {
                        Get.to(SearchProfileScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  controller.thinTile(
                      tileHeight: 29.sp,
                      tileWidth: width * 0.58,
                      backSpace: width * 0.0,
                      imagePath: ConstantsImage.mydownload_icon,
                      imagePadding: 11.sp,
                      title: 'My Download',
                      onTap: () {
                        Get.to(MyDownloadScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
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
