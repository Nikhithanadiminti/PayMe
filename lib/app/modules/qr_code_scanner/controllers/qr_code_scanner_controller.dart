import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class QrCodeScannerController extends GetxController {
  //TODO: Implement QrCodeScannerController

  RxString scannedData = ''.obs;
  RxBool isScanning = true.obs; // Add this flag to control scanning
  final isTorchOn = false.obs;
  final count = 0.obs;
  void onBarcodeScanned(String? data) {
    if (data != null) {
      scannedData.value = data;
      isScanning.value = false; // Stop scanning
      Get.snackbar('QR Code Scanned', data); // Display a snackbar notification
    }
  }

  void toggleTorch() {
    isTorchOn.value = !isTorchOn.value;
  }

  void restartScanning() {
    isScanning.value = true; // Restart scanning
    scannedData.value = ''; // Clear previous scanned data if needed
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
