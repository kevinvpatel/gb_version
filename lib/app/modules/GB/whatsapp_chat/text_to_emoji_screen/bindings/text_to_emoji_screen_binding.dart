import 'package:get/get.dart';

import '../controllers/text_to_emoji_screen_controller.dart';

class TextToEmojiScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextToEmojiScreenController>(
      () => TextToEmojiScreenController(),
    );
  }
}
