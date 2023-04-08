import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuickChatScreenController extends GetxController {
  //TODO: Implement GBWhatsappChatQuickChatScreenController

  TextEditingController txtQuickChat = TextEditingController();
  late Box quickChatBox;
  RxList lstText = [].obs;

  ///get Data
  Future<List> hiveInit() async {
    quickChatBox = await Hive.openBox('quick_chat_box');
    lstText.value = quickChatBox.values.toList();
    print('myBox get -> ${lstText.value}');
    return lstText.value;
  }

  ///insert Data
  hiveAdd({required String data}) async {
    quickChatBox = await Hive.openBox('quick_chat_box');
    lstText.value.add(data);
    quickChatBox.add(data);
    print('myBox add -> ${lstText.value}');
  }

  ///delete Data
  hiveDelete({required int index}) async {
    quickChatBox = await Hive.openBox('quick_chat_box');
    lstText.value.removeAt(index);
    quickChatBox.deleteAt(index);
    update();
    print('myBox delete -> ${lstText.value}');
  }

  TextEditingController txtEditController = TextEditingController();
  ///Edit Data
  hiveEdit({required int index, required double width, required AdService adService}) {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: width * 0.75,
              child: TextField(
                controller: txtEditController,
                decoration: const InputDecoration(
                  hintText: 'Enter Text Here',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: ConstantsColor.themeColor)
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.sp),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstantWidgets.button(
                    child: Text('Edit', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w500)),
                    width: width * 0.25,
                    height: 24.sp,
                    onPressed: () async {
                      quickChatBox = await Hive.openBox('quick_chat_box');
                      lstText.value.insert(index, txtEditController.text);
                      quickChatBox.putAt(index, txtEditController.text);
                      update();
                      Get.back();
                      print('myBox delete -> ${lstText.value}');
                      adService.checkCounterAd();
                    },
                ),
                ConstantWidgets.button(
                    child: Text('Cancel', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w500)),
                    width: width * 0.25,
                    height: 24.sp,
                    onPressed: () {
                      Get.back();
                      adService.checkCounterAd();
                    },
                ),
              ],
            )
          ],
        ),
      )
    );
  }


  String backScreen = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    quickChatBox = await Hive.openBox('quick_chat_box');
  }

  @override
  void onReady() {
    super.onReady();
    backScreen = '';
    backScreen = Get.arguments;
    print('Get.arguments 33 -> ${Get.arguments}');
  }

  @override
  void onClose() {
    super.onClose();
  }

}
