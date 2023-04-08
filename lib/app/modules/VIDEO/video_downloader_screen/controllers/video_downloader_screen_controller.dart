import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoDownloaderScreenController extends GetxController {
  //TODO: Implement VIDEOVideoDownloaderScreenController

  Widget thickTile({
    required double width,
    required double tileHeight,
    required double backSpace,
    required String imagePath,
    required double imagePadding,
    required String title,
    required Gradient titleGradient,
    required Gradient imageGradient,
    required Function() onTap
  }) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: tileHeight,
            width: width * 0.51,
            decoration: BoxDecoration(
                gradient: titleGradient,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.sp),
                  bottomRight: Radius.circular(50.sp),
                  topLeft: Radius.circular(100.sp),
                  bottomLeft: Radius.circular(100.sp),
                ),
                boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 1), blurRadius: 5)]
            ),
            child: Row(
              children: [
                Container(
                  height: tileHeight,
                  width: tileHeight,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.sp),
                      boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(1, 1), blurRadius: 5)]
                  ),
                  child: Container(
                    margin: EdgeInsets.all(9.sp),
                    padding: EdgeInsets.all(imagePadding),
                    decoration: BoxDecoration(
                      gradient: imageGradient,
                      borderRadius: BorderRadius.circular(100.sp),
                    ),
                    child: Image.asset(imagePath),
                  ),
                ),
                Spacer(),
                Text(title, style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),),
                Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(width: backSpace)
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

}
