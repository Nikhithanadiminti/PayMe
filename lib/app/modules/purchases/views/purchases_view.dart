import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/purchases_controller.dart';

class PurchasesView extends GetView<PurchasesController> {
  const PurchasesView({super.key});

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
          'Purchases',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              // Get.to(() => PurchasesHelpView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(  // Added SingleChildScrollView for scrolling
        child: Column(
          children: [
            SizedBox(height: 10,),
            // Gold Container
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white38.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gold',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.savings, color: Color(0xFF007f97),),
                              SizedBox(width: 8),
                              Text(
                                'Daily Savings',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Save daily at ...',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '|',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFF007f97),),
                              SizedBox(width: 8),
                              Text(
                                'Digi Gold',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Invest in 24K ...',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            // In-App Purchases Container
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white38.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title at the top-left
                  const Text(
                    'In-App Purchases',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Store Option
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0), // Padding inside the border
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0), // Rounded edges for the border
                            ),
                            child: Image.asset(
                              'assets/images/app_store.jpg',
                              width: 32,
                              height: 32,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'App Store',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Slash Separator
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '|',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      // Google Play Option
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0), // Padding inside the border
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0), // Rounded edges for the border
                            ),
                            child: Image.asset(
                              'assets/images/google_play.jpg',
                              width: 32,
                              height: 32,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Google Play',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white38.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.0), // Rounded edges for the container
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Brand Vouchers",
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
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/nykaa.gif',
                        label: 'Nykaa',
                      ),
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/swiggy.png',
                        label: 'Swiggy',
                      ),
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/flipkart.png',
                        label: 'Flipkart',
                      ),
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/zepto.jpg',
                        label: 'Zepto',
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/amazon_shopping1.webp',
                        label: 'Amazon\n Shopping',
                      ),
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/myntra1.webp',
                        label: 'Myntra',
                      ),
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/bmw.jpg',
                        label: 'BMW',
                      ),
                      _buildBrandVouchersOption(
                        imagePath: 'assets/images/rapido.webp',
                        label: 'Rapido',
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

Widget _buildBrandVouchersOption({
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
