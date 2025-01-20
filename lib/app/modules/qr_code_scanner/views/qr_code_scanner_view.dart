// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import '../controllers/qr_code_scanner_controller.dart';
//
// class QrCodeScannerView extends GetView<QrCodeScannerController> {
//   const QrCodeScannerView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final QrCodeScannerController controller = Get.put(QrCodeScannerController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Scanner'),
//         backgroundColor: Colors.black,
//       ),
//       body: Stack(
//         children: [
//           MobileScanner(
//             onDetect: (BarcodeCapture capture) {
//               // Handle QR code detection
//             },
//           ),
//           // Semi-transparent overlay with scanner shape
//           Positioned.fill(
//             child: Stack(
//               children: [
//                 Container(
//                   color: Colors.black.withOpacity(0.6),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: 250,
//                     height: 250,
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       border: Border.all(color: Colors.purple, width: 4),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Bottom buttons (Upload QR and Torch)
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 50.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Upload QR Button
//                   ElevatedButton.icon(
//                     onPressed: () async {
//                       final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//                       if (pickedFile != null) {
//                         // Process the selected image for QR code
//                       }
//                     },
//                     icon: const Icon(Icons.image),
//                     label: const Text("Upload QR"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black.withOpacity(0.6),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   // Torch Button
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       controller.toggleTorch();
//                     },
//                     icon: Obx(() => Icon(
//                       controller.isTorchOn.value ? Icons.flashlight_on : Icons.flashlight_off,
//                     )),
//                     label: const Text("Torch"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black.withOpacity(0.6),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
