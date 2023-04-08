import 'package:get/get.dart';

import '../controllers/whatsapp_info_screen_controller.dart';

class WhatsappInfoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsappInfoScreenController>(
      () => WhatsappInfoScreenController(),
    );
  }
}
