import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:get/get.dart';

class SearchProfileScreenController extends GetxController {
  //TODO: Implement GBWhatsappChatSearchProfileScreenController

  RxString countryDialCode = '+91'.obs;
  Rx<TextEditingController> txtSearchedPhoneNumber = TextEditingController().obs;
  RxBool isPhoneNumberEnable = false.obs;


  Widget textField({
    required double width,
    required double height,
    required String hintText,
    TextStyle? hintStyle,
    List<TextInputFormatter>? inputFormatters,
    required EdgeInsets padding,
    required TextInputType keyboardType,
    required TextEditingController controller,
    Function(String str)? onChanged
  }) {
    return Container(
      // color: Colors.blue,
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        expands: true,
        style: hintStyle,
        decoration: InputDecoration(
          contentPadding: padding,
          hintText: hintText,
          hintStyle: hintStyle,
          fillColor: const Color.fromRGBO(237, 235, 235, 1),
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        inputFormatters: inputFormatters,
        cursorColor: ConstantsColor.themeColor,
        minLines: null,
        maxLines: null,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
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
