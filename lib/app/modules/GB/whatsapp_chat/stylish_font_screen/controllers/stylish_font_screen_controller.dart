import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/font_model.dart';
import 'package:get/get.dart';

class StylishFontScreenController extends GetxController {
  //TODO: Implement GBWhatsappChatStylishFontScreenController

  // TextEditingController txtStylishText = TextEditingController();
  RxString txtStylishText = 'Stylish Font'.obs;
  Rx<FontModel>? fontModel;

  Future<List<Fonts>?> loadFontsJson() async {
    fontModel = FontModel().obs;
    String data = await rootBundle.loadString('assets/stylish_fonts/font_list.json');
    final result = json.decode(data);
    try {
      fontModel?.value = FontModel.fromJson(result);
    } catch (err){
      print('font json err -> $err');
    }
    update();
    return fontModel?.value.fonts;
  }


  @override
  void onInit() {
    super.onInit();
    loadFontsJson();
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
