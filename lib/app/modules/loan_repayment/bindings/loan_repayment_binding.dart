import 'package:get/get.dart';

import '../controllers/loan_repayment_controller.dart';

class LoanRepaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanRepaymentController>(
      () => LoanRepaymentController(),
    );
  }
}
