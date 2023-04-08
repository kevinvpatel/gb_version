import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreenController extends GetxController {
  //TODO: Implement GBScannerToolsQrScannerScreenController

  Barcode? result;
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    qrViewController!.scannedDataStream.listen((scanData) {
      result = scanData;
      update();
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()} _onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


  @override
  Future<void> onInit() async {
    super.onInit();
    await qrViewController?.stopCamera();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    qrViewController?.dispose();
  }

}
