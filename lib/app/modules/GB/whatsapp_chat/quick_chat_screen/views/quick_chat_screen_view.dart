import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/chatting_tools_screen/views/chatting_tools_screen_view.dart';
import 'package:gb_version_flutter/app/modules/GB/trending_tools_screen/controllers/trending_tools_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/quick_chat_screen/views/add_quick_chat_screen.dart';
import 'package:gb_version_flutter/app/modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/quick_chat_screen_controller.dart';

class QuickChatScreenView extends GetView<QuickChatScreenController> {
  const QuickChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TrendingToolsScreenController trendingToolsScreenController = Get.put(TrendingToolsScreenController());
    QuickChatScreenController controller = Get.put(QuickChatScreenController());
    double height = 100.h;
    double width = 100.w;
    AdService adService = AdService();

    return WillPopScope(
      onWillPop: () {
        Get.off(WhatsappChatScreenView());
        adService.checkBackCounterAd();
        return Future.value(true);
      },
      child: Scaffold(
        body: ConstantWidgets.backgroundTemplate(
          height: height,
          width: width,
          title: 'Quick Chat',
          leftWidget: InkWell(
              onTap: () {
                Get.off(WhatsappChatScreenView());
                adService.checkBackCounterAd();
              },
              child: Image.asset(ConstantsImage.back_icon, height: 26.sp)
          ),
          child: Container(
            margin: EdgeInsets.only(top: 22.sp, left: 16.sp, right: 16.sp),
            child: Column(
              children: [
                Text('Quick Reply Allow You to Send WhatsApp Message Quickly to the Phone Contact',
                  style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                SizedBox(height: 25.sp),
                trendingToolsScreenController.thinTile(
                    tileHeight: 31.sp,
                    tileWidth: width * 0.65,
                    backSpace: width * 0.1,
                    imagePath: ConstantsImage.add_more_icon,
                    imagePadding: 13.sp,
                    title: 'Add More Quick Reply',
                    onTap: () {
                      Get.to(const AddQuickChatScreenView());
                      adService.checkCounterAd();
                    }
                ),
                Expanded(
                  child: GetBuilder<QuickChatScreenController>(
                    init: QuickChatScreenController(),
                    builder: (controller) => FutureBuilder(
                      future: controller.hiveInit(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {
                          return const Center(
                            child: CircularProgressIndicator(color: ConstantsColor.themeColor),
                          );
                        } else if(snapshot.connectionState == ConnectionState.done) {
                          if(snapshot.hasData && snapshot.data!.length > 0) {
                            print('snapshot -> ${snapshot.data}');
                            List lstReply = snapshot.data!;
                            return Column(
                              children: [
                                SizedBox(height: 15.sp),
                                Expanded(
                                  child:  ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: lstReply.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 20.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                                          padding: EdgeInsets.only(bottom: 5.sp, top: 15.sp, left: 17.sp, right: 17.sp),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(245, 255, 232, 1),
                                              borderRadius: BorderRadius.circular(16.sp),
                                              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 3)]
                                          ),
                                          width: width,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(lstReply[index].toString()),
                                              SizedBox(height: 12.sp),
                                              Divider(height: 5.sp, color: Colors.grey.shade600, thickness: 0.8),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      icon: Image.asset(ConstantsImage.edit_icon, height: 19.sp),
                                                      onPressed: () {
                                                        controller.txtEditController.text = lstReply[index].toString();
                                                        controller.hiveEdit(index: index, width: width, adService: adService);
                                                        adService.checkCounterAd();
                                                      }
                                                  ),
                                                  SizedBox(width: 25.sp),
                                                  IconButton(
                                                      icon: Image.asset(ConstantsImage.delete_icon, height: 19.sp),
                                                      onPressed: () {
                                                        controller.hiveDelete(index: index);
                                                        adService.checkCounterAd();
                                                      }
                                                  ),
                                                  SizedBox(width: 25.sp),
                                                  IconButton(
                                                      icon: Image.asset(ConstantsImage.copy_icon, height: 19.sp),
                                                      onPressed: () async {
                                                        await Clipboard.setData(ClipboardData(text: lstReply[index].toString()));
                                                        Fluttertoast.showToast(msg: 'Copied text: ${lstReply[index].toString()}');
                                                        adService.checkCounterAd();
                                                      }
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                ),
                                SizedBox(height: 15.sp),
                                ConstantWidgets.button(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse('https://api.whatsapp.com/send?text= '), mode: LaunchMode.externalApplication);
                                    },
                                    child: Text('Send Message', style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600)),
                                    width: width * 0.7,
                                    height: 28.sp
                                ),
                                SizedBox(height: 25.sp)
                              ],
                            );
                          } else {
                            return Center(
                                child: Container(
                                  child: Text('No Item Yet!'),
                                )
                            );
                          }
                        } else {
                          return Center(
                              child: Container(
                                child: Text('No Item Yet!'),
                              )
                          );
                        }
                      },
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
