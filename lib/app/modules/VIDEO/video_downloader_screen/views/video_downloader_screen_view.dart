import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/facebook_screen/views/facebook_screen_view.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/facebook_screen/views/instagram_screen_view.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/my_download_screen/views/my_download_screen_view.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/whatsapp_screen/views/whatsapp_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/video_downloader_screen_controller.dart';

class VideoDownloaderScreenView extends GetView<VideoDownloaderScreenController> {
  const VideoDownloaderScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    VideoDownloaderScreenController controller = Get.put(VideoDownloaderScreenController());
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
            title: 'VIDEO Downloader',
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
              child: Column(
                children: [
                  SizedBox(height: 27.sp),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Note : ',
                      style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: 'Helps user to get direct links to download \n '
                              'from many social apps, including Facebook, \n'
                              ' Instagram, WhatsApp, ShareChat.',
                          style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w400, height: 4.7.sp),
                        )
                      ]
                    )
                  ),
                  SizedBox(height: 27.sp),
                  controller.thickTile(
                      tileHeight: 35.sp,
                      width: width,
                      backSpace: width * 0.25,
                      imagePath: ConstantsImage.facebook_icon,
                      imagePadding: 14.sp,
                      title: 'Facebook',
                      titleGradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Color.fromRGBO(24, 119, 242, 1), Color.fromRGBO(227, 239, 255, 1)]
                      ),
                      imageGradient: const RadialGradient(
                          radius: 0.5,
                          colors: [Color.fromRGBO(148, 195, 255, 0), Color.fromRGBO(227, 239, 255, 1)]
                      ),
                      onTap: () {
                        Get.to(const FacebookScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 27.sp),
                  controller.thickTile(
                      tileHeight: 35.sp,
                      width: width,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.instagram_icon,
                      imagePadding: 14.sp,
                      title: 'Instagram',
                      titleGradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Color.fromRGBO(207, 58, 158, 1), Color.fromRGBO(246, 79, 80, 1), Color.fromRGBO(255, 240, 194, 1)]
                      ),
                      imageGradient: const RadialGradient(
                          radius: 0.5,
                          colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(252, 154, 137, 1)]
                      ),
                      onTap: () {
                        Get.to(const InstagramScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 27.sp),
                  controller.thickTile(
                      tileHeight: 35.sp,
                      width: width,
                      backSpace: width * 0.25,
                      imagePath: ConstantsImage.whatsapp_icon,
                      imagePadding: 14.sp,
                      title: 'WhatsApp',
                      titleGradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Color.fromRGBO(41, 167, 26, 1), Color.fromRGBO(214, 255, 190, 1)]
                      ),
                      imageGradient: const RadialGradient(
                          radius: 0.7,
                          colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(133, 207, 124, 1)]
                      ),
                      onTap: () {
                        Get.to(const WhatsappScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  const Spacer(),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.145,
                      imagePath: ConstantsImage.mydownload_icon,
                      imagePadding: 12.5.sp,
                      title: 'My Download',
                      onTap: () {
                        Get.to(const MyDownloadScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 35.sp),
                ],
              )
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
