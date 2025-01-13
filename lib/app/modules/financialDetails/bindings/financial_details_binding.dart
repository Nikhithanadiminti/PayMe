import 'package:get/get.dart';

import '../controllers/financial_details_controller.dart';

class FinancialDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialDetailsController>(
      () => FinancialDetailsController(),
    );
  }
}
