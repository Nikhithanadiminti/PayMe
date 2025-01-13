import 'package:get/get.dart';

import '../controllers/additional_details_controller.dart';

class AdditionalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdditionalDetailsController>(
      () => AdditionalDetailsController(),
    );
  }
}
