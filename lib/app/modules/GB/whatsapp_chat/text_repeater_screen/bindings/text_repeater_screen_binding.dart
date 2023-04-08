import 'package:get/get.dart';

import '../controllers/text_repeater_screen_controller.dart';

class TextRepeaterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextRepeaterScreenController>(
      () => TextRepeaterScreenController(),
    );
  }
}
