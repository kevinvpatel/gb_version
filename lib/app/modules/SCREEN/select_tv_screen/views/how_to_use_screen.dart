import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/controllers/select_tv_screen_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HowToUseScreenView extends GetView<SelectTvScreenController> {
  const HowToUseScreenView({Key? key}) : super(key: key);

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
            title: 'Screen Cast Guide',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('Screen Cast Guide', style: TextStyle(fontSize: 19.sp, color: Colors.white, fontWeight: FontWeight.w600)),
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
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.sp),
                    ///Native Advertise
                    Container(
                      height: 50.sp,
                      width: width,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
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
                    SizedBox(height: 30.sp),
                    Text('Steps :',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 25.sp),
                    steps(index: 1, title: 'Enable the Smart TV.'),
                    SizedBox(height: 25.sp),
                    steps(index: 2, title: 'Tap on the WiFi Display of the application.'),
                    SizedBox(height: 25.sp),
                    steps(index: 3, title: 'TV and Phone should be on same wifi network.'),
                    SizedBox(height: 25.sp),
                    steps(index: 4, title: 'Screen Mirroring application should be enable.'),
                    SizedBox(height: 25.sp),
                    steps(index: 5, title: 'Make sure WiFi connection should be enable.'),
                    SizedBox(height: 25.sp),
                    steps(index: 6, title: 'Both will connect automatically to each other then you can enjoy the Screen Mirroring.'),
                  ],
                ),
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }

  Widget steps({required int index, required String title}) {
    double width = 100.w;
    return Row(
      children: [
        Text('   0$index  ',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 15.sp),
        Container(
          width: width * 0.68,
          child: Text(title,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

}