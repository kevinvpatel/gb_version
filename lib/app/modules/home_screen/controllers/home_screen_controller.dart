import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gb_version_flutter/main.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController


  Widget listTile({
    required double width,
    required bool isLeft,
    required String title,
    required String subtitle,
    required String description,
    required String imagePath,
    required List<Color> gradientColors,
    required List<Color> gradientColorsCircle,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 17.sp, bottom: 17.sp, right: isLeft ? 38.sp : 0.sp, left: !isLeft ? 38.sp : 0.sp),
        height: 46.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: isLeft ? Radius.circular(100.sp) : Radius.circular(45.sp),
              bottomRight: isLeft ? Radius.circular(100.sp) : Radius.circular(45.sp),
              topLeft: isLeft ? Radius.circular(45.sp) : Radius.circular(100.sp),
              bottomLeft: isLeft ? Radius.circular(45.sp) : Radius.circular(100.sp),
            ),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // colors: isLeft ? [Color.fromRGBO(192, 92, 1, 1), Color.fromRGBO(255, 233, 211, 1)] : [Color.fromRGBO(255, 233, 211, 1), Color.fromRGBO(192, 92, 1, 1)]
                colors: gradientColors
            )
        ),
        child: isLeft ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.345,
              padding: EdgeInsets.only(left: 18.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600), maxLines: 2),
                  SizedBox(height: 7.sp),
                  Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w500), maxLines: 2),
                  SizedBox(height: 5.sp),
                  Text(description, style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600), maxLines: 4, overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
            Container(
              height: 46.sp,
              width: 46.sp,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: gradientColorsCircle
                ),
                boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(-1, 0), blurRadius: 4)],
                borderRadius: BorderRadius.circular(100.sp),
              ),
              padding: EdgeInsets.all(10.sp),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.sp),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            )
          ],
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 46.sp,
              width: 46.sp,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: gradientColorsCircle
                ),
                boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, -1), blurRadius: 4)],
                borderRadius: BorderRadius.circular(100.sp),
              ),
              padding: EdgeInsets.all(10.sp),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.sp),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Container(
              width: width * 0.345,
              padding: EdgeInsets.only(right: 18.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600), maxLines: 2),
                  SizedBox(height: 7.sp),
                  Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w500), maxLines: 2),
                  SizedBox(height: 5.sp),
                  Text(description, style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600), maxLines: 4, overflow: TextOverflow.ellipsis)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  final popupCounter = 0.obs;


  @override
  void onInit() {
    super.onInit();

    ///Check Internet Connection for whole app
    StreamSubscription<InternetConnectionStatus> listener =
    InternetConnectionChecker().onStatusChange.listen(
          (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            if(configData.value != {}) {
              ///popupCounter used to close connection checker dialoge
              if(popupCounter.value == 1) {
                Navigator.pop(Get.overlayContext!);
              }
              // ///For skip to show splash screen everytime
              // if(Get.currentRoute == '/splash-screen') {
              //   Future.delayed(Duration(seconds: 3), () {Get.off(HomeView());});
              // }
            } else {
              initConfig().whenComplete(() {
                configData.value = json.decode(remoteConfig.getString('Ad'));
                // initAppOpenAd();
              });
            }
            break;
          case InternetConnectionStatus.disconnected:

            popupCounter.value = 1;
            print('InternetConnectionStatus.disconnected -> ${InternetConnectionStatus.disconnected}');
            showDialog(
                context: Get.overlayContext!,
                builder: (context) {
                  return WillPopScope(child: AlertDialog(
                    content: Row(
                      children: const [
                        // CircularProgressIndicator(),
                        Spacer(),
                        Text('Please turn on internet..'),
                        Spacer(),
                      ],
                    ),
                  ), onWillPop: () => Future.value(false),);
                }
            );
            break;
        }
      },
    );

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
