import 'package:get/get.dart';
import '../controllers/fake_story_screen_controller.dart';

class FakeStoryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FakeStoryScreenController>(
      () => FakeStoryScreenController(),
    );
  }
}
