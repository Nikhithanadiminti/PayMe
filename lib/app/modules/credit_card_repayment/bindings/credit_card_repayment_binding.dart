import 'package:get/get.dart';

import '../controllers/credit_card_repayment_controller.dart';

class CreditCardRepaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditCardRepaymentController>(
      () => CreditCardRepaymentController(),
    );
  }
}
