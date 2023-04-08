import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class QrGeneratorScreenController extends GetxController {
  //TODO: Implement GBScannerToolsQrGeneratorScreenController

  RxString qrLink = ''.obs;
  TextEditingController txtLink = TextEditingController();

  ScreenshotController screenshotController = ScreenshotController();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
