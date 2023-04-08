import 'package:get/get.dart';

import '../controllers/gb_whatsapp_screen_controller.dart';

class GbWhatsappScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GbWhatsappScreenController>(
      () => GbWhatsappScreenController(),
    );
  }
}
