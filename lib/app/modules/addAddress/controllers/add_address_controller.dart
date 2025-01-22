import 'package:get/get.dart';

class AddAddressController extends GetxController {
  //TODO: Implement AddAddressController

  final count = 0.obs;
  var selectedAddress = ''.obs;
  var locationName = ''.obs;

  // Method to set the selected address
  void selectAddress(String addressType) {
    selectedAddress.value = addressType;
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
