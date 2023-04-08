import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/blank_message_screen_controller.dart';

class BlankMessageScreenView extends GetView<BlankMessageScreenController> {
  const BlankMessageScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlankMessageScreenController controller = Get.put(BlankMessageScreenController());
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
          title: 'Blank Message',
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 25.sp),
                  Text('Send Blank Message To Your Friends On \n WhatsApp', style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  SizedBox(height: 20.sp),
                  Obx(() => ChatBubble(
                    clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 20),
                    backGroundColor: const Color.fromRGBO(203, 239, 181, 1),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(controller.blankString.value,
                        style: TextStyle(color: Colors.white),
                      )
                    ),
                  ),),
                  SizedBox(height: 28.sp),
                  Row(
                    children: [
                      Text('Number of Blank Characters :   ', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                      Container(
                        height: 22.sp,
                        width: 26.sp,
                        child: TextField(
                          controller: controller.txtNumbers,
                          cursorColor: ConstantsColor.themeColor,
                          decoration: InputDecoration(
                            hintText: '0',
                            contentPadding: EdgeInsets.all(8.sp),
                            border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: ConstantsColor.themeColor)),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            // controller.blankString.value = val != '' ? val : '0';
                            if(val != '') {
                              String value =  List.generate(int.parse(val), (index) => 'ㅤ').toString();
                              controller.blankString.value = value.replaceAll('[', '').replaceAll(']', '').replaceAll(',', '');
                            } else {
                              controller.blankString.value = '';
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5), /// here char limit is 5
                          ]
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 26.sp),
                  ConstantWidgets.button(
                      onPressed: () async {
                        await launchUrl(Uri.parse('https://api.whatsapp.com/send?text=${controller.blankString.value}'), mode: LaunchMode.externalApplication);
                      },
                      child: Text('Send', style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600)),
                      width: width * 0.35,
                      height: 28.sp
                  ),
                  SizedBox(height: 30.sp),
                  // Spacer(),

                  ///Native Advertise
                  Container(
                    height: 65.sp,
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: 10.sp),
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
                  SizedBox(height: 25.sp)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
