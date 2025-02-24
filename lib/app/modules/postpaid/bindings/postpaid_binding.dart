import 'package:get/get.dart';

import '../controllers/postpaid_controller.dart';

class PostpaidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostpaidController>(
      () => PostpaidController(),
    );
  }
}
