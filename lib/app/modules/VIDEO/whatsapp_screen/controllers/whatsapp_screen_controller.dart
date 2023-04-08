import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/VIDEO/whatsapp_screen/views/open_story_screen.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:saf/saf.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class WhatsappScreenController extends GetxController {
  //TODO: Implement VIDEOWhatsappScreenController

  late VideoPlayerController videoPlayerController;

  ///Sync Button View
  Widget permissionView() {
    final width = 100.w;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Obx(() => Text('Click on this button, \n \n choose path: /storage/emulated/0/Android/media/com.whatsapp/${isWhatsappBussiness.value == true ? 'Whatsapp Bussiness' : 'Whatsapp'}/Media/.Statuses  '
              '\n \n  & Sync your story \n ${isWhatsappBussiness.value == true ? 'Whatsapp Bussiness story' : 'Whatsapp story'}',
            style: TextStyle(fontSize: 16.sp, color: ConstantsColor.themeColor),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 20.sp),
          ConstantWidgets.button(
              onPressed: () async {
                await Saf.releasePersistedPermissions();
                await Permission.storage.request();
                await saf.getDirectoryPermission(isDynamic: true);
                await saf.cache().then((value) => getStories(paths: value));
              },
              child: Text('Sync New Story', style: TextStyle(fontSize: 16.6.sp, fontWeight: FontWeight.w600)),
              width: width * 0.52,
              height: 27.sp
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  RxList stories = [].obs;
  RxList bussinessStories = [].obs;
  RxBool isSyncStories = false.obs;
  RxBool isSyncWhatsappStories = false.obs;
  RxBool isWhatsappBussiness = false.obs;

  Saf saf = Saf(Directory('/storage/emulated/0/Download/media/com.whatsapp/WhatsApp/Media/.Statuses').path);

  ///Get Story data
  Future getStories({dynamic paths}) async {
    try{

      if(isWhatsappBussiness.value == false) {
        isSyncStories.value = true;
        for (String path in paths) {
          if (path.endsWith(".jpg") || path.endsWith(".mp4")) {
            stories.value.add(path);
          }
        }
        stories.value.removeWhere((story) => !story.split('/').last.endsWith('.jpg') && !story.split('/').last.endsWith('.mp4'));
      } else {
        isSyncWhatsappStories.value = true;
        for (String path in paths) {
          if (path.endsWith(".jpg") || path.endsWith(".mp4")) {
            bussinessStories.value.add(path);
          }
        }
        bussinessStories.value.removeWhere((story) => !story.split('/').last.endsWith('.jpg') && !story.split('/').last.endsWith('.mp4'));
      }
    } catch(err) {
      print('err getStories -> ${err}');
    }
    update();
  }



  ///Story Grid
  Widget storiesGrid({required List data}) {
    double spacing = 15.sp;
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: spacing, right: spacing, bottom: spacing),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: spacing, mainAxisSpacing: spacing, childAspectRatio: 1),
      itemCount: data.length,
      itemBuilder: (context, index) {
        File image = File(data[index]);

        if(image.path.split('/').last.split('.').last == 'jpg') {
          return InkWell(
            onTap: () {
              Get.to(const OpenStoryScreenView(), arguments: image.path);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.sp),
                    boxShadow: const [BoxShadow(offset: Offset(0,1), color: Colors.black26, blurRadius: 4)]
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.sp),
                    child: Image.file(File(image.path), fit: BoxFit.cover)
                )
            ),
          );
        } else if(image.path.split('/').last.split('.').last == 'mp4') {

          return InkWell(
            onTap: () {
              Get.to(const OpenStoryScreenView(), arguments: image.path);
            },
            child: Stack(
              children: [
                Container(
                  height: 40.sp,
                  color: Colors.white,
                  width: 100.w,
                  child: FutureBuilder<Uint8List>(
                      future: videoThumbnails(path: image.path),
                      builder: (BuildContext context,AsyncSnapshot<Uint8List> snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {
                          return const Center(child: CupertinoActivityIndicator());
                        } else {
                          return Container(
                              height: 45.sp,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.sp),
                                  boxShadow: const [BoxShadow(offset: Offset(0,1), color: Colors.black26, blurRadius: 4)]
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  child: Image.memory(snapshot.data!, fit: BoxFit.cover)
                              )
                          );
                        }
                      }
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(20.sp),
                      boxShadow: const [BoxShadow(offset: Offset(0,1), color: Colors.black26, blurRadius: 4)]
                  ),
                ),
                Center(
                  child: Container(
                    height: 23.sp,
                    width: 23.sp,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.only(left: 6.sp),
                    child: Icon(CupertinoIcons.play_arrow_solid, size: 16.sp, color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }


  ///Video Thumbnail
  Future<Uint8List> videoThumbnails({required String path}) async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
    return uint8list!;
  }


  ///No Data Found
  Widget noDataFound() {
    return Center(
      child: Image.asset(ConstantsImage.screen8_logo, width: 40.w),
    );
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    isSyncStories.value = false;
    isSyncWhatsappStories.value = false;
    stories.value.clear();
    print('stories.value != [] - > ${stories.value != []}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
