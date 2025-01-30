import 'package:get/get.dart';

import '../controllers/transit_and_food_controller.dart';

class TransitAndFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransitAndFoodController>(
      () => TransitAndFoodController(),
    );
  }
}
