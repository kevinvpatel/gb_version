import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/gb_whatsapp_screen/views/gb_whatsapp_screen_view.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/views/select_tv_screen_view.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/video_downloader_screen/views/video_downloader_screen_view.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/whatsapp_screen/views/whatsapp_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        if(Get.currentRoute == '/HomeScreenView') {
          Get.dialog(AlertDialog(
            contentPadding: const EdgeInsets.only(top: 20),
            content: SizedBox(
              width: width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Alert', style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600, color: Colors.brown),),
                  const SizedBox(height: 15),
                  Text('Do you want to exit the app?', style: TextStyle(fontSize: 17.sp, color: Colors.brown),),
                  const SizedBox(height: 25),
                  const Divider(height: 0,),
                  SizedBox(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => SystemNavigator.pop(),
                          child: Container(
                            width: width * 0.38,
                            alignment: Alignment.center,
                            child: Text('Yes', style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600, color: ConstantsColor.themeColor),),
                          ),
                        ),
                        const VerticalDivider(width: 2),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            width: width * 0.38,
                            alignment: Alignment.center,
                            child: Text('No', style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600, color: ConstantsColor.themeColor),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          title: 'GB Version',
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22.sp),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  controller.listTile(
                    width: width,
                    isLeft: true,
                    title: 'GB', subtitle: 'WhatsApp', description: 'Show Status and Direct Chat',
                    gradientColors: const [Color.fromRGBO(192, 92, 1, 1), Color.fromRGBO(255, 233, 211, 1)],
                    gradientColorsCircle: const [Color.fromRGBO(192, 92, 1, 1), Color.fromRGBO(255, 233, 211, 1)],
                    imagePath: ConstantsImage.home_image1,
                    onTap: () {
                      Get.to(const GbWhatsappScreenView());
                      adService.checkCounterAd();
                    }
                  ),
                  controller.listTile(
                      width: width,
                      isLeft: false,
                      title: 'VIDEO', subtitle: 'Downloader', description: 'HD Video Downloader Any Video',
                      gradientColors: const [ Color.fromRGBO(255, 251, 254, 1), Color.fromRGBO(143, 0, 112, 1)],
                      gradientColorsCircle: const [Color.fromRGBO(143, 0, 112, 1), Color.fromRGBO(255, 251, 254, 1)],
                      imagePath: ConstantsImage.home_image2,
                      onTap: () {
                        Get.to(const VideoDownloaderScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  controller.listTile(
                      width: width,
                      isLeft: true,
                      title: 'GOLDEN', subtitle: 'Status', description: 'Show Status and Save Easily',
                      gradientColors: const [Color.fromRGBO(0, 45, 112, 1), Color.fromRGBO(205, 255, 255, 0)],
                      gradientColorsCircle: const [Color.fromRGBO(0, 45, 112, 1), Color.fromRGBO(255, 251, 254, 1)],
                      imagePath: ConstantsImage.home_image3,
                      onTap: () {
                        Get.to(const WhatsappScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  controller.listTile(
                      width: width,
                      isLeft: false,
                      title: 'SCREEN', subtitle: 'Downloader', description: 'Casting All TV Model Easily',
                      gradientColors: const [Color.fromRGBO(199, 23, 23, 0), Color.fromRGBO(212, 0, 0, 1)],
                      gradientColorsCircle: const [Color.fromRGBO(212, 0, 0, 1), Color.fromRGBO(255, 251, 254, 1)],
                      imagePath: ConstantsImage.home_image4,
                      onTap: () {
                        Get.to(const SelectTvScreenView());
                        adService.checkCounterAd();
                      }
                  ),
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
