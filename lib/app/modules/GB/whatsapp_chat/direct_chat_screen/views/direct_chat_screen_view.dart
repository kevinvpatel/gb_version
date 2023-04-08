import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/direct_chat_screen_controller.dart';


class DirectChatScreenView extends GetView<DirectChatScreenController> {
  const DirectChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DirectChatScreenController controller = Get.put(DirectChatScreenController());
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
          title: 'WhatsApp Chat',
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.only(top: 25.sp, left: 12.sp, right: 12.sp),
            child: Column(
              children: [
                Text('Direct Chat With an Unsaved Number', style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),),
                SizedBox(height: 23.sp),
                Container(
                  width: width * 0.84,
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 17.sp),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 255, 232, 1),
                    borderRadius: BorderRadius.circular(17.sp),
                    boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                  ),
                  child: Column(
                    children: [
                      Text('Enter Your Number', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
                      SizedBox(height: 15.sp),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              // width: width * 0.29,
                              height: 27.sp,
                              child: IntlPhoneField(
                                dropdownTextStyle: TextStyle(fontSize: 15.sp),
                                flagWidth: 20.sp,
                                disableLengthCheck: true,
                                flagsButtonPadding: EdgeInsets.only(left: 13.sp),
                                decoration: const InputDecoration(
                                  fillColor: Color.fromRGBO(237, 235, 235, 1),
                                  filled: true,
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                                dropdownIconPosition: IconPosition.trailing,
                                initialCountryCode: 'IN',
                                onCountryChanged: (country) {
                                  controller.countryDialCode.value = '+${country.dialCode}';
                                },
                              )
                            ),
                          ),
                          SizedBox(width: 15.sp),
                          controller.textField(
                            width: width * 0.46,
                            height: 27.sp,
                            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18.sp),
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(fontSize: 15.sp),
                            controller: controller.txtPhoneNumber.value,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10), /// here char limit is 10
                            ],
                              onChanged: (phoneNumber) {
                                if(phoneNumber.length >= 10) {
                                  controller.isPhoneNumberEnable.value = true;
                                } else {
                                  controller.isPhoneNumberEnable.value = false;
                                }
                              }
                          ),
                        ],
                      ),
                      SizedBox(height: 15.sp),
                      controller.textField(
                          width: width * 0.78,
                          height: 35.sp,
                          padding: EdgeInsets.symmetric(vertical: 0.sp, horizontal: 18.sp),
                          hintText: 'Enter Message',
                          hintStyle: TextStyle(fontSize: 15.5.sp),
                          controller: controller.txtMessage.value,
                          keyboardType: TextInputType.multiline,
                          onChanged: (message) {
                            if(message != '') {
                              controller.isMessageEnable.value = true;
                            } else {
                              controller.isMessageEnable.value = false;
                            }
                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23.sp),
                Obx(() {
                  return ConstantWidgets.button(
                      onPressed: controller.isMessageEnable.value == false || controller.isPhoneNumberEnable.value == false ? null : () async {
                        String phoneNumber = controller.countryDialCode.value + controller.txtPhoneNumber.value.text;
                        phoneNumber = phoneNumber.replaceAll('+', '');
                        String text = controller.txtMessage.value.text;
                        await launchUrl(Uri.parse('https://wa.me/$phoneNumber?text=$text'), mode: LaunchMode.externalApplication);
                      },
                      child: Text('Send Message', style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600)),
                      width: width * 0.7,
                      height: 28.sp
                  );
                }),
                Spacer(),

                ///Native Advertise
                Container(
                  height: 60.sp,
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
