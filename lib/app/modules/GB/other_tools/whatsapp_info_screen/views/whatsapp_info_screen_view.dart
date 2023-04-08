import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/whatsapp_info_screen_controller.dart';


class WhatsappInfoScreenView extends GetView<WhatsappInfoScreenController> {
  const WhatsappInfoScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WhatsappInfoScreenController controller = Get.put(WhatsappInfoScreenController());
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
            title: 'GB Latest Version Info',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),
                  const Text('WhatsApp Messanger', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                  SizedBox(height: 25.sp),
                  const Text('Version 2.21.5.66', style: TextStyle(fontSize: 17.5, color: Colors.grey, fontWeight: FontWeight.w400)),
                  SizedBox(height: 25.sp),
                  Image.asset(ConstantsImage.info_logo_icon, fit: BoxFit.cover, height: width * 0.38, width: width * 0.38),
                  SizedBox(height: 25.sp),
                  const Text('2010-2025 WhatsApp inc.', style: TextStyle(fontSize: 17.5, color: Colors.grey, fontWeight: FontWeight.w400)),
                  const Spacer(flex: 2)
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
