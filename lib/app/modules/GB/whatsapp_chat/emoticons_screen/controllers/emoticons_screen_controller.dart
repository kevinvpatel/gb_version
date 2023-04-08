import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/emoticons_model.dart';
import 'package:get/get.dart';

class EmoticonsScreenController extends GetxController {
  //TODO: Implement GBWhatsappChatEmoticonsScreenController

  List<String> emotes = [];

  Future<Emote?> loadEmotIconsJson() async {
    Emote? emote;
    String data = await rootBundle.loadString('assets/emoticons/kaomoji.json');
    final result = json.decode(data);
    try {
      emote = Emote.fromJson(result);
    } catch (err){
      print('EmotIcons json err -> $err');
    }
    update();
    return emote;
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
