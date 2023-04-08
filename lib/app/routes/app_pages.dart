import 'package:get/get.dart';

import '../modules/GB/chatting_tools_screen/bindings/chatting_tools_screen_binding.dart';
import '../modules/GB/chatting_tools_screen/views/chatting_tools_screen_view.dart';
import '../modules/GB/gb_whatsapp_screen/bindings/gb_whatsapp_screen_binding.dart';
import '../modules/GB/gb_whatsapp_screen/views/gb_whatsapp_screen_view.dart';
import '../modules/GB/other_tools/fake_story_screen/bindings/fake_story_screen_binding.dart';
import '../modules/GB/other_tools/fake_story_screen/views/fake_story_screen_view.dart';
import '../modules/GB/other_tools/other_tools_screen/bindings/other_tools_screen_binding.dart';
import '../modules/GB/other_tools/other_tools_screen/views/other_tools_screen_view.dart';
import '../modules/GB/other_tools/whatsapp_info_screen/bindings/whatsapp_info_screen_binding.dart';
import '../modules/GB/other_tools/whatsapp_info_screen/views/whatsapp_info_screen_view.dart';
import '../modules/GB/scanner_tools/qr_generator_screen/bindings/qr_generator_screen_binding.dart';
import '../modules/GB/scanner_tools/qr_generator_screen/views/qr_generator_screen_view.dart';
import '../modules/GB/scanner_tools/qr_scanner_screen/bindings/qr_scanner_screen_binding.dart';
import '../modules/GB/scanner_tools/qr_scanner_screen/views/qr_scanner_screen_view.dart';
import '../modules/GB/scanner_tools/scanner_tools_screen/bindings/scanner_tools_screen_binding.dart';
import '../modules/GB/scanner_tools/scanner_tools_screen/views/scanner_tools_screen_view.dart';
import '../modules/GB/search_profile_screen/bindings/search_profile_screen_binding.dart';
import '../modules/GB/search_profile_screen/views/search_profile_screen_view.dart';
import '../modules/GB/trending_tools_screen/bindings/trending_tools_screen_binding.dart';
import '../modules/GB/trending_tools_screen/views/trending_tools_screen_view.dart';
import '../modules/GB/whatsapp_chat/blank_message_screen/bindings/blank_message_screen_binding.dart';
import '../modules/GB/whatsapp_chat/blank_message_screen/views/blank_message_screen_view.dart';
import '../modules/GB/whatsapp_chat/direct_chat_screen/bindings/direct_chat_screen_binding.dart';
import '../modules/GB/whatsapp_chat/direct_chat_screen/views/direct_chat_screen_view.dart';
import '../modules/GB/whatsapp_chat/emoticons_screen/bindings/emoticons_screen_binding.dart';
import '../modules/GB/whatsapp_chat/emoticons_screen/views/emoticons_screen_view.dart';
import '../modules/GB/whatsapp_chat/quick_chat_screen/bindings/quick_chat_screen_binding.dart';
import '../modules/GB/whatsapp_chat/quick_chat_screen/views/quick_chat_screen_view.dart';
import '../modules/GB/whatsapp_chat/stickers_screen/bindings/stickers_screen_binding.dart';
import '../modules/GB/whatsapp_chat/stickers_screen/views/stickers_screen_view.dart';
import '../modules/GB/whatsapp_chat/stylish_font_screen/bindings/stylish_font_screen_binding.dart';
import '../modules/GB/whatsapp_chat/stylish_font_screen/views/stylish_font_screen_view.dart';
import '../modules/GB/whatsapp_chat/text_repeater_screen/bindings/text_repeater_screen_binding.dart';
import '../modules/GB/whatsapp_chat/text_repeater_screen/views/text_repeater_screen_view.dart';
import '../modules/GB/whatsapp_chat/text_to_emoji_screen/bindings/text_to_emoji_screen_binding.dart';
import '../modules/GB/whatsapp_chat/text_to_emoji_screen/views/text_to_emoji_screen_view.dart';
import '../modules/GB/whatsapp_chat/whatsapp_chat_screen/bindings/whatsapp_chat_screen_binding.dart';
import '../modules/GB/whatsapp_chat/whatsapp_chat_screen/views/whatsapp_chat_screen_view.dart';
import '../modules/GB/whatsapp_shake_screen/bindings/whatsapp_shake_screen_binding.dart';
import '../modules/GB/whatsapp_shake_screen/views/whatsapp_shake_screen_view.dart';
import '../modules/GB/whatsapp_web_screen/bindings/whatsapp_web_screen_binding.dart';
import '../modules/GB/whatsapp_web_screen/views/whatsapp_web_screen_view.dart';
import '../modules/SCREEN/select_tv_screen/bindings/select_tv_screen_binding.dart';
import '../modules/SCREEN/select_tv_screen/views/select_tv_screen_view.dart';
import '../modules/VIDEO/facebook_screen/bindings/facebook_screen_binding.dart';
import '../modules/VIDEO/facebook_screen/views/facebook_screen_view.dart';
import '../modules/VIDEO/my_download_screen/bindings/my_download_screen_binding.dart';
import '../modules/VIDEO/my_download_screen/views/my_download_screen_view.dart';
import '../modules/VIDEO/video_downloader_screen/bindings/video_downloader_screen_binding.dart';
import '../modules/VIDEO/video_downloader_screen/views/video_downloader_screen_view.dart';
import '../modules/VIDEO/whatsapp_screen/bindings/whatsapp_screen_binding.dart';
import '../modules/VIDEO/whatsapp_screen/views/whatsapp_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import '../modules/onboarding_screen/views/onboarding_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.GB_WHATSAPP_SCREEN,
      page: () => const GbWhatsappScreenView(),
      binding: GbWhatsappScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRENDING_TOOLS_SCREEN,
      page: () => const TrendingToolsScreenView(),
      binding: TrendingToolsScreenBinding(),
    ),
    GetPage(
      name: _Paths.WHATSAPP_WEB_SCREEN,
      page: () => const WhatsappWebScreenView(),
      binding: WhatsappWebScreenBinding(),
    ),
    GetPage(
      name: _Paths.WHATSAPP_SHAKE_SCREEN,
      page: () => const WhatsappShakeScreenView(),
      binding: WhatsappShakeScreenBinding(),
    ),
    GetPage(
      name: _Paths.WHATSAPP_CHAT_SCREEN,
      page: () => const WhatsappChatScreenView(),
      binding: WhatsappChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.DIRECT_CHAT_SCREEN,
      page: () => const DirectChatScreenView(),
      binding: DirectChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.QUICK_CHAT_SCREEN,
      page: () => const QuickChatScreenView(),
      binding: QuickChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.STICKERS_SCREEN,
      page: () => const StickersScreenView(),
      binding: StickersScreenBinding(),
    ),
    GetPage(
      name: _Paths.BLANK_MESSAGE_SCREEN,
      page: () => const BlankMessageScreenView(),
      binding: BlankMessageScreenBinding(),
    ),
    GetPage(
      name: _Paths.TEXT_REPEATER_SCREEN,
      page: () => const TextRepeaterScreenView(),
      binding: TextRepeaterScreenBinding(),
    ),
    GetPage(
      name: _Paths.STYLISH_FONT_SCREEN,
      page: () => const StylishFontScreenView(),
      binding: StylishFontScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMOTICONS_SCREEN,
      page: () => const EmoticonsScreenView(),
      binding: EmoticonsScreenBinding(),
    ),
    GetPage(
      name: _Paths.TEXT_TO_EMOJI_SCREEN,
      page: () => const TextToEmojiScreenView(),
      binding: TextToEmojiScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PROFILE_SCREEN,
      page: () => const SearchProfileScreenView(),
      binding: SearchProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHATTING_TOOLS_SCREEN,
      page: () => const ChattingToolsScreenView(),
      binding: ChattingToolsScreenBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER_TOOLS_SCREEN,
      page: () => const ScannerToolsScreenView(),
      binding: ScannerToolsScreenBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCANNER_SCREEN,
      page: () => const QrScannerScreenView(),
      binding: QrScannerScreenBinding(),
    ),
    GetPage(
      name: _Paths.QR_GENERATOR_SCREEN,
      page: () => const QrGeneratorScreenView(),
      binding: QrGeneratorScreenBinding(),
    ),
    GetPage(
      name: _Paths.OTHER_TOOLS_SCREEN,
      page: () => const OtherToolsScreenView(),
      binding: OtherToolsScreenBinding(),
    ),
    GetPage(
      name: _Paths.WHATSAPP_INFO_SCREEN,
      page: () => const WhatsappInfoScreenView(),
      binding: WhatsappInfoScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAKE_STORY_SCREEN,
      page: () => const FakeStoryScreenView(),
      binding: FakeStoryScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_DOWNLOADER_SCREEN,
      page: () => const VideoDownloaderScreenView(),
      binding: VideoDownloaderScreenBinding(),
    ),
    GetPage(
      name: _Paths.FACEBOOK_SCREEN,
      page: () => const FacebookScreenView(),
      binding: FacebookScreenBinding(),
    ),
    GetPage(
      name: _Paths.WHATSAPP_SCREEN,
      page: () => const WhatsappScreenView(),
      binding: WhatsappScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_DOWNLOAD_SCREEN,
      page: () => const MyDownloadScreenView(),
      binding: MyDownloadScreenBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_TV_SCREEN,
      page: () => const SelectTvScreenView(),
      binding: SelectTvScreenBinding(),
    ),
  ];
}
