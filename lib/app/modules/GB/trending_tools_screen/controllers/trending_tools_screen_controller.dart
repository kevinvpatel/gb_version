import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendingToolsScreenController extends GetxController {
  //TODO: Implement GBTrendingToolsScreenController

  Widget thinTile({
    required double tileWidth,
    required double tileHeight,
    required double backSpace,
    required String imagePath,
    required double imagePadding,
    required String title,
    required Function() onTap,
    Widget? endWidget
  }) {

    // double tileHeight = 29.sp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: tileHeight,
            width: tileWidth,
            decoration: BoxDecoration(
                gradient: ConstantsColor.leftToRightGradient,
                borderRadius: BorderRadius.circular(100.sp),
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
                    margin: EdgeInsets.all(7.sp),
                    padding: EdgeInsets.all(imagePadding),
                    decoration: BoxDecoration(
                      gradient: const RadialGradient(
                          radius: 0.7,
                          colors: [Color.fromRGBO(137, 241, 74, 1), Color.fromRGBO(39, 156, 15, 1)]
                      ),
                      borderRadius: BorderRadius.circular(100.sp),
                    ),
                    child: Image.asset(imagePath),
                  ),
                ),
                Spacer(),
                Text(title, style: TextStyle(color: Colors.white, fontSize: 16.7.sp, fontWeight: FontWeight.w500),),
                endWidget != null ? Spacer() : SizedBox.shrink(),
                endWidget ?? Spacer(flex: 2),
                endWidget != null ? SizedBox(width: 12.sp) : SizedBox.shrink(),
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
