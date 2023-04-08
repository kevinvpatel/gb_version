import 'package:get/get.dart';

import '../controllers/select_tv_screen_controller.dart';

class SelectTvScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectTvScreenController>(
      () => SelectTvScreenController(),
    );
  }
}
