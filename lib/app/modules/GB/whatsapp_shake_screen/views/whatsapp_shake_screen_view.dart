import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/views/trending_tools_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/whatsapp_shake_screen_controller.dart';

class WhatsappShakeScreenView extends GetView<WhatsappShakeScreenController> {
  const WhatsappShakeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WhatsappShakeScreenController controller = Get.put(WhatsappShakeScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        Get.off(TrendingToolsScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'WhatsApp shake',
          leftWidget: InkWell(
              onTap: () => Get.back(),
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.only(top: 25.sp, left: 14.sp, right: 14.sp),
            child: Column(
              children: [
                Text('Just Shake Your Phone and See The magic', style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),),
                SizedBox(height: 23.sp),
                ///Toggle button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WhataApp Shake', style: TextStyle(fontSize: 17.sp, color: Colors.green, fontWeight: FontWeight.w600),),
                    Container(
                      width: width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Transform.scale(
                            scale: 1.5,
                            child: SizedBox(
                              height: 23.sp,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Switch(
                                    activeColor: ConstantsColor.themeColor,
                                    value: controller.isShake.value,
                                    onChanged: (val) {
                                      if(val == true) {
                                        controller.detector.startListening();
                                      } else {
                                        controller.detector.stopListening();
                                      }
                                      controller.isShake.value = val;
                                    }
                                ),
                              ),
                            ),
                          )),
                          Obx(() => Text(controller.isShake.value ? '  ON' : '  OFF', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),),)
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 30.sp),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26.sp),
                  child: Text('By enabling this feature you can open WhatsApp'
                      ' anytime! Just by shaking your phone', style: TextStyle(fontSize: 15.2 .sp, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                ),
                SizedBox(height: 25.sp),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.sp),
                    child: Text('Note : It take around 3 - 4 sec to open home screen',
                        style: TextStyle(fontSize: 15.2.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center)
                ),
                Spacer(),

                ///Native Advertise
                Container(
                  height: 65.sp,
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17.sp),
                      boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 0), blurRadius: 4, spreadRadius: 1)]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.sp),
                    child: AdService.nativeAd(width: width, height: 52.sp, smallAd: false, radius: 17.sp)
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
