import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/stickers_screen/views/add_stickers_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/stickers_screen_controller.dart';


class StickersScreenView extends GetView<StickersScreenController> {
  const StickersScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        // Get.off(WhatsappChatScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'Stickers',
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 18.sp),
            alignment: Alignment.center,
            child: GetBuilder<StickersScreenController>(
              init: StickersScreenController(),
              builder: (controller) {

                if(controller.listStickerDetails.value.isNotEmpty) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: controller.listStickerDetails.value.length,
                      separatorBuilder: (context, index) => Divider(indent: 10.sp, endIndent: 10.sp),
                      itemBuilder: (context, index) {
                        double heightImage = 28.sp;
                        int stickerLength = controller.listStickerDetails.value[index]['stickers'].length;

                        return Container(
                          height: 36.sp,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Title
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15.sp),
                                    width: width * 0.35,
                                    child: Text(
                                      controller.listStickerDetails.value[index]['name'],
                                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.sp),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.3,
                                          child: Text(
                                            controller.listStickerDetails.value[index]['publisher'],
                                            style: TextStyle(fontSize: 12.5.sp, color: Colors.grey.shade400, fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Text(
                                          ' \u2022 ' + controller.listStickerDetails.value[index]['size'],
                                          style: TextStyle(fontSize: 12.5.sp, color: Colors.grey.shade400, fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.sp),
                              ///Images
                              Row(
                                children: [
                                  SizedBox(width: 16.sp),
                                  Container(
                                    height: heightImage,
                                    width: width * 0.68,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: stickerLength,
                                      itemBuilder: (context, imageIndex) {
                                        return Container(
                                          width: heightImage,
                                          margin: EdgeInsets.only(right: 12.sp),
                                          child: Image.asset(controller.listStickerDetails.value[index]['stickers'][imageIndex]['image_path']),
                                        );
                                      }
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: heightImage,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.to(AddStickersScreenView(), arguments: index);
                                          adService.checkCounterAd();
                                        },
                                        icon: Icon(CupertinoIcons.add, color: Colors.teal.shade300),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ),
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
