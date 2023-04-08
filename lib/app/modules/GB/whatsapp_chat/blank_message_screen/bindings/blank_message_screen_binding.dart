import 'package:get/get.dart';

import '../controllers/blank_message_screen_controller.dart';

class BlankMessageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlankMessageScreenController>(
      () => BlankMessageScreenController(),
    );
  }
}
