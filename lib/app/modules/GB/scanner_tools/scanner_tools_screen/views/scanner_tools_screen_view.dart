import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/gb_whatsapp_screen/views/gb_whatsapp_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/qr_generator_screen/views/qr_generator_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/qr_scanner_screen/views/qr_scanner_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/scanner_tools_screen_controller.dart';

class ScannerToolsScreenView extends GetView<ScannerToolsScreenController> {
  const ScannerToolsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    ScannerToolsScreenController controller = Get.put(ScannerToolsScreenController());
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
            title: 'Chatting Tools',
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
                  SizedBox(height: 20.sp),
                  Image.asset(ConstantsImage.screen6_logo, height: 58.sp),
                  SizedBox(height: 20.sp),
                  Text('Scanning WhatsApp Tools', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.5.sp), textAlign: TextAlign.center),
                  SizedBox(height: 18.sp),
                  const Text('User can easily scan every QR codes quick \n'
                      ' and fast and also can your generate private \n '
                      'QR Code make it', style: TextStyle(fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                  SizedBox(height: 22.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.22,
                      imagePath: ConstantsImage.qr_scanner_icon,
                      imagePadding: 13.sp,
                      title: 'QR Scanner',
                      onTap: () {
                        Get.to(QrScannerScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.qr_generator_icon,
                      imagePadding: 13.sp,
                      title: 'QR Generator',
                      onTap: () {
                        Get.to(QrGeneratorScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
