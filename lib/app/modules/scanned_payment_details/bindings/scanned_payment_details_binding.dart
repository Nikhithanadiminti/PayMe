import 'package:get/get.dart';

import '../controllers/scanned_payment_details_controller.dart';

class ScannedPaymentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannedPaymentDetailsController>(
      () => ScannedPaymentDetailsController(),
    );
  }
}
