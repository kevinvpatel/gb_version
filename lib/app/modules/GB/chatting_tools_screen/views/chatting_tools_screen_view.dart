import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/gb_whatsapp_screen/views/gb_whatsapp_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/blank_message_screen/views/blank_message_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/direct_chat_screen/views/direct_chat_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/emoticons_screen/views/emoticons_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/quick_chat_screen/views/quick_chat_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/stickers_screen/views/stickers_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/stylish_font_screen/views/stylish_font_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/text_repeater_screen/views/text_repeater_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/text_to_emoji_screen/views/text_to_emoji_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/chatting_tools_screen_controller.dart';

class ChattingToolsScreenView extends GetView<ChattingToolsScreenController> {
  const ChattingToolsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
    onWillPop: () {
      Get.off(GbWhatsappScreenView());
      adService.checkBackCounterAd();
      return Future.value(true);
    },
    child: Scaffold(
      body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'Chatting Tools',
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 15.sp),
                  Image.asset(ConstantsImage.screen5_logo, height: 55.sp),
                  Text('Chatting WhatsApp Tools', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.5.sp), textAlign: TextAlign.center),
                  SizedBox(height: 15.sp),
                  Text('This Features Acts As a Perfect Tool For \n WhatsApp', style: TextStyle(fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.whatsapp_chat_icon,
                      imagePadding: 13.sp,
                      title: 'WhatsApp Chat',
                      onTap: () {
                        Get.to(DirectChatScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.22,
                      imagePath: ConstantsImage.quick_chat_icon,
                      imagePadding: 13.sp,
                      title: 'Quick Chat',
                      onTap: () {
                        Get.to(QuickChatScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.sticker_icon,
                      imagePadding: 13.sp,
                      title: 'Stickers',
                      onTap: () {
                        Get.to(StickersScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.22,
                      imagePath: ConstantsImage.blank_message_icon,
                      imagePadding: 13.sp,
                      title: 'Blank Message',
                      onTap: () {
                        Get.to(BlankMessageScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.text_repeater_icon,
                      imagePadding: 13.sp,
                      title: 'Text Repeater',
                      onTap: () {
                        Get.to(TextRepeaterScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.22,
                      imagePath: ConstantsImage.font_style_icon,
                      imagePadding: 13.sp,
                      title: 'Font Style',
                      onTap: () {
                        Get.to(StylishFontScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.text_to_emoji_icon,
                      imagePadding: 13.sp,
                      title: 'Text To Emoji',
                      onTap: () {
                        Get.to(TextToEmojiScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.56,
                      backSpace: width * 0.22,
                      imagePath: ConstantsImage.emoticons_icon,
                      imagePadding: 13.sp,
                      title: 'Emoticons',
                      onTap: () {
                        Get.to(EmoticonsScreenView());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 18.sp),
                ],
              ),
            ),
          )
      ),
      bottomNavigationBar: AdService.bannerAd(width: width),
    ),
  );
  }
}
