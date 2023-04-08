import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/views/trending_tools_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/whatsapp_web_screen_controller.dart';

class WhatsappWebScreenView extends GetView<WhatsappWebScreenController> {
  const WhatsappWebScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WhatsappWebScreenController controller = Get.put(WhatsappWebScreenController());
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
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'WhatsWeb',
          leftWidget: InkWell(
              onTap: () => Get.back(),
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          rightWidget: InkWell(
              onTap: () {
                if(Platform.isAndroid) {
                  controller.webViewController?.reload();
                }
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10.sp),
                  child: Image.asset(ConstantsImage.refresh_icon, height: 24.sp)
              )
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.sp),
            child: InAppWebView(
              key: controller.webViewKey,
              initialUrlRequest: URLRequest(url: Uri.parse("https://web.whatsapp.com/")),
              initialOptions: controller.options,
              onWebViewCreated: (ctrl) {
                controller.webViewController = ctrl;
              },
              androidOnPermissionRequest: (controller, origin, resources) async {
                return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
              },
              onLoadStop: (controller, url) async {

              },
              onLoadError: (controller, url, code, message) {

              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {

                }
              },
              onConsoleMessage: (controller, consoleMessage) {
                print(consoleMessage);
              },
            ),
          )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
