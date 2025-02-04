import 'package:get/get.dart';

import '../controllers/mutualfundloan_controller.dart';

class MutualfundloanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MutualfundloanController>(
      () => MutualfundloanController(),
    );
  }
}
