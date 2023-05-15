import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/facebook_screen/controllers/facebook_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/facebook_screen/views/facebook_instagram_info_screen.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/my_download_screen/views/my_download_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';


class InstagramScreenView extends GetView<FacebookScreenController> {
  const InstagramScreenView({Key? key}) : super(key: key);
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
        body: ConstantWidgets.backgroundTemplate(
            title: 'Instagram',
            titleWidget: Expanded(
              child: Container(
                height: 25.sp,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 22.sp),
                child: Text('Instagram', style: TextStyle(fontSize: 19.5.sp, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
            rightWidget: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(const FacebookInstagramInfoScreenView(), arguments: 'Instagram');
                      adService.checkCounterAd();
                    },
                    child: Image.asset(ConstantsImage.info_button_icon, height: 22.sp)
                ),
                SizedBox(width: 17.sp),
                InkWell(
                    onTap: () async {
                      if(await canLaunchUrl(Uri.parse('https://www.instagram.com/'))) {
                        await launchUrl(Uri.parse('https://www.instagram.com/'));
                      }
                    },
                    child: Image.asset(ConstantsImage.instagram_icon, height: 22.5.sp)
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
                const Text('View Stories & Download', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),),
                SizedBox(height: 24.sp),
                Container(
                  height: 26.sp,
                  width: width * 0.82,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 2)]
                  ),
                  child: Obx(() => TextField(
                    controller: controller.txtInstagramLink.value,
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
                          controller.txtInstagramLink.value.text = cdata?.text ?? '';
                          adService.checkCounterAd();
                        },
                        child: Text('Paste', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                        width: width * 0.26,
                        height: 26.sp
                    ),
                    SizedBox(width: 25.sp),
                    ConstantWidgets.button(
                        onPressed: () async {
                          // FlutterInsta flutterInsta = FlutterInsta();
                          // print('controller.txtInstagramLink.value.text -> ${controller.txtInstagramLink.value.text}');
                          // // String downloadLink = await flutterInsta.downloadReels(controller.txtInstagramLink.value.text);
                          // controller.downloadLink.value = await controller.startDownload(controller.txtInstagramLink.value.text);
                          // print('downloadLink -> ${controller.downloadLink.value}');
                          if(controller.txtInstagramLink.value.text.isEmpty) {
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
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstantWidgets.button(
                        onPressed: () async {
                          if(await canLaunchUrl(Uri.parse('https://www.instagram.com/'))) {
                            await launchUrl(Uri.parse('https://www.instagram.com/'));
                          }
                        },
                        child: Text('Instagram', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
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
