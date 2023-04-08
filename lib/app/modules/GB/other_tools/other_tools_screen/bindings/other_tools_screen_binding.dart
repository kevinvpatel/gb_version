import 'package:get/get.dart';

import '../controllers/other_tools_screen_controller.dart';

class OtherToolsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherToolsScreenController>(
      () => OtherToolsScreenController(),
    );
  }
}
