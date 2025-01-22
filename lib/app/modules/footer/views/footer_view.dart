import 'package:demo_project/app/modules/qr_code_scanner/views/qr_code_scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../controllers/footer_controller.dart';

class FooterView extends GetView<FooterController> {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Color(0xFF007f97), // Bar background color
      height: 70, // Height of the bar
      items: <Widget>[
        // Home Button
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        // Scanner Button (in the middle)
        Icon(
          Icons.qr_code_scanner,
          size: 30,
          color: Colors.white,
        ),
        // History Button
        Icon(
          Icons.history,
          size: 30,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        // Handle actions based on the index of the tapped icon
        if (index == 0) {
          // Home Button - Perform any action for Home, such as navigating or updating UI
          controller.updateIndex(0); // Update the selected index
          // You can add logic to navigate to the Home view if needed
          print("Home tapped");
        } else if (index == 1) {
          // Scanner Button - Navigate to the QR Code Scanner screen
          controller.updateIndex(1); // Update the selected index
          // Get.to(() => QrCodeScannerView()); // Navigate to QR Code Scanner view
          print("Scanner tapped");
        } else if (index == 2) {
          // History Button - Perform any action for History, such as navigating or updating UI
          controller.updateIndex(2); // Update the selected index
          // You can add logic to navigate to the History view if needed
          print("History tapped");
        }
      },
      index: controller.selectedIndex.value, // Start with the correct selected index
    );
  }
}
