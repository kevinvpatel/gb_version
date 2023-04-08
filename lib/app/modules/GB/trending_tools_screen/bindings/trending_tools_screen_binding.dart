import 'package:get/get.dart';

import '../controllers/trending_tools_screen_controller.dart';

class TrendingToolsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingToolsScreenController>(
      () => TrendingToolsScreenController(),
    );
  }
}
