import 'package:get/get.dart';

import '../controllers/quick_chat_screen_controller.dart';

class QuickChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuickChatScreenController>(
      () => QuickChatScreenController(),
    );
  }
}
