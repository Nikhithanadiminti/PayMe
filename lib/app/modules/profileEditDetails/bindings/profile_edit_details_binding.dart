import 'package:get/get.dart';

import '../controllers/profile_edit_details_controller.dart';

class ProfileEditDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditDetailsController>(
      () => ProfileEditDetailsController(),
    );
  }
}
