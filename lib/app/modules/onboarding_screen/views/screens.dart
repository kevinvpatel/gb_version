import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/image_constants.dart';
import 'package:gb_version_flutter/app/data/constants/widget_constants.dart';
import 'package:gb_version_flutter/app/modules/home_screen/views/home_screen_view.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Screens {
  static AdService adService = AdService();

  static PageController pageController = PageController();

  static Widget roundedButton({required Function() onPressed, required Widget child, required String label}) {
    return Column(
      children: [
        SizedBox(
          height: 31.5.sp, width: 31.5.sp,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(196, 255, 188, 1),
                  padding: EdgeInsets.all(11.5.sp),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.sp))
              ),
              child: child
          ),
        ),
        SizedBox(height: 8.sp),
        Text(label, style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),)
      ],
    );
  }

  static Widget screen1() {
    double height = 100.h;
    double width = 100.w;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.sp),
      height: height,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(ConstantsImage.screen1_logo, width: width * 0.78),
          SizedBox(height: 28.sp),
          Text('You can easily share this app with your friends and family.'
              ' Apply app ratings and reviews which helps to understand the things this app needs to improve.',
            style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.sp),
          ConstantWidgets.button(
              onPressed: () {
                pageController.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.easeOut);
                adService.checkCounterAd();
              },
              child: Text('Start', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
              width: width * 0.5
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      roundedButton(
                          label: 'Share',
                          child: Image.asset(ConstantsImage.share),
                          onPressed: () {
                            Share.share('check out what i found https://example.com');
                          }
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roundedButton(
                          label: 'Rate',
                          child: Image.asset(ConstantsImage.rate),
                          onPressed: () {
                            LaunchReview.launch(androidAppId: 'com.gb_version.gb_version_flutter');
                          }
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      roundedButton(
                          label: 'Privacy',
                          child: Image.asset(ConstantsImage.privacy),
                          onPressed: () async {
                            if(await canLaunchUrl(Uri.parse('https://flutter.dev'))) {
                              await launchUrl(Uri.parse('https://flutter.dev'));
                            }
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget screen2() {
    double height = 100.h;
    double width = 100.w;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.sp),
        height: height,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ConstantsImage.screen2_logo, width: width * 0.78),
            SizedBox(height: 28.sp),
            Text('Status Saver For GB What’s is here to help you download or share friend’s statuses in just one click.'
                ' You can save your desired image or video statues in your gallery or you can share with friends directly within the GB What’s status app.',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            // SizedBox(height: 36.sp),
            const Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ConstantWidgets.button(
          onPressed: () {
            print('Continue button');
            pageController.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.easeOut);
            adService.checkCounterAd();
          },
          child: Text('Continue', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
          width: width * 0.7,
      ),
    );
  }

  static Widget screen3() {
    double height = 100.h;
    double width = 100.w;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.sp),
        height: height,
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(ConstantsImage.screen3_logo, width: width * 0.78),
            SizedBox(height: 28.sp),
            Column(
              children: [
                Text('Features', style: TextStyle(fontSize: 21.5.sp, fontWeight: FontWeight.w700),),
                Divider(color: const Color.fromRGBO(26, 146, 6, 1), height: 0, thickness: 6.7.sp, indent: width * 0.37, endIndent: width * 0.22,),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: width * 0.9,
              child: bulletinText(lstText: [
                'Text repeater: repeat text message.',
                'Status Saver app.',
                'Chat Messages Text style and fonts for GB What’s.',
                'Funny and stylish Font.'
              ]),
            ),
            const Spacer(),
            const Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ConstantWidgets.button(
          onPressed: () {
            Get.to(const HomeScreenView());
            adService.checkCounterAd();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ConstantsImage.whatsapp_icon, height: 24.sp),
              SizedBox(width: 20.sp),
              Text('GB What\'s', style: TextStyle(fontSize: 20.5.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          width: width * 0.7
      ),
    );
  }


  static Widget bulletinText({required List<String> lstText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lstText.length, (index) =>
          Padding(
            padding: EdgeInsets.only(top: 8.sp, bottom: 8.sp),
            child: Wrap(
              children: [
                // Text('\u2022', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w500), maxLines: 3),
                Text('\u2022   ${lstText[index]}', style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis, maxLines: 3),
              ],
            ),
          )
      ),
    );
  }

}