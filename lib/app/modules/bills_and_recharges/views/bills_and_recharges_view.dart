import 'package:demo_project/app/modules/credit_card_repayment/views/credit_card_repayment_view.dart';
import 'package:demo_project/app/modules/loan_repayment/views/loan_repayment_view.dart';
import 'package:demo_project/app/modules/mobile_recharge/views/mobile_recharge_view.dart';
import 'package:demo_project/app/modules/rent/views/rent_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../rent/views/broker_payment.dart';
import '../../rent/views/property_deposit.dart';
import '../../rent/views/society_maintenance.dart';
import '../controllers/bills_and_recharges_controller.dart';

class BillsAndRechargesView extends GetView<BillsAndRechargesController> {
  const BillsAndRechargesView({super.key});
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
        title: Text('Bills & Recharges',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF007f97),
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

              // Popular Section
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
                        "Popular",
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
                          icon: Icons.phone_iphone,
                          label: "Mobile\n Recharge",
                          onTap: () => Get.to(() => MobileRechargeView()),
                        ),
                        _buildOption(
                          icon: Icons.payment,
                          label: "FASTag\n Recharge",
                          // onTap: () => Get.to(() => BasicBrokerageDetails()),
                        ),
                        _buildOption(
                          icon: Icons.account_balance_wallet,
                          label: "DTH",
                          // onTap: () => Get.to(() => PropertyDeposit()),
                        ),
                        _buildOption(
                          icon: Icons.money,
                          label: "Loan\n Repayment",
                          onTap: () => Get.to(() => LoanRepaymentView()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Utilities Section
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
                        "Utilities",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOption(icon: Icons.home, label: "Rent",
                          onTap: () => Get.to(() => RentView()),),
                        _buildOption(icon: Icons.gas_meter, label: "Piped Gas"),
                        _buildOption(icon: Icons.water_drop, label: "Water"),
                        _buildOption(icon: Icons.electric_bolt, label: "Electricity"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOption(icon: Icons.phone_android, label: "PostPaid"),
                        _buildOption(icon: Icons.wifi, label: "Broadband \nLandline"),
                        _buildOption(icon: Icons.credit_card, label: "Credit Card\nPayment",
                          onTap: () => Get.to(() => CreditCardRepaymentView()),),
                        _buildOption(icon: Icons.local_gas_station, label: "Book a\nCylinder"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                        "Recharge",
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
                          icon: Icons.phone_iphone,
                          label: "Mobile\n Recharge",
                          onTap: () => Get.to(() => MobileRechargeView()),
                        ),
                        _buildOption(
                          icon: Icons.payment,
                          label: "FASTag\n Recharge",
                          // onTap: () => Get.to(() => BasicBrokerageDetails()),
                        ),
                        _buildOption(
                          icon: Icons.account_balance_wallet,
                          label: "DTH",
                          // onTap: () => Get.to(() => PropertyDeposit()),
                        ),
                        _buildOption(
                          icon: Icons.tv,
                          label: "Cable TV",
                          // onTap: () => Get.to(() => LoanRepaymentView()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Below the Recharge container
              SizedBox(height: 10),
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
                        "Entertainment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildEntertainmentOption(
                          imagePath: 'assets/images/hotstar.webp',
                          label: 'Hotstar',
                        ),
                        _buildEntertainmentOption(
                          imagePath: 'assets/images/zee5.jpeg',
                          label: 'Zee5',
                        ),
                        _buildEntertainmentOption(
                          imagePath: 'assets/images/sonyliv.jpg',
                          label: 'Sonyliv',
                        ),
                        _buildEntertainmentOption(
                          imagePath: 'assets/images/airtel_x.jpg',
                          label: 'Airtel\n Xstream',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
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
                        "Donations & Devotions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOption(
                          icon: Icons.favorite,
                          label: "Donate",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                        _buildOption(
                          icon: Icons.book,
                          label: "Devotion",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                        _buildOption(
                          icon: Icons.bed,
                          label: "Donate Blankets",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                        _buildOption(
                          icon: Icons.restaurant,
                          label: "Donate Meals",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),
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
                        "Financial Services & Taxes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOption(
                          icon: Icons.health_and_safety,
                          label: "LIC/\n Insurance",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                        _buildOption(
                          icon: Icons.business,
                          label: "Municipal Tax\n and Services",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                        _buildOption(
                          icon: Icons.calendar_today,
                          label: "Recurring Deposit",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                        _buildOption(
                          icon: Icons.security,
                          label: "NPS",
                          onTap: () {
                            // Get.to(()=>();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),
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
                        "More Services",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOption(icon: Icons.group, label: "Clubs and\n Associations",),
                        _buildOption(icon: Icons.apartment, label: "Apartments"),
                        _buildOption(icon: Icons.local_shipping, label: "Buy\n FASTag"),
                        _buildOption(icon: Icons.local_hospital, label: "Hospitals"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOption(icon: Icons.credit_card, label: "NCMC\n Recharge"),
                        _buildOption(icon: Icons.house_siding, label: "Rental"),
                        _buildOption(icon: Icons.school, label: "Education\n Fees"),
                        _buildOption(icon: Icons.credit_score, label: "Prepaid\n Meter"),
                      ],
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
}

Widget _buildEntertainmentOption({
  required String imagePath,
  required String label,
}) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 5),
      SizedBox(
        height: 50,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    ],
  );
}

