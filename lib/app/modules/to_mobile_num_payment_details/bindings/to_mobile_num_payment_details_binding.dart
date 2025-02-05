import 'package:get/get.dart';

import '../controllers/to_mobile_num_payment_details_controller.dart';

class ToMobileNumPaymentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToMobileNumPaymentDetailsController>(
      () => ToMobileNumPaymentDetailsController(),
    );
  }
}
