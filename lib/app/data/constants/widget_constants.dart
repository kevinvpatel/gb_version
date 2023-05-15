import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

abstract class ConstantWidgets {

  static Widget button({
    Function()? onPressed,
    required Widget child,
    required double width,
    double? height,
    Gradient? gradient,
    EdgeInsets? contentPadding,
  }) {
    return Container(
      width: width,
      height: height ?? 30.sp,
      decoration: BoxDecoration(
        gradient: gradient ?? ConstantsColor.topToDownGradient,
        borderRadius: BorderRadius.circular(35.sp),
        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4)]
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: contentPadding,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.sp)),
        ),
        child: child,
      ),
    );
  }


  static Widget backgroundTemplate({
    Widget? leftWidget,
    Widget? rightWidget,
    required String title,
    Widget? titleWidget,
    required double height,
    required double width,
    required Widget child
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
            height: 52.sp,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.sp), bottomRight: Radius.circular(25.sp)),
                gradient: ConstantsColor.topToDownGradient
            ),
            alignment: const AlignmentDirectional(0, -0.38),
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leftWidget ?? SizedBox(width: 26.sp, height: 26.sp),
                titleWidget ?? Text(title, style: TextStyle(fontSize: 19.5.sp, color: Colors.white, fontWeight: FontWeight.w600),),
                rightWidget ?? SizedBox(width: width * 0.1)
              ],
            ),
          ),

          Align(
            alignment: const AlignmentDirectional(0, 0.9),
            child: Container(
              // height: height * 0.83,
              width: width * 0.9,
              margin: EdgeInsets.only(bottom: 12.sp, top: 40.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.sp),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4)
                  ]
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }

}