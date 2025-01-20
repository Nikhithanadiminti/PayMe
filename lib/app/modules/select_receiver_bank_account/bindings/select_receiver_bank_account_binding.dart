import 'package:get/get.dart';

import '../controllers/select_receiver_bank_account_controller.dart';

class SelectReceiverBankAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectReceiverBankAccountController>(
      () => SelectReceiverBankAccountController(),
    );
  }
}
