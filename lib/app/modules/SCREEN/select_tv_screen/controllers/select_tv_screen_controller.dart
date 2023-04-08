import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/SCREEN/select_tv_screen/views/screen_cast_start_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spring/spring.dart';

class SelectTvScreenController extends GetxController {
  //TODO: Implement SCREENSelectTvScreenController

  List<String> lstYear = ['1991 - 1995', '1996 - 2000', '2001 - 2005', '2006 - 2010', '2011 - 2015', '2016 - 2020', '2021 - 2025'];

  RxList<SpringController> springController = List.generate(4, (index) => SpringController()).obs;


  Widget progressLine({required String title, required int index}) {
    return GetBuilder(
        init: SelectTvScreenController(),
        builder: (ctrl) {
          print('1isComplete -> ${isComplete.value[index]}, title -> $title');
          return Row(
            children: [
              Spring.flip(
                springController: springController.value[index],
                frontWidget: Icon(CupertinoIcons.circle, color: Colors.grey.shade600),
                rearWidget: const Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green),
                animDuration: const Duration(milliseconds: 200),
                flipAxis: Axis.horizontal,
                toggleOnClick: false
              ),
              SizedBox(width: 15.sp),
              Text(title, style: TextStyle(color: isComplete.value[index] == true ? Colors.green : Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),)
            ],
          );
        }
    );
  }


  progressHeading({required int index}) {
    return GetBuilder(
      init: SelectTvScreenController(),
      builder: (ctrl) {
        return isComplete.value[index] == true
            ? Column(
          children: [
            Container(
              width: 45.sp,
              height: 15.sp,
            ),
            SizedBox(height: 15.sp),
            Text('Progress Complete', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),),
            Container(
              width: 45.sp,
              height: 15.sp,
            ),
          ],
        )
            : Column(
          children: [
            Container(
              color: Colors.blue,
              width: 45.sp,
              height: 50.sp,
            ),
            SizedBox(height: 15.sp),
            Text('Progress Running..', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),),
            SizedBox(height: 15.sp),
            Text('Please Wait...', style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500, fontSize: 15.sp),)
          ],
        );
      }
    );
  }

  nextButton({required int index, required AdService adService}) {
    double width = 100.w;
    return GetBuilder(
        init: SelectTvScreenController(),
        builder: (ctrl) {
          return isComplete.value[index] == true
              ? ConstantWidgets.button(
                  onPressed: () async {
                    Get.to(ScreenCastStartScreenView());
                    adService.checkCounterAd();
                  },
                  child: Text('Next', style: TextStyle(fontSize: 17.2.sp, fontWeight: FontWeight.w600)),
                  width: width * 0.26,
                  height: 26.sp
              )
              : SizedBox.shrink();
        }
    );
  }


  RxList<bool> isComplete = [false, false, false, false].obs;

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
