import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:get/get.dart';

class FacebookScreenController extends GetxController {
  //TODO: Implement VIDEOFacebookScreenController

  List lstFacebookInfo = [ConstantsImage.facebook_info_image1, ConstantsImage.facebook_info_image2, ConstantsImage.facebook_info_image3, ConstantsImage.facebook_info_image4];
  List lstInstagramInfo = [ConstantsImage.instagram_info_image1, ConstantsImage.facebook_info_image2, ConstantsImage.facebook_info_image3, ConstantsImage.instagram_info_image2];
  PageController pageController = PageController();

  Rx<TextEditingController> txtFacebookLink = TextEditingController().obs;
  Rx<TextEditingController> txtInstagramLink = TextEditingController().obs;

  RxString downloadLink = ''.obs;

  Future<dynamic> startDownload(String link) async {
    // // Getting Permission
    // await Permission.storage.request();

    // geting Video Link
    var linkEdit = link.replaceAll(" ", "").split("/");
    var downloadURL = await Dio().get(
        '${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
            "/?__a=1");
    downloadLink.value = downloadURL.data.toString();
    var data = downloadURL.data;
    print('videoUrl 1-> ${downloadURL.extra}');
    print('videoUrl 2-> ${downloadURL.headers}');
    log('videoUrl -> ${data}');
    var graphql = data['graphql'];
    var shortcodeMedia = graphql['shortcode_media'];
    var videoUrl = shortcodeMedia['contentUrl'];
    print('contentUrl -> ${videoUrl}');

    // // Downloading Video
    //
    // var appDocDir = await getTemporaryDirectory();
    // String savePath = appDocDir.path + "/temp.mp4";
    // await Dio().download(videoUrl, savePath);
    // final result = await ImageGallerySaver.saveFile(savePath);
    // print(result);
    return data;
  }


  final count = 0.obs;
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

  void increment() => count.value++;
}
