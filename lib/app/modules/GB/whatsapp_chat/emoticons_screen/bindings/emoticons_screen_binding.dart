import 'package:get/get.dart';

import '../controllers/emoticons_screen_controller.dart';

class EmoticonsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmoticonsScreenController>(
      () => EmoticonsScreenController(),
    );
  }
}
