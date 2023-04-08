import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/whatsapp_screen_controller.dart';

class WhatsappScreenView extends GetView<WhatsappScreenController> {
  const WhatsappScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WhatsappScreenController controller = Get.put(WhatsappScreenController());
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
            title: 'WhatsApp Status',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('WhatsApp Status', style: TextStyle(fontSize: 19.5.sp, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(height: 23.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => ConstantWidgets.button(
                        onPressed: () {
                          controller.isWhatsappBussiness.value = false;
                          controller.update();
                          adService.checkCounterAd();
                        },
                        child: Text('WA Status', style: TextStyle(fontSize: 16.6.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.34,
                        height: 27.sp,
                        gradient: !controller.isWhatsappBussiness.value ? null : ConstantsColor.topToDownBlackGradient
                    )),
                    SizedBox(width: 22.sp),
                    Obx(() => ConstantWidgets.button(
                        onPressed: () {
                          controller.isWhatsappBussiness.value = true;
                          controller.update();
                          adService.checkCounterAd();
                        },
                        child: Text('WA Business', style: TextStyle(fontSize: 16.6.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.34,
                        height: 27.sp,
                        gradient: !controller.isWhatsappBussiness.value ? ConstantsColor.topToDownBlackGradient : null
                    )),
                  ],
                ),
                SizedBox(height: 23.sp),
                Expanded(
                  child: GetBuilder(
                    init: WhatsappScreenController(),
                      builder: (ctrl) {
                        if(controller.isWhatsappBussiness.value == true) {
                          print('controller.isSyncWhatsappStories.value -> ${controller.isSyncWhatsappStories.value}');
                          return Container(
                            // color: Colors.blue,
                              padding: EdgeInsets.only(bottom: 20.sp),
                              child: controller.isSyncWhatsappStories.value == false
                                  ? controller.permissionView()
                                  : controller.bussinessStories.value.length > 0 ? controller.storiesGrid(data: controller.bussinessStories.value) : controller.noDataFound()
                          );
                        } else {
                          return Container(
                            // color: Colors.blue,
                              padding: EdgeInsets.only(bottom: 20.sp),
                              child: controller.isSyncStories.value == false
                                  ? controller.permissionView()
                                  : controller.stories.value.length > 0 ? controller.storiesGrid(data: controller.stories.value) : controller.noDataFound()
                          );
                        }
                      }
                  )
                )

              ],
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
