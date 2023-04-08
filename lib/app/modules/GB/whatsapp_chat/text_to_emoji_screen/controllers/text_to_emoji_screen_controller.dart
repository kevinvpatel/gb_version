import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TextToEmojiScreenController extends GetxController {
  //TODO: Implement GBWhatsappChatTextToEmojiScreenController

  RxString text = ''.obs;
  TextEditingController txtEnteredText = TextEditingController();
  TextEditingController txtEmoji = TextEditingController();



  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
