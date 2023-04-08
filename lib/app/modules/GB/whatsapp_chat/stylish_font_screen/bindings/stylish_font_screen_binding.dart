import 'package:get/get.dart';

import '../controllers/stylish_font_screen_controller.dart';

class StylishFontScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StylishFontScreenController>(
      () => StylishFontScreenController(),
    );
  }
}
