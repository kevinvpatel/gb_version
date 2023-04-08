import 'package:get/get.dart';

import '../controllers/whatsapp_chat_screen_controller.dart';

class WhatsappChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsappChatScreenController>(
      () => WhatsappChatScreenController(),
    );
  }
}
