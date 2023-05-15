import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/facebook_screen/views/facebook_instagram_info_screen.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/my_download_screen/views/my_download_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/facebook_screen_controller.dart';

class FacebookScreenView extends GetView<FacebookScreenController> {
  const FacebookScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FacebookScreenController controller = Get.put(FacebookScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ConstantWidgets.backgroundTemplate(
            title: 'Facebook',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('Facebook', style: TextStyle(fontSize: 19.5.sp, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
            rightWidget: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(const FacebookInstagramInfoScreenView(), arguments: 'Facebook');
                      adService.checkCounterAd();
                    },
                    child: Image.asset(ConstantsImage.info_button_icon, height: 22.sp)
                ),
                SizedBox(width: 17.sp),
                InkWell(
                    onTap: () async {
                      if(await canLaunchUrl(Uri.parse('https://www.facebook.com/'))) {
                        await launchUrl(Uri.parse('https://www.facebook.com/'));
                      }
                    },
                    child: Image.asset(ConstantsImage.facebook_icon, height: 22.5.sp)
                ),
                SizedBox(width: 8.sp),
              ],
            ),
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(height: 24.sp),
                const Text('Facebook Video Download', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),),
                SizedBox(height: 24.sp),
                Container(
                  height: 26.sp,
                  width: width * 0.82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 2)]
                  ),
                  child: Obx(() => TextField(
                    controller: controller.txtFacebookLink.value,
                    cursorColor: ConstantsColor.themeColor,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.sp),
                        hintText: 'Paste Video Link Here',
                        fillColor: const Color.fromRGBO(245, 255, 232, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide.none
                        )
                    ),
                  )),
                ),
                SizedBox(height: 25.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstantWidgets.button(
                        onPressed: () async {
                          ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
                          controller.txtFacebookLink.value.text = cdata?.text ?? '';
                          adService.checkCounterAd();
                        },
                        child: Text('Paste', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.26,
                        height: 26.sp
                    ),
                    SizedBox(width: 25.sp),
                    GetBuilder(
                      init: FacebookScreenController(),
                      builder: (ctrl) {
                        return ConstantWidgets.button(
                            onPressed: () async {
                              // String progress = '';
                              // print('controller.txtFacebookLink.value.text -> ${ctrl.txtFacebookLink.value.text}');
                              // FacebookPost data = await FacebookData.postFromUrl(ctrl.txtFacebookLink.value.text);
                              // Dio dio = Dio();
                              // Dio response = await dio.download(
                              //     ctrl.txtFacebookLink.value.text,
                              //     '/storage/emulated/0/Download/${ctrl.txtFacebookLink.value.text.split('/')[ctrl.txtFacebookLink.value.text.split('/').length -2]}',
                              //     onReceiveProgress: (rcv, total) {
                              //       progress = ((rcv / total) * 100).toStringAsFixed(0);
                              //       final val = double.parse(progress) / 100;
                              //       print('totalll -> ${val}');
                              //     }
                              // ).then((value) {
                              //   if (progress == '100') {
                              //     Fluttertoast.showToast(msg: 'Downloaded to /storage/emulated/0/Download/${ctrl.txtFacebookLink.value.text.split('/')[ctrl.txtFacebookLink.value.text.split('/').length -2]}}');
                              //     Navigator.pop(Get.overlayContext!);
                              //   }
                              //   return dio;
                              // });
                              // print('FacebookPost videoHdUrl -> ${data.videoHdUrl}');
                              // print('FacebookPost postUrl -> ${data.postUrl}');
                              if(controller.txtFacebookLink.value.text.isEmpty) {
                                Get.dialog(
                                    AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: SizedBox(
                                          width: width * 0.7,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20.sp),
                                              const Text('Please Enter Link'),
                                              SizedBox(height: 18.sp),
                                              const Divider(height: 0),
                                              SizedBox(
                                                height: 30.sp,
                                                width: width,
                                                child: TextButton(
                                                    style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                    ).copyWith(overlayColor: MaterialStateProperty.all(ConstantsColor.themeColor.withOpacity(0.3))),
                                                    onPressed: () {
                                                      Get.back();
                                                      adService.checkCounterAd();
                                                    },
                                                    child: const Text('OK', style: TextStyle(color: ConstantsColor.themeColor),)
                                                ),
                                              )
                                            ],
                                          )
                                      ),
                                    )
                                );
                              } else {
                                Get.dialog(
                                    AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: SizedBox(
                                          width: width * 0.7,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20.sp),
                                              const Text('Something Goes Wrong'),
                                              SizedBox(height: 18.sp),
                                              const Divider(height: 0),
                                              SizedBox(
                                                height: 30.sp,
                                                width: width,
                                                child: TextButton(
                                                    style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                    ).copyWith(overlayColor: MaterialStateProperty.all(ConstantsColor.themeColor.withOpacity(0.3))),
                                                    onPressed: () {
                                                      Get.back();
                                                      adService.checkCounterAd();
                                                    },
                                                    child: const Text('OK', style: TextStyle(color: ConstantsColor.themeColor),)
                                                ),
                                              )
                                            ],
                                          )
                                      ),
                                    )
                                );
                              }
                            },
                            child: Text('Download', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                            width: width * 0.34,
                            height: 26.sp
                        );
                      }
                    ),
                  ],
                ),
                SizedBox(height: 32.sp),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Note : ',
                        style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: 'You can use our Facebook Video \n '
                                'Downloader online for free. Our Facebook Video \n '
                                'Downloader service is a great web-based \n '
                                'application which is accessible and easy to use.',
                            style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w400, height: 4.7.sp),
                          )
                        ]
                    )
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstantWidgets.button(
                        onPressed: () async {
                          if(await canLaunchUrl(Uri.parse('https://www.facebook.com/'))) {
                            await launchUrl(Uri.parse('https://www.facebook.com/'));
                          }
                        },
                        child: Text('Facebook', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.34,
                        height: 26.sp
                    ),
                    SizedBox(width: 22.sp),
                    ConstantWidgets.button(
                        onPressed: () {
                          Get.to(const MyDownloadScreenView());
                          adService.checkCounterAd();
                        },
                        child: Text('Downloaded', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.34,
                        height: 26.sp,
                        gradient: ConstantsColor.topToDownBlackGradient
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
              ],
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
