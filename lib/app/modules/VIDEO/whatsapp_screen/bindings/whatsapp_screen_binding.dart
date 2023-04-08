import 'package:get/get.dart';

import '../controllers/whatsapp_screen_controller.dart';

class WhatsappScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsappScreenController>(
      () => WhatsappScreenController(),
    );
  }
}
