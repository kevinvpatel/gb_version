import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_flutter/app/data/adServices.dart';
import 'package:gb_version_flutter/app/data/constants/color_constants.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/qr_scanner_screen/controllers/qr_scanner_screen_controller.dart';
import 'package:gb_version_flutter/app/modules/GB/scanner_tools/qr_scanner_screen/views/qr_scanner_screen_view.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// class ScannerScreen extends GetView<QrScannerScreenController> {
//   const ScannerScreen({Key? key}) : super(key: key);
//
//   @override
//   void reassemble() {
//     if(Platform.isAndroid) {
//       controller.qrViewController?.pauseCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     QrScannerScreenController controller = Get.put(QrScannerScreenController());
//     double height = 100.h;
//     double width = 100.w;
//     var scanArea = (width < 400 || height < 400) ? 150.0 : 300.0;
//
//     return Scaffold(
//       // backgroundColor: Colors.blue,
//       body: Stack(
//         children: [
//           QRView(
//             key: controller.qrKey,
//             onQRViewCreated: controller.onQRViewCreated,
//             overlay: QrScannerOverlayShape(
//                 borderColor: ConstantsColor.themeColor,
//                 borderRadius: 10,
//                 borderLength: 30,
//                 borderWidth: 10,
//                 cutOutSize: scanArea),
//             onPermissionSet: (ctrl, p) => controller.onPermissionSet(context, ctrl, p),
//           ),
//
//           Align(
//             alignment: AlignmentDirectional(0, 0.8),
//             child: ElevatedButton(
//                 child: Text('Scan'),
//                 onPressed: () async {
//                   await controller.qrViewController?.resumeCamera();
//                   controller.update();
//                   // await controller.qrViewController?.flipCamera();
//                 },
//             ),
//           ),
//           if (controller.result != null)
//             Align(
//               alignment: AlignmentDirectional(0, 0.6),
//               child: GetBuilder(
//                   init: QrScannerScreenController(),
//                   builder: (ctrl) {
//                     return Text('Barcode Type: ${describeEnum(ctrl.result!.format)}  Data: ${ctrl.result?.code}', style: TextStyle(color: Colors.white),);
//                   }
//               ),
//             )
//           else
//             const Text('Scan a code'),
//
//         ],
//       ),
//       // bottomNavigationBar: AdService.bannerAd(width: width),
//     );
//   }
//
// }



class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    // controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                _buildQrView(context),

                // Align(
                //   alignment: AlignmentDirectional(0, 0),
                //   child: ElevatedButton(
                //     child: Text('Scan'),
                //     onPressed: () async {
                //       await controller?.resumeCamera();
                //     },
                //   ),
                // ),

              ],
            ),
            // if (result != null)
            //   Text(
            //       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
            // else
            //   const Text('Scan a code'),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {

    double height = 100.h;
    double width = 100.w;
    var scanArea = (width < 400 || height < 400) ? 150.0 : 300.0;

    return Container(
      height: height,
      width: width,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: ConstantsColor.themeColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if(result != null) {
        Get.off(QrScannerScreenView(), arguments: result!.code);
        print('result -> ${result!.code}');
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}