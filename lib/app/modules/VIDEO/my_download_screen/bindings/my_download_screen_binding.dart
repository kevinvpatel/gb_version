import 'package:get/get.dart';
import '../controllers/my_download_screen_controller.dart';


class MyDownloadScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDownloadScreenController>(
      () => MyDownloadScreenController(),
    );
  }
}
