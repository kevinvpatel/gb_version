import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/data/emoticons_model.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/emoticons_screen/views/emote_list_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/emoticons_screen_controller.dart';

class EmoticonsScreenView extends GetView<EmoticonsScreenController> {
  const EmoticonsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EmoticonsScreenController controller = Get.put(EmoticonsScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        // Get.off(WhatsappChatScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
            height: height,
            width: width,
            title: 'Emoticons',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              margin: EdgeInsets.only(top: 22.sp, bottom: 12.sp),
              child: Column(
                children: [
                  Text('Create Your Emotions', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w600),),
                  SizedBox(height: 15.sp),
                  Expanded(
                    child: FutureBuilder<Emote?>(
                      future: controller.loadEmotIconsJson(),
                      builder: (BuildContext context, AsyncSnapshot<Emote?> snapshot) {
                        if(snapshot.hasData) {
                          List<Emoticons> emotIcons = snapshot.data!.emoticons!;
                          return GridView.builder(
                              padding: EdgeInsets.only(top: 20.sp, left: 17.sp, right: 17.sp),
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.4,
                                  crossAxisSpacing: 18.sp,
                                  mainAxisSpacing: 18.sp
                              ),
                              itemCount: emotIcons.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.emotes = [];
                                    Get.to(const EmoteListScreenView(), arguments: emotIcons[index].title!);
                                    controller.emotes.addAll(emotIcons[index].emote!);
                                    adService.checkCounterAd();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Color.fromRGBO(209, 255, 182, 1), Color.fromRGBO(45, 175, 16, 1)]
                                        ),
                                        borderRadius: BorderRadius.circular(17.sp)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Image.asset('assets/happy 1.png', height: 26.sp),
                                        Text(emotIcons[index].icon!, style: TextStyle(color: Colors.white, fontSize: 25.sp)),
                                        SizedBox(height: 5.sp),
                                        Text(emotIcons[index].title!, style: TextStyle(color: Colors.white, fontSize: 17.5.sp, fontWeight: FontWeight.w600),)
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator(color: ConstantsColor.themeColor));
                        }
                      }
                    )
                  )
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }

}
