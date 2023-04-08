import 'package:get/get.dart';

import '../controllers/chatting_tools_screen_controller.dart';

class ChattingToolsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChattingToolsScreenController>(
      () => ChattingToolsScreenController(),
    );
  }
}
