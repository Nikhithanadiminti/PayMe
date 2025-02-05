import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUpiNumberController extends GetxController {
  TextEditingController upiController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  RxBool showAdditionalFields = false.obs;
  RxBool isUpiIdValid = false.obs;
  RxBool isButtonClicked = false.obs;  // Track if the button was clicked
  RxBool isModifiedAfterVerification = false.obs; // To track if the UPI number was modified after verification
  RxString originalUpiText =''.obs
;  @override
  void onInit() {
    super.onInit();
    upiController.addListener(_upiTextListener);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void validateUpiId(String value) {
    if (value.length >= 8 && value.length <= 9 && RegExp(r'^[0-9]+$').hasMatch(value)) {
      isUpiIdValid.value = true;
    } else {
      isUpiIdValid.value = false;
    }
  }

  void _upiTextListener() {
    // If the UPI ID is modified after verification, reset the button state
    if (isButtonClicked.value && upiController.text != originalUpiText.value) {
      isButtonClicked.value = false;  // Reset button to "Verify"
      showAdditionalFields.value = false;  // Hide additional fields
      isModifiedAfterVerification.value = true; // Track the change
    }

    // Validate the UPI ID
    validateUpiId(upiController.text);
  }


  void verifyUpiId() {
    if (isUpiIdValid.value) {
      isButtonClicked.value = true;  // Button text changes to "Verified"
      showAdditionalFields.value = true;  // Show additional fields
      originalUpiText.value = upiController.text;  // Save the original UPI ID
      isModifiedAfterVerification.value = false;  // Reset modification status
    }
  }


  // Reset all states when input is cleared or modified
  void resetForm() {
    isUpiIdValid.value = false;
    isButtonClicked.value = false;
    showAdditionalFields.value = false;
    upiController.clear();
    nicknameController.clear();
    isModifiedAfterVerification.value = false;
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
}
