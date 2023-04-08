import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_stickers_plus/exceptions.dart';
import 'package:whatsapp_stickers_plus/whatsapp_stickers.dart';

class StickersScreenController extends GetxController {
  //TODO: Implement GBWhatsappChatStickersScreenController

  RxMap stickersMap = {}.obs;
  RxList listStickerDetails = [].obs;

  loadStickersJson() async {
    String data = await rootBundle.loadString('assets/stickers/contents.json');
    stickersMap.value = json.decode(data);
    List tempList = stickersMap.value['sticker_packs'];
    tempList.forEach((element) {
      listStickerDetails.value.add(element);
    });
    update();
  }


  installStickersToWhatsapp({required int index}) async {
    final stickerPack = WhatsappStickers(
        identifier: listStickerDetails.value[index]['identifier'],
        name: listStickerDetails.value[index]['name'],
        publisher: listStickerDetails.value[index]['publisher'],
        trayImageFileName: WhatsappStickerImage.fromAsset(listStickerDetails.value[index]['tray_image_file']),
        publisherWebsite: '',
        privacyPolicyWebsite: '',
        licenseAgreementWebsite: ''
    );

    List listStickers = listStickerDetails[index]['stickers'];
    listStickers.forEach((sticker) {
      String imagePath = sticker['image_path'];
      List<String> emojis = List<String>.from(sticker['emojis']);
      stickerPack.addSticker(WhatsappStickerImage.fromAsset(imagePath), emojis);
      print('listStickers -> ${sticker}');
    });

    try {
      await stickerPack.sendToWhatsApp();
    } on WhatsappStickersException catch (e) {
      print('error upload sticker on whatsapp -> ${e.cause}');
    }
  }


  @override
  void onInit() {
    super.onInit();
    loadStickersJson();
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
