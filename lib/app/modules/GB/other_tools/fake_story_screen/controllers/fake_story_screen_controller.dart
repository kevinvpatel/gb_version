import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FakeStoryScreenController extends GetxController {
  //TODO: Implement GBOtherToolsFakeStoryScreenController

  final count = 0.obs;

  File? imageProfile;
  File? imageBackground;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtLastSeen = TextEditingController();
  TextEditingController txtCaption = TextEditingController();


  Widget textField({required double width, required String title, required TextEditingController textEditingController}) {
    return Row(
      children: [
        SizedBox(width: 18.sp),
        Text('$title :', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w500),),
        Spacer(),
        SizedBox(
          height: 26.sp,
          width: width * 0.55,
          child: TextField(
            controller: textEditingController,
            cursorColor: ConstantsColor.themeColor,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.sp),
                hintText: 'Enter $title',
                fillColor: const Color.fromRGBO(234, 234, 234, 1),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide.none
                )
            ),
          ),
        ),
        SizedBox(width: 18.sp),
      ],
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

  void increment() => count.value++;
}
