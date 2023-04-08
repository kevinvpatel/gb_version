import 'package:get/get.dart';

import '../controllers/whatsapp_shake_screen_controller.dart';

class WhatsappShakeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsappShakeScreenController>(
      () => WhatsappShakeScreenController(),
    );
  }
}
