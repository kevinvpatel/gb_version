import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/other_tools/fake_story_screen/views/story_view_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/fake_story_screen_controller.dart';


class FakeStoryScreenView extends GetView<FakeStoryScreenController> {
  const FakeStoryScreenView({Key? key}) : super(key: key);
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
        resizeToAvoidBottomInset: false,
        body: ConstantWidgets.backgroundTemplate(
            height: height,
            width: width,
            title: 'Fake Story',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  SizedBox(height: 20.sp),
                  Text('Generate Fake Story of Any Contact', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),),
                  SizedBox(height: 20.sp),
                  GetBuilder(
                    init: FakeStoryScreenController(),
                    builder: (ctrl) {
                      return CircleAvatar(
                        radius: 25.sp,
                        backgroundColor: Colors.grey.shade300,
                        child: Padding(
                          padding: EdgeInsets.all(ctrl.imageProfile != null ? 0 : 16.sp),
                          child: ctrl.imageProfile != null ? ClipOval(child: Image.file(ctrl.imageProfile!, fit: BoxFit.cover)) : Image.asset(ConstantsImage.generate_profile_icon),
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 20.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 26.5.sp, width: width * 0.10),
                      ConstantWidgets.button(
                          onPressed: () async {
                            await ImagePicker().pickImage(source: ImageSource.gallery).then((pickedImage) {
                              if(pickedImage == null) return;

                              final imageTemp = File(pickedImage.path);
                              controller.imageProfile = imageTemp;
                              controller.update();
                            });
                          },
                          child: Text('Select Profile', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w600)),
                          width: width * 0.35,
                          // height: 26.5.sp
                          height: height * 0.05
                      ),
                      ConstantWidgets.button(
                          onPressed: () {
                            Get.to(StoryViewScreenView());
                            adService.checkCounterAd();
                          },
                          child: Icon(Icons.play_circle_outline_outlined, color: Colors.white, size: 22.sp),
                          width: width * 0.10,
                          contentPadding: EdgeInsets.zero,
                          height: 26.5.sp
                      ),
                    ],
                  ),
                  SizedBox(height: 20.sp),
                  Container(
                    height: height * 0.22,
                    child: Column(
                      children: [
                        controller.textField(width: width, title: 'Name', textEditingController: controller.txtName),
                        SizedBox(height: 18.sp),
                        controller.textField(width: width, title: 'Last Seen', textEditingController: controller.txtLastSeen),
                        SizedBox(height: 18.sp),
                        controller.textField(width: width, title: 'Caption', textEditingController: controller.txtCaption),
                      ],
                    )
                  ),
                  // SizedBox(height: 15.sp),
                  Spacer(),
                  GetBuilder(
                    init: FakeStoryScreenController(),
                    builder: (ctrl) {
                      return InkWell(
                        onTap: () async {
                          await ImagePicker().pickImage(source: ImageSource.gallery).then((pickedImage) {
                            if(pickedImage == null) return;

                            final imageTemp = File(pickedImage.path);
                            ctrl.imageBackground = imageTemp;
                            ctrl.update();
                          });
                        },
                        child: Container(
                          height: height * 0.23,
                          margin: EdgeInsets.only(bottom: 18.sp, left: 18.sp, right: 18.sp),
                          padding: ctrl.imageBackground != null ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 25.sp, horizontal: 17.sp),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(245, 255, 232, 1),
                              borderRadius: BorderRadius.circular(16.sp),
                              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                          ),
                          width: width,
                          alignment: Alignment.center,
                          child: ctrl.imageBackground != null ? Image.file(ctrl.imageBackground!, fit: BoxFit.fitHeight) : Image.asset(ConstantsImage.image_icon),
                        ),
                      );
                    }
                  ),
                  Spacer(),
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
