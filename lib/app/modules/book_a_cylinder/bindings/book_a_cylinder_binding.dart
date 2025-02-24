import 'package:get/get.dart';

import '../controllers/book_a_cylinder_controller.dart';

class BookACylinderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookACylinderController>(
      () => BookACylinderController(),
    );
  }
}
