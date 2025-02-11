import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUpiIdController extends GetxController {
  //TODO: Implement AddUpiIdController
  TextEditingController upiController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final count = 0.obs;
  RxBool showAdditionalFields = false.obs;
  RxBool isUpiIdValid = false.obs;
  RxBool isButtonClicked = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


  void validateUpiId(String value) {
    // Improved regex for UPI ID format
    final RegExp upiRegExp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+$');
    isUpiIdValid.value = upiRegExp.hasMatch(value);

    // Reset button click status on UPI ID change
    if (isButtonClicked.value) {
      isButtonClicked.value = false;
    }
  }



  void verifyUpiId() {
    // Display additional fields upon successful verification
    showAdditionalFields.value = true;

    // Mark the button as clicked and verified
    isButtonClicked.value = true;

    // Unfocus the text field after verification
    focusNode.unfocus();
  }


  @override
  void onClose() {
    nicknameController.dispose();
    upiController.dispose();
    focusNode.dispose();
    super.onClose();
  }


  void clearUpiInput() {
    upiController.clear();
  }

  // Example function to set the UPI ID programmatically
  void setUpiInput(String text) {
    upiController.text = text;
  }

  void increment() => count.value++;
}
