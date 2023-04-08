import 'package:get/get.dart';

import '../controllers/scanner_tools_screen_controller.dart';

class ScannerToolsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerToolsScreenController>(
      () => ScannerToolsScreenController(),
    );
  }
}
