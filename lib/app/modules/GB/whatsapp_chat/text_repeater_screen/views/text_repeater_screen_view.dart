import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/text_repeater_screen_controller.dart';

class TextRepeaterScreenView extends GetView<TextRepeaterScreenController> {
  const TextRepeaterScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextRepeaterScreenController controller = Get.put(TextRepeaterScreenController());
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
          title: 'Text Repeater',
          leftWidget: InkWell(
              onTap: () => Get.back(),
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25.sp, horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Repeat The Text As Much As You Want That To With New Line', style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                SizedBox(height: 28.sp),
                Container(
                  height: 30.sp,
                  width: width * 0.8,
                  child: TextField(
                    controller: controller.txtRepeatText,
                    cursorColor: ConstantsColor.themeColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.sp),
                      hintText: 'Type the text to repeat',
                      fillColor: const Color.fromRGBO(234, 234, 234, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide.none
                      )
                    ),
                    onChanged: (val) {
                      controller.repeatText.value = val;
                    },
                  ),
                ),
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Repetition Times :   ', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                    Container(
                      height: 22.sp,
                      width: 28.sp,
                      child: TextField(
                          controller: controller.txtRepeatTextNumbers,
                          cursorColor: ConstantsColor.themeColor,
                          decoration: InputDecoration(
                            hintText: '0',
                            contentPadding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
                            fillColor: const Color.fromRGBO(234, 234, 234, 1),
                            filled: true,
                            border: const OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.number,
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
                      if(controller.txtRepeatTextNumbers.text != '') {
                        String value = List.generate(int.parse(controller.txtRepeatTextNumbers.text), (index) => controller.txtRepeatText.text).toString();
                        print('value repeatText -> $value');
                        controller.repeatText.value = value.replaceAll('[', '').replaceAll(']', '').replaceAll(',', '');
                      } else {
                        controller.repeatText.value = 'Output here....';
                      }
                      adService.checkCounterAd();
                    },
                    child: Text('Repeat Text', style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600)),
                    width: width * 0.58,
                    height: 28.sp
                ),
                SizedBox(height: 20.sp),
                Obx(() => Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 17.sp),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 255, 232, 1),
                        borderRadius: BorderRadius.circular(18.sp),
                        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                    ),
                    alignment: Alignment.topLeft,
                    width: width,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Text(controller.repeatText.value == '' ? 'Output here....' : controller.repeatText.value,
                          style: TextStyle(fontSize: 16.5.sp, color: Colors.grey.shade700, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),),
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => ConstantWidgets.button(
                        onPressed: controller.repeatText.value == '' ? null : () async {
                          await launchUrl(Uri.parse('https://api.whatsapp.com/send?text=${controller.repeatText.value}'), mode: LaunchMode.externalApplication);
                        },
                        child: Text('Send', style: TextStyle(fontSize: 18.5.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.3,
                        height: 28.sp
                    )),
                    Obx(() => ConstantWidgets.button(
                        onPressed: controller.repeatText.value == '' ? null : () async {
                          controller.repeatText.value = '';
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
