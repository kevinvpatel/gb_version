import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/controllers/select_tv_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/views/screen_cast_process_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TvModelYearScreenView extends GetView<SelectTvScreenController> {
  const TvModelYearScreenView({Key? key}) : super(key: key);
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
            title: 'TV Model Year',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('TV Model Year', style: TextStyle(fontSize: 19.sp, color: Colors.white, fontWeight: FontWeight.w600)),
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
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.sp),
                  Text('Select TV Model - Year', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20.sp),
                  Container(
                    height: 60.sp,
                    width: 50.sp,
                    alignment: Alignment.center,
                    child: CupertinoPicker(
                        itemExtent: 40,
                        onSelectedItemChanged: (int index) {
                          print('controller.lstYear[index] -> ${controller.lstYear[index]}');
                        },
                        children: List.generate(controller.lstYear.length, (index) => Text(controller.lstYear[index], style: const TextStyle(color: Colors.black),))
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  ConstantWidgets.button(
                      onPressed: () async {
                        Get.to(const ScreenCastProcessScreenView());
                        adService.checkCounterAd();
                      },
                      child: Text('Next', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                      width: width * 0.26,
                      height: 26.sp
                  ),
                  const Spacer(),
                  ///Native Advertise
                  Container(
                    height: 55.sp,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17.sp),
                        boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 4, spreadRadius: 1)]
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(17.sp),
                        child: AdService.nativeAd(width: width, height: 52.sp, smallAd: true, radius: 17.sp)
                    ),
                  ),
                  SizedBox(height: 20.sp)
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}