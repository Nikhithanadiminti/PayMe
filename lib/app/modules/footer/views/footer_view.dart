import 'package:demo_project/app/modules/qr_code_scanner/views/qr_code_scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../transactions/views/transactions_view.dart';
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
          controller.updateIndex(0);
          print("Home tapped");
        } else if (index == 1) {
          controller.updateIndex(1); // Update the selected index
          // Get.to(() => QrCodeScannerView()); // Navigate to QR Code Scanner view
          print("Scanner tapped");
        } else if (index == 2) {
          controller.updateIndex(2); // Update the selected index
           Get.to(() => TransactionsView());
        }
      },
      index: controller.selectedIndex.value, // Start with the correct selected index
    );
  }
}
