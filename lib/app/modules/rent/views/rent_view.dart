import 'package:demo_project/app/modules/rent/views/home_shop_rent.dart';
import 'package:demo_project/app/modules/rent/views/property_deposit.dart';
import 'package:demo_project/app/modules/rent/views/rent_help_view.dart';
import 'package:demo_project/app/modules/rent/views/society_maintenance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rent_controller.dart';
import 'broker_payment.dart';

class RentView extends GetView<RentController> {
  const RentView({super.key});

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
          'Rent',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Get.to(() => RentHelpView());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/credit_card_repayment2.webp",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Recents Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white38.withOpacity(0.9),
              ),
              child: Column(
                children: [
                   Row(
                      children: const [
                        Text(
                          "Recent Payments",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
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
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/profile_image.png",
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            title: const Text("house"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Home/Shop/Rent"),
                              ],
                            ),
                            trailing: const Icon(Icons.more_vert),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
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
                        "Pay for Rentals",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home/Shop Rent Option
                      GestureDetector(
                        onTap: () {
                          // Navigate to BasicRentDetails screen using Get.to()
                          Get.to(() => BasicRentDetails());
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.home, // Home icon
                              size: 50,
                              color: Color(0xFF007f97),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Home/\nShop Rent",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),

                      // Broker Payment Option
                      GestureDetector(
                        onTap: () {
                          // Navigate to BasicRentDetails screen using Get.to()
                          Get.to(() => BasicBrokerageDetails());
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.payment, // Home icon
                              size: 50,
                              color: Color(0xFF007f97),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Broker\n Payment",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      // Property Deposit Option
                      GestureDetector(
                        onTap: () {
                          // Navigate to BasicRentDetails screen using Get.to()
                          Get.to(() => PropertyDeposit());
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.account_balance_wallet, // Home icon
                              size: 50,
                              color: Color(0xFF007f97),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Property\n Deposit",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      // Society Maintenance Option
                      GestureDetector(
                        onTap: () {
                          // Navigate to BasicRentDetails screen using Get.to()
                          Get.to(() => SocietyMaintenance());
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.house, // Home icon
                              size: 50,
                              color: Color(0xFF007f97),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Society\n Maintenance",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
