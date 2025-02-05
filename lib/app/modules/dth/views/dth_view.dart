import 'package:demo_project/app/modules/dth/views/airtel_digital_tv.dart';
import 'package:demo_project/app/modules/dth/views/sun_direct.dart';
import 'package:demo_project/app/modules/dth/views/tata_play.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dth_controller.dart';
import 'd2h_view.dart';
import 'dish_tv.dart';

class DthView extends GetView<DthController> {
  const DthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Select Provider',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              // Get.to(() => RentHelpView());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel Section
              SizedBox(
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.carouselImages.length,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        controller.carouselImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Dots Indicator
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.carouselImages.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex.value == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              _buildAllBillers(),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPage(int index) {
    switch (index) {
      case 0:
        Get.to(() => const AirtelDigitalTv());
        break;
      case 1:
        Get.to(() => const DishTv());
        break;
      case 2:
        Get.to(() => const SunDirect());
        break;
      case 3:
        Get.to(() => const TataPlay());
        break;
      case 4:
        Get.to(() => const D2hView());
        break;
    }
  }

  Widget _buildAllBillers() {
    final allBillers = [
      {"logo": "assets/images/airtel_digital.png", "name": "Airtel Digital TV"},
      {"logo": "assets/images/dish_tv.jpg", "name": "Dish TV"},
      {"logo": "assets/images/sun_direct.webp", "name": "Sun Direct"},
      {"logo": "assets/images/tata_play.jpg", "name": "Tata Play (Formerly Tatasky)"},
      {"logo": "assets/images/d2h.webp", "name": "D2H"},
    ];

    return _buildBillersSection("All Billers", allBillers, isList: true);
  }

  Widget _buildBillersSection(String title, List<Map<String, String>> billers,
      {bool isList = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            isList
                ? ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: billers.length,
              separatorBuilder: (_, __) => const Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final biller = billers[index];
                return GestureDetector(
                  onTap: () => navigateToPage(index),
                  child: _buildBankItem(biller["logo"]!, biller["name"]!),
                );
              },
            )
                : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: List.generate(
                  (billers.length / 3).ceil(),
                      (rowIndex) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: billers
                        .skip(rowIndex * 3)
                        .take(3)
                        .map(
                          (biller) => BankItem(
                        logoPath: biller["logo"]!,
                        bankName: biller["name"]!,
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankItem(String logo, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(logo),
          ),
          const SizedBox(width: 14),
          Text(name),
        ],
      ),
    );
  }
}

class BankItem extends StatelessWidget {
  final String logoPath;
  final String bankName;

  const BankItem({required this.logoPath, required this.bankName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(logoPath),
        ),
        const SizedBox(height: 8),
        Text(
          bankName,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
