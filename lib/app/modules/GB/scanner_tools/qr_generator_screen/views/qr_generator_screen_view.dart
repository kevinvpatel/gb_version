import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/qr_generator_screen_controller.dart';

class QrGeneratorScreenView extends GetView<QrGeneratorScreenController> {
  const QrGeneratorScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    QrGeneratorScreenController controller = Get.put(QrGeneratorScreenController());
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
            height: height,
            width: width,
            title: 'QR Generator',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              child: Column(
                children: [
                  Image.asset(ConstantsImage.screen7_logo, height: height * 0.26),
                  SizedBox(height: 10.sp),
                  SizedBox(
                    height: 29.sp,
                    width: width * 0.85,
                    child: TextField(
                      cursorColor: ConstantsColor.themeColor,
                      controller: controller.txtLink,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.sp),
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
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.63,
                      backSpace: width * 0.13,
                      imagePath: ConstantsImage.generate_qr_code_icon,
                      imagePadding: 11.5.sp,
                      title: 'Generate QR Code',
                      onTap: () {
                        controller.qrLink.value = controller.txtLink.text;
                        controller.update();
                        adService.checkCounterAd();
                      }
                  ),
                  Spacer(),
                  ConstantWidgets.button(
                      onPressed: () async {
                        await controller.screenshotController.capture(delay: const Duration(milliseconds: 10)).then((Uint8List? image) async {
                          if (image != null) {
                            final directory = await getTemporaryDirectory();
                            final imagePath = await File('${directory.path}/qr_code${DateTime.now().microsecondsSinceEpoch}.png').create();
                            await imagePath.writeAsBytes(image);

                            /// Share Plugin
                            await Share.shareXFiles([XFile(imagePath.path)]);
                          }
                        });

                      },
                      child: Text('Share', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                      width: width * 0.26,
                      height: 26.sp
                  ),
                  Spacer(),
                  Screenshot(
                    controller: controller.screenshotController,
                    child: Container(
                      height: 56.sp,
                      margin: EdgeInsets.only(bottom: 14.sp, left: 12.sp, right: 12.sp),
                      padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 17.sp),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 255, 232, 1),
                          borderRadius: BorderRadius.circular(19.sp),
                          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                      ),
                      width: width,
                      alignment: Alignment.center,
                      child: controller.txtLink.text.isEmpty ? Text('Result will be here', style: TextStyle(color: Colors.grey.shade600),) : Obx(() => QrImage(
                        data: controller.qrLink.value,
                        version: QrVersions.auto,
                        size: 50.sp,
                      )),
                    ),
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
