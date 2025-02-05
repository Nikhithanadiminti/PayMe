import 'dart:async';
import 'dart:io';

import 'package:demo_project/app/modules/scanned_payment_details/controllers/scanned_payment_details_controller.dart';
import 'package:demo_project/app/modules/scanned_payment_details/views/scanned_payment_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart' as mlkit;  // Aliasing google_ml_kit
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScannerController extends GetxController {
  //TODO: Implement QrCodeScannerController
  final MobileScannerController scannerController = MobileScannerController();
  static var platform = MethodChannel('com.example.qrdecoder/scanImage'); // Channel for platform communication
  final ImagePicker _picker = ImagePicker();
  var isImagePicking = false.obs;
  var isLoading = false.obs;
  RxString scannedData = ''.obs;
  RxBool isScanning = true.obs; // Add this flag to control scanning
  final isTorchOn = false.obs;
  final count = 0.obs;
  late Timer zoomTimer;
  var scannerSize = 250.0.obs;

  final lineOffset = (-125.0).obs; // Initial offset
  late Timer lineTimer;


  void onBarcodeScanned(String? data, BuildContext context) {
    if (data != null) {
      scannedData.value = data;
      isScanning.value = false; // Stop scanning immediately

      // Print the raw data from the QR code
      print("Scanned QR Code Data: $data");

      // Check if the QR code is a UPI bank payment URL
      if (data.startsWith('upi://pay')) {
        // Handle UPI payment QR code
        Fluttertoast.showToast(
          msg: "Bank Payment (UPI) QR Code Detected!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.7),
          textColor: Colors.white,
          fontSize: 16.0,
        );

        // Process payment info or navigate to the payment screen
        final paymentController = Get.find<ScannedPaymentDetailsController>();
        paymentController.updateScannedDetails(data);
        paymentController.hasInteractedWithAmount.value = false;
        Get.to(() => ScannedPaymentDetailsView(contactName: '',));
      }
      // Check if the QR code is a regular URL (not a UPI URL)
      else if (data.startsWith('http://') || data.startsWith('https://')) {
        // Show confirmation dialog for external site
        _showExternalSiteDialog(data, context);
      } else {
        // Handle other types of QR codes
        Fluttertoast.showToast(
          msg: "Unknown QR Code Detected.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.orange.withOpacity(0.7),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      // Show failure Toast if no data found
      Fluttertoast.showToast(
        msg: "Failed to scan QR Code.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  bool isDialogOpen = false;

  void _showExternalSiteDialog(String url, BuildContext context) {
    if (isDialogOpen) return; // Prevent showing the dialog again if it's already open
    isDialogOpen = true;

    // Stop scanning immediately when showing the dialog
    isScanning.value = false;

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside the dialog
      barrierColor: Colors.black.withOpacity(0.2), // Set the opacity for the background behind the dialog
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white, // Set the dialog background color to white
          child: Container(
            width: 330, // Set the width of the dialog
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You are leaving WePay',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  'You are being redirected to an external site:',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  url,
                  style: TextStyle(color: Color(0xFF007f97), fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  'Note: WePay will not be responsible for any content on this site.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
                  children: [
                    // Open Link Button
                    ElevatedButton(
                      onPressed: () {
                        _launchURL(url);
                        Navigator.pop(context); // Close the dialog after clicking
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text('Open Link', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 20), // Space between buttons
                    // Cancel Button
                    ElevatedButton(
                      onPressed: () {
                        // Close the dialog and resume scanning
                        Navigator.of(context, rootNavigator: true).pop(); // Use rootNavigator for precision
                        isDialogOpen = false; // Reset the dialog flag
                        isScanning.value = true; // Resume scanning
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      // Ensure that isDialogOpen is reset once the dialog is dismissed.
      isDialogOpen = false;
      // Resume scanning here, in case the user clicks outside the dialog in an unexpected manner.
      isScanning.value = true;
    });
  }

  // Define _launchURL method using url_launcher package

  void _launchURL(String url) async {
    try {
      final bool canOpen = await canLaunch(url);
      if (canOpen) {
        await launch(url);
      } else {
        Fluttertoast.showToast(
          msg: "Unable to open the URL: $url",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print("Error launching URL: $e"); // Print error in log for debugging
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }





  Future<void> pickAndScanImage(BuildContext context) async {
    if (isImagePicking.value) {
      print("Image picker is already active...");
      return;
    }

    isImagePicking.value = true;
    isLoading.value = true;

    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);

        // Scan QR Code from the picked image using google_ml_kit
        final String? result = await scanQRCodeFromImage(imageFile);
        scannedData.value = result ?? "Format not supported";
        final paymentController = Get.find<ScannedPaymentDetailsController>();

        if (result != null) {
          print("Scanned QR Code Data: $result");

          // Check if the scanned QR code is a UPI payment URL
          if (result.startsWith('upi://pay')) {
            // Handle UPI payment QR code
            // Fluttertoast.showToast(
            //   msg: "Bank Payment (UPI) QR Code Detected!",
            //   toastLength: Toast.LENGTH_SHORT,
            //   gravity: ToastGravity.BOTTOM,
            //   backgroundColor: Colors.green.withOpacity(0.7),
            //   textColor: Colors.white,
            //   fontSize: 16.0,
            // );

            paymentController.updateScannedDetails(result); // Update scanned details
            Get.to(() => ScannedPaymentDetailsView(contactName: '',)); // Navigate to payment details view
          }
          // Check if the QR code is a regular URL (not a UPI URL)
          else if (result.startsWith('http://') || result.startsWith('https://')) {
            // Show confirmation dialog for external site
            _showExternalSiteDialog(result, context);
          } else {
            // Handle other types of QR codes
            Fluttertoast.showToast(
              msg: "Unknown QR Code Detected.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.orange.withOpacity(0.7),
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else {
          // Optional: If no QR code found, show a message to the user
          Fluttertoast.showToast(
            msg: "No QR code found in the image",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black.withOpacity(0.7),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        scannedData.value = "No image selected.";
        Fluttertoast.showToast(
          msg: scannedData.value,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black.withOpacity(0.7),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print('Error: $e');
      scannedData.value = 'Error occurred: $e';
      Fluttertoast.showToast(
        msg: scannedData.value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      isImagePicking.value = false;
      isLoading.value = false;
    }
  }

// Function to scan QR code from image using google_ml_kit
  Future<String?> scanQRCodeFromImage(File image) async {
    try {
      final inputImage = mlkit.InputImage.fromFile(image);
      final barcodeScanner = mlkit.GoogleMlKit.vision.barcodeScanner();

      // Scan the image and get the barcodes using aliased Barcode class
      final List<mlkit.Barcode> barcodes = await barcodeScanner.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        // Return the first detected QR code's raw value
        return barcodes.first.rawValue;
      } else {
        return null; // No QR code found
      }
    } catch (e) {
      print("Error scanning QR code: $e");
      return null; // Error scanning QR code
    }
  }



  void toggleTorch() {
    isTorchOn.value = !isTorchOn.value;
    if (isTorchOn.value) {
      scannerController.toggleTorch();
    } else {
      scannerController.toggleTorch();
    }
  }

  void restartScanning() {
    isScanning.value = true; // Restart scanning
    scannedData.value = ''; // Clear previous scanned data if needed
  }


  void _animateScanner() {
    scannerSize.value = scannerSize.value == 250 ? 270 : 250;
    Future.delayed(const Duration(milliseconds: 800), _animateScanner);
  }

  void _animateLine() {
    // Periodic animation for scrolling line
    lineTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (lineOffset.value > 125.0) {
        lineOffset.value = -125.0; // Reset to start position
      } else {
        lineOffset.value += 2; // Move the line vertically
      }
    });
  }


  @override
  void onInit() {
    super.onInit();
    _animateScanner();
    _animateLine();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    zoomTimer.cancel();
    lineTimer?.cancel();
    scannerController.dispose();
    super.onClose();
  }



  void increment() => count.value++;
}
