import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/emoticons_screen/views/emoticons_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/emoticons_screen_controller.dart';


class EmoteListScreenView extends GetView<EmoticonsScreenController> {
  const EmoteListScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EmoticonsScreenController controller = Get.put(EmoticonsScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        // Get.off(EmoticonsScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
            height: height,
            width: width,
            title: Get.arguments,
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 18.sp),
              child: Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.emotes.length,
                      itemBuilder: (context, index) {

                        return Container(
                          margin: EdgeInsets.only(top: 0, bottom: 15.sp, left: 12.sp, right: 12.sp),
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          height: 33.sp,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.sp),
                              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${index + 1}'),
                              Text(controller.emotes[index], style: TextStyle(fontSize: 18.sp),),
                              Container(
                                height: 22.sp,
                                width: 22.sp,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.copy, color: Colors.white, size: 18.sp),
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(text: controller.emotes[index]));
                                    Fluttertoast.showToast(msg: 'Copied emote: ${controller.emotes[index]}');
                                    adService.checkCounterAd();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  )
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }

}
