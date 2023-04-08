import 'package:get/get.dart';

import '../controllers/stickers_screen_controller.dart';

class StickersScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StickersScreenController>(
      () => StickersScreenController(),
    );
  }
}
