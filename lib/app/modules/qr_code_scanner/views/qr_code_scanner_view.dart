import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../controllers/qr_code_scanner_controller.dart';

class QrCodeScannerView extends GetView<QrCodeScannerController> {
  const QrCodeScannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QrCodeScannerController controller = Get.put(QrCodeScannerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Any QR Code',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // Makes the back icon white

      ),
      body: Stack(
        children: [
          // QR Scanner
          MobileScanner(
          controller: controller.scannerController, // Use the torch state
            onDetect: (BarcodeCapture capture) {
              for (final barcode in capture.barcodes) {
                final String? rawValue = barcode.rawValue;
                if (rawValue != null) {
                  controller.onBarcodeScanned(rawValue , context);
                  break; // Handle only the first detected barcode
                }
              }
            },
          ),
          // Semi-transparent overlay
          Positioned.fill(
            child: Stack(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.2),
                ),
                // Animated scanner shape
                Align(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      width: controller.scannerSize.value,
                      height: controller.scannerSize.value,
                      child: CustomPaint(
                        painter: ScannerPainter(),
                      ),
                    );
                  }),
                ),
                // Vertical scanning line

                Align(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return Transform.translate(
                      offset: Offset(0, controller.lineOffset.value), // Use only lineOffset
                      child: Container(
                        width: 200, // Fixed width (independent of scannerSize)
                        height: 2,
                        color: Colors.red.withOpacity(0.8),
                      ),
                    );
                  }),
                ),

              ],
            ),
          ),
          // Bottom buttons (Upload QR and Torch)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Upload QR Button
                  ElevatedButton.icon(
                    onPressed: controller.isImagePicking.value
                        ? null
                        : () => controller.pickAndScanImage(context),
                    icon: const Icon(Icons.image, color: Color(0xFF007f97)),
                    label: const Text("Upload QR", style: TextStyle(color: Color(0xFF007f97))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Torch Button
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.toggleTorch();
                    },
                    icon: Obx(() => Icon(
                      controller.isTorchOn.value
                          ? Icons.flashlight_on
                          : Icons.flashlight_off,color: Color(0xFF007f97),
                    )),
                    label: const Text("Torch",style: TextStyle(color: Color(0xFF007f97)),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CustomPainter for scanner with disconnected curved edges
class ScannerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xFF007f97)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final double cornerRadius = 20;
    final double lineLength = 40;

    // Top-left corner
    canvas.drawArc(
      Rect.fromLTWH(0, 0, cornerRadius * 2, cornerRadius * 2),
      3.14, // Start angle
      3.14 / 2, // Sweep angle
      false,
      paint,
    );
    canvas.drawLine(
      Offset(0, cornerRadius),
      Offset(0, cornerRadius + lineLength),
      paint,
    );
    canvas.drawLine(
      Offset(cornerRadius, 0),
      Offset(cornerRadius + lineLength, 0),
      paint,
    );

    // Top-right corner
    canvas.drawArc(
      Rect.fromLTWH(size.width - cornerRadius * 2, 0, cornerRadius * 2, cornerRadius * 2),
      -3.14 / 2, // Start angle
      3.14 / 2, // Sweep angle
      false,
      paint,
    );
    canvas.drawLine(
      Offset(size.width, cornerRadius),
      Offset(size.width, cornerRadius + lineLength),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - cornerRadius, 0),
      Offset(size.width - cornerRadius - lineLength, 0),
      paint,
    );

    // Bottom-left corner
    canvas.drawArc(
      Rect.fromLTWH(0, size.height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2),
      3.14 / 2, // Start angle
      3.14 / 2, // Sweep angle
      false,
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height - cornerRadius),
      Offset(0, size.height - cornerRadius - lineLength),
      paint,
    );
    canvas.drawLine(
      Offset(cornerRadius, size.height),
      Offset(cornerRadius + lineLength, size.height),
      paint,
    );

    // Bottom-right corner
    canvas.drawArc(
      Rect.fromLTWH(
        size.width - cornerRadius * 2,
        size.height - cornerRadius * 2,
        cornerRadius * 2,
        cornerRadius * 2,
      ),
      0, // Start angle
      3.14 / 2, // Sweep angle
      false,
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height - cornerRadius),
      Offset(size.width, size.height - cornerRadius - lineLength),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - cornerRadius, size.height),
      Offset(size.width - cornerRadius - lineLength, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}