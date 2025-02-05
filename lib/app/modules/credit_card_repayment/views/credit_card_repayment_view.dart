import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/credit_card_repayment_controller.dart';
import 'add_new_credit_card_view.dart';
import 'credit_card_help.dart';

class CreditCardRepaymentView extends GetView<CreditCardRepaymentController> {
  const CreditCardRepaymentView({super.key});

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
          'Pay your Credit card bill',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Get.to(() => CreditCardHelp());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel slider
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

              // Carousel indicators
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.carouselImages.length,
                        (index) {
                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex.value == index
                              ? const Color(0xFF007f97)
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                );
              }),

              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white38.withOpacity(0.9),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Recents",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/images/axis logo.png",
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              title: const Text("Axis Bank"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("XXXX8648"),
                                ],
                              ),
                              trailing: const Icon(Icons.more_vert),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 5),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            Get.to(() => AddNewCreditCardView());
          },
          child: const Text(
            "Add New Credit Card",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
