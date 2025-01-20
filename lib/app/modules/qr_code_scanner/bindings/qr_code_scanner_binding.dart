import 'package:get/get.dart';

import '../controllers/qr_code_scanner_controller.dart';

class QrCodeScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrCodeScannerController>(
      () => QrCodeScannerController(),
    );
  }
}
