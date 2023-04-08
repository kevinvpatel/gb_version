import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/other_tools/fake_story_screen/controllers/fake_story_screen_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoryViewScreenView extends GetView<FakeStoryScreenController> {
  const StoryViewScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FakeStoryScreenController controller = Get.put(FakeStoryScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          height: height,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: [
              controller.imageBackground != null
                  ? Container(
                      height: height,
                      width: width,
                      child: Image.file(controller.imageBackground!, fit: BoxFit.fitWidth)
                  )
                  : Container(color: Colors.black87),
              Column(
                children: [
                  SizedBox(height: 23.sp),
                  SizedBox(
                    height: 6.sp,
                    child: const LinearProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.white24,
                      value: 0.3,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white, size: 21.sp),
                        onPressed: (){},
                      ),
                      SizedBox(width: 5.sp),
                      CircleAvatar(
                        radius: 17.5.sp,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 17.sp,
                          backgroundColor: Colors.grey.shade400,
                          child: controller.imageProfile != null
                              ? ClipOval(child: Image.file(controller.imageProfile!, fit: BoxFit.cover))
                              : Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(ConstantsImage.generate_profile_icon),
                              ),
                        ),
                      ),
                      SizedBox(width: 12.sp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.txtName.text, style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text(controller.txtLastSeen.text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.white),)
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white, size: 18.sp),
                        onPressed: (){},
                      ),
                    ],
                  ),
                  Spacer(),
                  controller.txtCaption.text.isNotEmpty ? Container(
                    color: Colors.black54,
                    width: width,
                    alignment: Alignment.center,
                    child: Text(controller.txtCaption.text, style: TextStyle(fontSize: 17.sp, color: Colors.white),),
                  ) : const SizedBox.shrink(),
                  SizedBox(height: 45.sp),
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          // color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white, size: 18.sp),
              Text('Reply', style: TextStyle(color: Colors.white, height: 0, fontSize: 16.sp),)
            ],
          ),
        ),
      ),
    );
  }
}