import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/views/tv_model_year_screen.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/select_tv_screen_controller.dart';

class SelectTvScreenView extends GetView<SelectTvScreenController> {
  const SelectTvScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
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
            title: 'Select TV Screen',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('Select TV Screen', style: TextStyle(fontSize: 19.sp, color: Colors.white, fontWeight: FontWeight.w600)),
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
                  SizedBox(height: 25.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.08,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'Sony',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.2,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'Samsung',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.06,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'LG',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.2,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'Panasonic',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.06,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'Mi',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.2,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'One Plus TCL',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 20.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.6,
                      backSpace: width * 0.06,
                      imagePath: ConstantsImage.tv_screen_icon,
                      imagePadding: 12.5.sp,
                      endWidget: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                      title: 'Other',
                      onTap: () {
                        Get.to(const TvModelYearScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
