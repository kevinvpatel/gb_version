import 'package:get/get.dart';
import '../controllers/search_profile_screen_controller.dart';

class SearchProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProfileScreenController>(
      () => SearchProfileScreenController(),
    );
  }
}
