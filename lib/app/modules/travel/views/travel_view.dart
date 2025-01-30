import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/travel_controller.dart';

class TravelView extends GetView<TravelController> {
  const TravelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text('Travel',style: TextStyle(color: Colors.white),),
          backgroundColor: const Color(0xFF007f97),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              color: Colors.white,
              onPressed: () {
                // Get.to(() => TravelHelpView());
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
                  child:
                  PageView.builder(
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
                          // image: DecorationImage(
                          //   image: Image.asset(controller.carouselImages[index]),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child:Image.asset(controller.carouselImages[index],
                            fit:BoxFit.fill ),
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
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white38.withOpacity(0.9),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Travel Bookings",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildOption(
                              icon: Icons.flight_takeoff,
                              label: "Flights",
                              // onTap: () => Get.to(() => MobileRechargeView()),
                            ),
                            _buildOption(
                              icon: Icons.directions_bus_filled,
                              label: "Bus",
                              // onTap: () => Get.to(() => BasicBrokerageDetails()),
                            ),
                            _buildOption(
                              icon: Icons.train,
                              label: "Trains",
                              // onTap: () => Get.to(() => PropertyDeposit()),
                            ),
                            _buildOption(
                              icon: Icons.hotel,
                              label: "Hotels",
                              // onTap: () => Get.to(() => LoanRepaymentView()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white38.withOpacity(0.9),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Travel Services",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildOption(
                              icon: Icons.local_taxi,
                              label: "Airport Cabs",
                              // onTap: () => Get.to(() => MobileRechargeView()),
                            ),
                            _buildOption(
                              icon: Icons.directions_train_sharp,
                              label: "Metro",
                              // onTap: () => Get.to(() => PropertyDeposit()),
                            ),
                            _buildOption(
                              icon: Icons.explore,
                              label: "Travel Activities",
                              // onTap: () => Get.to(() => BasicBrokerageDetails()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

Widget _buildOption({
  required IconData icon,
  required String label,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: Color(0xFF007f97),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
