import 'package:get/get.dart';
import '../controllers/direct_chat_screen_controller.dart';

class DirectChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectChatScreenController>(
      () => DirectChatScreenController(),
    );
  }
}
