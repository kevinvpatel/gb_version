import 'package:get/get.dart';

import '../controllers/qr_generator_screen_controller.dart';

class QrGeneratorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrGeneratorScreenController>(
      () => QrGeneratorScreenController(),
    );
  }
}
