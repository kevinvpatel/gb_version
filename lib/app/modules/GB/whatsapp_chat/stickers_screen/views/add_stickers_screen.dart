import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/stickers_screen/controllers/stickers_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/stickers_screen/views/stickers_screen_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddStickersScreenView extends GetView<StickersScreenController> {
  const AddStickersScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    StickersScreenController controller = Get.put(StickersScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    int index = Get.arguments;
    String trayImage = controller.listStickerDetails.value[index]['tray_image_file'];
    String title = controller.listStickerDetails.value[index]['name'];
    String publisher = controller.listStickerDetails.value[index]['publisher'];
    String size = controller.listStickerDetails.value[index]['size'];
    List listImages = controller.listStickerDetails.value[index]['stickers'];

    return WillPopScope(
      onWillPop: () {
        // Get.off(StickersScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: title,
          leftWidget: InkWell(
              onTap: () {
                Get.back();
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.only(top: 20.sp, left: 18.sp, right: 18.sp, bottom: 18.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Title and Image
                SizedBox(
                  height: 26.sp,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.sp),
                        child: Image.asset(trayImage),
                      ),
                      SizedBox(width: 12.sp),
                      Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
                ///Size and Publisher
                Row(
                  children: [
                    SizedBox(
                      height: 28.sp,
                      width: 29.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(publisher, style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade800, fontWeight: FontWeight.w500),),
                        Text(size, style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade800, fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 20.sp, left: 10.sp, right: 10.sp),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 18.sp,
                          mainAxisSpacing: 15.sp
                      ),
                      itemCount: listImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.asset(listImages[index]['image_path']),
                        );
                      }
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.installStickersToWhatsapp(index: index);
                  },
                  child: Container(
                    width: width,
                    height: 34.sp,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(width: 1, color: Colors.grey.shade400)
                      ),
                      padding: EdgeInsets.all(7.5.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            colors: [Colors.white, Color.fromRGBO(137, 241, 74, 1), Color.fromRGBO(39, 156, 15, 1)],
                          ),
                          borderRadius: BorderRadius.circular(100.sp)
                        ),
                        padding: EdgeInsets.all(12.sp),
                        child: Image.asset(ConstantsImage.sticker_download_icon)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}