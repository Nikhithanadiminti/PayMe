import 'package:get/get.dart';

import '../controllers/bankaccounts_controller.dart';

class BankaccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankaccountsController>(
      () => BankaccountsController(),
    );
  }
}
