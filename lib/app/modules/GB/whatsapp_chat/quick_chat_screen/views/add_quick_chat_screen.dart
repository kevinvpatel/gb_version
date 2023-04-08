import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/quick_chat_screen/controllers/quick_chat_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/quick_chat_screen/views/quick_chat_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddQuickChatScreenView extends GetView<QuickChatScreenController> {
  const AddQuickChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuickChatScreenController controller = Get.put(QuickChatScreenController());
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();
    controller.txtQuickChat.clear();

    return WillPopScope(
      onWillPop: () {
        // Get.off(QuickChatScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'Add Quick Reply',
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.only(top: 22.sp, left: 16.sp, right: 16.sp),
            child: Column(
              children: [
                Text('Add Quick Reply Allows You To Add More Quick pelies',
                    style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                SizedBox(height: 30.sp),
                ///Card
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.sp, left: 12.sp, right: 12.sp),
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 17.sp),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 255, 232, 1),
                        borderRadius: BorderRadius.circular(16.sp),
                        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                    ),
                    width: width,
                    child: TextField(
                      controller: controller.txtQuickChat,
                      cursorColor: ConstantsColor.themeColor,
                      decoration: InputDecoration(
                        hintText: 'Enter your reply here',
                        hintStyle: TextStyle(fontSize: 15.7.sp),
                        border: const OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstantWidgets.button(
                        onPressed: () async {
                          controller.hiveAdd(data: controller.txtQuickChat.text);
                          Get.off(QuickChatScreenView());
                          adService.checkCounterAd();
                        },
                        child: Text('Add', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
                        width: width * 0.35,
                        height: 27.sp
                    ),
                    ConstantWidgets.button(
                        onPressed: () {
                          Get.off(QuickChatScreenView());
                          adService.checkCounterAd();
                        },
                        child: Text('Cancel', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
                        width: width * 0.35,
                        height: 27.sp
                    ),
                  ],
                ),
                SizedBox(height: 25.sp)
              ],
            ),
          ),
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}