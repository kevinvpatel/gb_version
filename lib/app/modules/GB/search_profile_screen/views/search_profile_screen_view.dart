import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/search_profile_screen/controllers/search_profile_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/views/trending_tools_screen_view.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';


class SearchProfileScreenView extends GetView<SearchProfileScreenController> {
  const SearchProfileScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SearchProfileScreenController controller = Get.put(SearchProfileScreenController());
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
        resizeToAvoidBottomInset: false,
        body: ConstantWidgets.backgroundTemplate(
            height: height,
            width: width,
            title: 'Search Profile',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              margin: EdgeInsets.only(top: 24.sp, left: 12.sp, right: 12.sp),
              child: Column(
                children: [
                  Text('This Features Acts As a Find Profile \n Without Adding Them First To Your \n Contact List',
                    style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(height: 30.sp),

                  Spacer(),
                  Container(
                    // height: 60.sp,
                    width: width * 0.84,
                    padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 17.sp, bottom: 20.sp),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 255, 232, 1),
                        borderRadius: BorderRadius.circular(17.sp),
                        boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                    ),
                    child: Column(
                      children: [
                        Text('Enter Your Number', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
                        SizedBox(height: 20.sp),
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
                                      print('country.dialCode-> ${country.dialCode}');
                                      print('country.code-> ${country.code}');
                                      print('country.name-> ${country.name}');
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
                                controller: controller.txtSearchedPhoneNumber.value,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 23.sp),
                  Obx(() => ConstantWidgets.button(
                      onPressed: controller.isPhoneNumberEnable.value == false ? null : () async {
                        String phoneNumber = controller.countryDialCode.value + controller.txtSearchedPhoneNumber.value.text;
                        phoneNumber = phoneNumber.replaceAll('+', '');
                        // await launchUrl(Uri.parse('https://wa.me/$phoneNumber?text= '), mode: LaunchMode.externalApplication);
                        await launchUrl(Uri.parse('https://wa.me/$phoneNumber'), mode: LaunchMode.externalApplication);
                      },
                      child: Text('Search Profile', style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600)),
                      width: width * 0.7,
                      height: 28.sp
                  ),),
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
