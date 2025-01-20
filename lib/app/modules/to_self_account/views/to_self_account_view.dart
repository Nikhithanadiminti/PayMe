import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/to_self_account_controller.dart';

class ToSelfAccountView extends GetView<ToSelfAccountController> {
  const ToSelfAccountView({super.key});
  final String imagePath = ''; // Replace with dynamic path
  bool get imageExists => imagePath.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,), // Back icon
          onPressed: () {
            Get.back(); // Navigate back
          },
        ),
        title: const Text('Send To',style: TextStyle(color: Colors.white),), // Center title
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline,color: Colors.white,), // Information icon
            onPressed: () {
              // Handle info button click
            },
          ),
        ],
      ),

      body: Column(

        children: [
          // Scrollable content in a ListView
          Expanded(
            child: Container(

              color: Colors.grey[200], // Background color for the entire list
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 8, // Replace with dynamic item count
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Card content
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(10),

                        ),

                        margin: EdgeInsets.zero, // No extra margin for cards

                        child: Padding(
                          padding: const EdgeInsets.all(10.0), // Padding inside the card
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/icici logo.png', // Replace with your image path
                                ),
                                backgroundColor: Colors.blueAccent, // Optional fallback color
                                radius: 25.0,
                              ),
                              const SizedBox(width: 12.0), // Spacing between avatar and text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'XXXXXXX23910', // Replace with dynamic data
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    const Text(
                                      'ICICI BANK',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    const SizedBox(height: 2.0), // Space between subtitle and row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "CUDDAPAH",
                                          style: const TextStyle(color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  SizedBox(height: 16.0,),
                                    // Add a divider except for the last item
                                    if (index < 7) // Replace 7 with `itemCount - 1` for dynamic lists
                                      const Divider(
                                        height: 1,
                                        color: Colors.grey, // Divider color
                                        thickness: 0.5, // Divider thickness
                                      ),
                                  ],

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  );
                },
              ),
            ),
          ),


          // Add Bank Account Button at the bottom
          Container(

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Add Bank Account button click
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007f97), // Background color
                  ),
                  child: const Text(
                    'ADD NEW BANK ACCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ), // Text style
                  ),
                ),
              ),
            ),
          ),

          // Optional image at the bottom
          Image.asset(
            'assets/images/UPI.jpg', // Replace with your image path
            height: 30, // Desired height
            width: 50, // Desired width
          ),
        ],
      ),

    );
  }
}
