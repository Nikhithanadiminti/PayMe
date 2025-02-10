import 'package:demo_project/app/modules/book_a_cylinder/controllers/book_a_cylinder_controller.dart';
import 'package:demo_project/app/modules/piped_gas/controllers/piped_gas_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookACylinderView extends GetView<BookACylinderController> {
  const BookACylinderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarousel(),
              const SizedBox(height: 20),
              _buildAllBillers(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: const Text(
        "Select your Gas Provider",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF007f97),
      actions: [
        IconButton(
          icon: Icon(Icons.help_outline),
          color: Colors.white,
          onPressed: () {
            // Get.to(()=> MobileRechargeHelp());
          },
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.carouselImages.length,
            onPageChanged: (index) {
              controller.currentIndex.value = index;
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.asset(
                  controller.carouselImages[index],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.carouselImages.length,
                  (index) => Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentIndex.value == index
                      ? const Color(0xFF007f97)
                      : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }


  Widget _buildAllBillers() {
    final allBillers = [
      {"logo": "assets/images/bharat_gas.jpg", "name": "Bharat Gas"},
      {"logo": "assets/images/bharat_gas_commercial.png", "name": "Bharat Gas Commercial"},
      {"logo": "assets/images/hp_gas.webp", "name": "HP Gas"},
      {"logo": "assets/images/indane_gas.png", "name": "Indane Gas (Indian Oil)"},
    ];

    return _buildBillersSection("All Billers", allBillers, isList: true);
  }

  Widget _buildBillersSection(String title, List<Map<String, String>> billers,
      {bool isList = false}) {
    return Container(
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
              return _buildBillerItem(biller["logo"]!, biller["name"]!);
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
                      .map((biller) =>
                      BillerItem(logoPath: biller["logo"]!, billerName: biller["name"]!))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillerItem(String logo, String name) {
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

class BillerItem extends StatelessWidget {
  final String logoPath;
  final String billerName;

  const BillerItem({required this.logoPath, required this.billerName, Key? key})
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
        Text(billerName, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}


