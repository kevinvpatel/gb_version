import 'package:get/get.dart';

import '../controllers/facebook_screen_controller.dart';

class FacebookScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacebookScreenController>(
      () => FacebookScreenController(),
    );
  }
}
