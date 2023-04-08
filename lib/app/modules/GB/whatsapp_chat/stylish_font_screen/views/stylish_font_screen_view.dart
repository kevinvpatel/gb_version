import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/data/font_model.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/stylish_font_screen/controllers/alphabet_converter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/stylish_font_screen_controller.dart';


class StylishFontScreenView extends GetView<StylishFontScreenController> {
  const StylishFontScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    StylishFontScreenController controller = Get.put(StylishFontScreenController());
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
            title: 'Stylish Font',
            leftWidget: InkWell(
                onTap: () {
                  Get.back();
                  adService.checkBackCounterAd();
                },
                child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30.sp,
                    width: width * 0.85,
                    child: TextField(
                      // controller: controller.txtStylishText,
                      cursorColor: ConstantsColor.themeColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.sp),
                          hintText: 'Stylish Font',
                          fillColor: const Color.fromRGBO(234, 234, 234, 1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide.none
                          )
                      ),
                      onChanged: (val) {
                        if(val.isEmpty) {
                          controller.txtStylishText.value = 'Stylish Font';
                        } else {
                          controller.txtStylishText.value = val;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Expanded(
                    child: FutureBuilder<List<Fonts>?>(
                      future: controller.loadFontsJson(),
                      builder: (BuildContext context,AsyncSnapshot<List<Fonts>?> snapshot) {
                        if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator(color: ConstantsColor.themeColor));
                        } else if(snapshot.connectionState == ConnectionState.none) {
                          return const Center(child: CircularProgressIndicator(color: ConstantsColor.themeColor));
                        } else {
                          List<Fonts> fonts = snapshot.data!;

                          return ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 9.sp, vertical: 10.sp),
                              physics: BouncingScrollPhysics(),
                              itemCount: fonts.length,
                              itemBuilder: (context, index) {

                                return Container(
                                  height: 30.sp,
                                  width: width * 0.7,
                                  margin: EdgeInsets.only(bottom: 15.sp),
                                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.sp),
                                      boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: width * 0.48,
                                          child: Obx(() => Text(fontIndex(text: controller.txtStylishText.value, characters: fonts[index].characters!),
                                            style: TextStyle(fontSize: 15.sp),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ))
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 22.sp,
                                        width: 22.sp,
                                        margin: EdgeInsets.only(right: 10.sp),
                                        decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.circular(10.sp),
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(Icons.share, color: Colors.white, size: 18.sp),
                                          onPressed: () {
                                            Share.share(fontIndex(text: controller.txtStylishText.value, characters: fonts[index].characters!));
                                          },
                                        ),
                                      ),
                                      Container(
                                          height: 22.sp,
                                          width: 22.sp,
                                          margin: EdgeInsets.only(right: 10.sp),
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius: BorderRadius.circular(10.sp),
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.all(9.sp)
                                            ),
                                            child: Image.asset(ConstantsImage.whatsapp_icon2),
                                            onPressed: () async {
                                              await launchUrl(Uri.parse('https://api.whatsapp.com/send?text=${fontIndex(text: controller.txtStylishText.value, characters: fonts[index].characters!)}'), mode: LaunchMode.externalApplication);
                                            },
                                          )
                                      ),
                                      Container(
                                        height: 22.sp,
                                        width: 22.sp,
                                        decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.circular(10.sp),
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(Icons.copy, color: Colors.white, size: 18.sp),
                                          onPressed: () async {
                                            await Clipboard.setData(ClipboardData(text: fontIndex(text: controller.txtStylishText.value, characters: fonts[index].characters!)));
                                            Fluttertoast.showToast(msg: 'Copied Text: ${fontIndex(text: controller.txtStylishText.value, characters: fonts[index].characters!)}');
                                            adService.checkCounterAd();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )
        ),
        bottomNavigationBar: AdService.bannerAd(width: width),
      ),
    );
  }
}
