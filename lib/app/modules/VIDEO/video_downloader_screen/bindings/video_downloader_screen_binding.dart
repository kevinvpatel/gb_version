import 'package:get/get.dart';

import '../controllers/video_downloader_screen_controller.dart';

class VideoDownloaderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoDownloaderScreenController>(
      () => VideoDownloaderScreenController(),
    );
  }
}
