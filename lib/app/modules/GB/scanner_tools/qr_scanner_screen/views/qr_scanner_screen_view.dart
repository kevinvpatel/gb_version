import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/qr_scanner_screen/views/scanner_screen.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/qr_scanner_screen_controller.dart';


class QrScannerScreenView extends GetView<QrScannerScreenController> {
  const QrScannerScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    QrScannerScreenController controller = Get.put(QrScannerScreenController());
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
              margin: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                children: [
                  SizedBox(height: 22.sp),
                  Image.asset(ConstantsImage.qr_code_scan_icon, height: 48.sp),
                  SizedBox(height: 30.sp),
                  trendingToolsScreenController.thinTile(
                      tileHeight: 30.sp,
                      tileWidth: width * 0.63,
                      backSpace: width * 0.1,
                      imagePath: ConstantsImage.scan_qr_icon,
                      imagePadding: 13.sp,
                      title: 'Scan QR & Barcode',
                      onTap: () {
                        Get.off(ScannerScreen());
                        adService.checkCounterAd();
                      }
                  ),
                  SizedBox(height: 28.sp),
                  ConstantWidgets.button(
                      onPressed: Get.arguments != null ? () {
                        Share.share(Get.arguments);
                      } : null,
                      child: Text('Share', style: TextStyle(fontSize: 18.5.sp, fontWeight: FontWeight.w600)),
                      width: width * 0.32,
                      height: 28.sp
                  ),
                  SizedBox(height: 28.sp),
                  Container(
                    height: 50.sp,
                    margin: EdgeInsets.only(bottom: 20.sp, left: 12.sp, right: 12.sp),
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 17.sp),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 255, 232, 1),
                        borderRadius: BorderRadius.circular(16.sp),
                        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                    ),
                    width: width,
                    alignment: Alignment.center,
                    child: Text(Get.arguments != null ? Get.arguments : 'Result will be here', style: TextStyle(color: Colors.grey.shade600),),
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
