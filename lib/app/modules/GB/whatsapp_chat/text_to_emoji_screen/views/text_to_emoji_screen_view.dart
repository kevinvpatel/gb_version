import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/text_to_emoji_screen/controllers/text_to_emoji_converter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/text_to_emoji_screen_controller.dart';


class TextToEmojiScreenView extends GetView<TextToEmojiScreenController> {
  const TextToEmojiScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextToEmojiScreenController controller = Get.put(TextToEmojiScreenController());
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
        resizeToAvoidBottomInset: false,
        body: ConstantWidgets.backgroundTemplate(
            height: height,
            width: width,
            title: 'Text To Emoji',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 23.sp, horizontal: 17.sp),
              child: Column(
                children: [
                  Text('Turn Your Text Into Your Favourite Emoji', style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),),
                  SizedBox(height: 25.sp),
                  SizedBox(
                    height: 30.sp,
                    width: width * 0.85,
                    child: TextField(
                      controller: controller.txtEnteredText,
                      cursorColor: ConstantsColor.themeColor,
                      decoration: InputDecoration(
                        hintText: 'Enter Text',
                        fillColor: const Color.fromRGBO(234, 234, 234, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Row(
                    children: [
                      // SizedBox(width: 20.sp),
                      Text('Enter Emoji', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w400),),
                      SizedBox(width: 17.sp),
                      SizedBox(
                        height: 27.sp,
                        width: 29.sp,
                        child: TextField(
                          controller: controller.txtEmoji,
                          cursorColor: ConstantsColor.themeColor,
                          style: TextStyle(fontSize: 18.5.sp),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                              hintText: '😀',
                              hintStyle: TextStyle(fontSize: 18.5.sp),
                              fillColor: const Color.fromRGBO(234, 234, 234, 1),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  borderSide: BorderSide.none
                              ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1), /// here char limit is 1
                          ],
                        ),
                      ),
                      Spacer(),
                      ConstantWidgets.button(
                          onPressed: () async {
                            if(controller.txtEmoji.text.isEmpty) {
                              controller.txtEmoji.text = '😀';
                            }
                            controller.text.value = await textToEmojiConverter(text: controller.txtEnteredText.text);
                            controller.text.value = controller.text.value.replaceAll('#', '');
                            controller.text.value = controller.text.value.replaceAll('*', controller.txtEmoji.text);
                            print('controller.text.value222 -> ${controller.text.value}');
                            controller.update();
                            adService.checkCounterAd();
                          },
                          child: Text('Convert', style: TextStyle(fontSize: 18.5.sp, fontWeight: FontWeight.w600)),
                          width: width * 0.3,
                          contentPadding: EdgeInsets.zero,
                          height: 26.5.sp
                      ),
                    ],
                  ),
                  SizedBox(height: 20.sp),
                  Expanded(
                    child: Obx(() => Container(
                      padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 17.sp),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 255, 232, 1),
                          borderRadius: BorderRadius.circular(18.sp),
                          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                      ),
                      alignment: Alignment.center,
                      width: width,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: controller.text.value == '' || controller.text.value == ' ' ? Text('Your Text To Emoji Is Here',
                            style: TextStyle(fontSize: 15.8.sp, color: Colors.grey.shade700, fontWeight: FontWeight.w400))
                            : GetBuilder(
                            init: TextToEmojiScreenController(),
                            builder: (cntrl) {
                              print('controller.text.value -> ${controller.text.value}');
                              return Text(cntrl.text.value,
                                  style: TextStyle(fontSize: 15.8.sp, color: Colors.grey.shade700, fontWeight: FontWeight.w400));
                            }
                        ),
                      ),
                    )),
                  ),
                  SizedBox(height: 20.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => ConstantWidgets.button(
                          onPressed: controller.text.value == '' || controller.text.value == ' ' ? null : () async {
                            await launchUrl(Uri.parse('https://api.whatsapp.com/send?text=${controller.text.value}'), mode: LaunchMode.externalApplication);
                          },
                          child: Text('Send', style: TextStyle(fontSize: 18.5.sp, fontWeight: FontWeight.w600)),
                          width: width * 0.3,
                          height: 28.sp
                      )),
                      Obx(() => ConstantWidgets.button(
                          onPressed: controller.text.value == '' || controller.text.value == ' ' ? null : () async {
                            controller.text.value = '';
                            adService.checkCounterAd();
                          },
                          child: Text('Delete', style: TextStyle(fontSize: 18.5.sp, fontWeight: FontWeight.w600)),
                          width: width * 0.3,
                          height: 28.sp
                      )),
                    ],
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
