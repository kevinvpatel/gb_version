import 'package:get/get.dart';
import 'package:shake/shake.dart';
import 'package:external_app_launcher/external_app_launcher.dart' as appLauncher;

class WhatsappShakeScreenController extends GetxController {
  //TODO: Implement GBWhatsappShakeScreenController

  RxBool isShake = false.obs;
  late ShakeDetector detector;


  @override
  void onInit() {
    super.onInit();
    detector = ShakeDetector.waitForStart(
        onPhoneShake: () async {
          // Do stuff on phone shake
          await appLauncher.LaunchApp.openApp(
            androidPackageName: 'com.whatsapp'
          );
        }
    );
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
