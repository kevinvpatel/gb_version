import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MyDownloadScreenController extends GetxController {
  //TODO: Implement VIDEOMyDownloadScreenController


  Widget downloadedStories() {
    return FutureBuilder<List<FileSystemEntity>?>(
      future: getDownloadFiles(),
      builder: (context , AsyncSnapshot<List<FileSystemEntity>?> snapshot) {
        if(snapshot.hasData) {
          List<FileSystemEntity> listFiles = snapshot.data!;
          return ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              itemCount: listFiles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if(listFiles[index].path.endsWith('.mp4')) {
                      OpenFile.open(listFiles[index].path, type: "video/mp4");
                    } else {
                      OpenFile.open(listFiles[index].path, type: "image/jpeg");
                    }
                  },
                  child: Container(
                    height: 32.sp,
                    width: 100.sp,
                    margin: EdgeInsets.only(bottom: 15.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.sp),
                        boxShadow: const [BoxShadow(offset: Offset(0,1), color: Colors.black26, blurRadius: 3)]
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 9.sp),
                        imageView(filePath: listFiles[index].path),
                        SizedBox(width: 15.sp),
                        SizedBox(
                            width: 67.sp,
                            child: Text(listFiles[index].path.split('/').last, maxLines: 2, overflow: TextOverflow.ellipsis)
                        )

                      ],
                    ),
                  ),
                );
              }
          );
        } else {
          return noDataFound();
        }
      }
    );
  }


  Widget imageView({required String filePath}) {
    double imageSize = 29.sp;
    if(filePath.endsWith('.jpg')) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(12.sp),
          child: Image.file(File(filePath), height: imageSize, width: imageSize, fit: BoxFit.cover)
      );
    } else {
      return FutureBuilder<Uint8List>(
          future: videoThumbnails(path: filePath),
          builder: (BuildContext context,AsyncSnapshot<Uint8List> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {
              return const Center(child: CupertinoActivityIndicator());
            } else {
              return Container(
                  height: imageSize,
                  width: imageSize,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.sp),
                      boxShadow: const [BoxShadow(offset: Offset(0,1), color: Colors.black26, blurRadius: 4)]
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(14.sp),
                          child: Image.memory(snapshot.data!, fit: BoxFit.cover, width: imageSize, height: imageSize)
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
                  )
              );
            }
          }
      );
    }
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


  Future<List<FileSystemEntity>> getDownloadFiles() async {
    String directoryPath = "/storage/emulated/0/Download/";

    bool dirDownloadExists = await Directory(directoryPath).exists();
    if(dirDownloadExists){
      directoryPath = "/storage/emulated/0/Download/GB Version/";
    }else{
      directoryPath = "/storage/emulated/0/Downloads/GB Version/";
    }
    List<FileSystemEntity> files = Directory(directoryPath).listSync();
    print('filesss -> ${files}');
    return files;
  }


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
