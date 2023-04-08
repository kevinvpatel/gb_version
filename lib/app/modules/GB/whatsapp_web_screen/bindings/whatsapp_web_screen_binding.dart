import 'package:get/get.dart';

import '../controllers/whatsapp_web_screen_controller.dart';

class WhatsappWebScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsappWebScreenController>(
      () => WhatsappWebScreenController(),
    );
  }
}
