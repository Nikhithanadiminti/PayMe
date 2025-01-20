import 'package:demo_project/app/modules/qr_code_scanner/views/qr_code_scanner_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/footer_controller.dart';

class FooterView extends GetView<FooterController> {
  const FooterView({super.key});
  @override

  @override

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home Button
            Expanded(
              child: InkWell(
                onTap: () => controller.updateIndex(0),
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: controller.selectedIndex.value == 0
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(width: 80),
            // Scanner Button (in the middle)
            Expanded(
              child: InkWell(
                onTap: () => Get.to(() => QrCodeScannerView()), // Navigate to Scanner view using GetX
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        color: controller.selectedIndex.value == 1
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'Scanner',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 1
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            // Spacer for Floating Action Button
            const SizedBox(width: 80),
            // History Button
            Expanded(
              child: InkWell(
                // onTap: () => Get.to(TestingView()),
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        color: controller.selectedIndex.value == 2
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      Text(
                        'History',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 2
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
