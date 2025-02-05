import 'package:demo_project/app/modules/rent/views/pay_for_rentals_help.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pay_for_rentals_controller.dart';

class PropertyDeposit extends  GetView<PayForRentalsController>{
  const PropertyDeposit({super.key});

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
          title: Text("Basic Property Details",
            style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF007f97),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              color: Colors.white,
              onPressed: () {
                Get.to(() => PayForRentalsHelp());
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
                    controller.currentIndex.value = index; // Update observable
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

              // Container with two text fields
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rent Amount Label and TextField
                    const Text(
                      "Deposit Amount",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF007f97),
                            width: 2.0,
                          ),
                        ),
                        hintText: "Min. amount 1000",
                      ),
                      keyboardType: TextInputType.number, // For numeric input
                    ),
                    const SizedBox(height: 20),

                    // Property Name Label and TextField
                    const Text(
                      "Property Name",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF007f97),
                            width: 2.0,
                          ),
                        ),
                        hintText: "Eg. Gokuldham",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



