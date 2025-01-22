import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_address_controller.dart';

class AddAddressView extends StatelessWidget {
  // Using GetX controller to manage state
  final AddAddressController controller = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Address',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF007f97),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // House/Flat/Floor Number
                  const Text(
                    'House / Flat / Floor Number',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter House/Flat/Floor Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Complete Address
                  const Text(
                    'Complete Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Complete Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Landmark (optional)
                  const Text(
                    'Landmark (optional)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Landmark (optional)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Save As (Home, Work, Other)
                  const Text(
                    'Save As',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home Button
                      Obx(() {
                        return OutlinedButton.icon(
                          onPressed: () {
                            controller.selectAddress('Home');
                          },
                          icon: Icon(
                            Icons.home,
                            size: 20, // Increased icon size
                            color: controller.selectedAddress.value == 'Home'
                                ? Colors.white // Text color white when selected
                                : Color(0xFF007f97),// Icon color
                          ),
                          label: Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 16, // Increased text size
                              color: controller.selectedAddress.value == 'Home'
                                  ? Colors.white // Text color white when selected
                                  : Color(0xFF007f97),// Text color
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: controller.selectedAddress.value == 'Home'
                                ? Color(0xFF007f97)
                                : Colors.white,
                            side: const BorderSide(color: Color(0xFF007f97)), // Border color
                          ),
                        );
                      }),
                      // Work Button
                      Obx(() {
                        return OutlinedButton.icon(
                          onPressed: () {
                            controller.selectAddress('Work');
                          },
                          icon: Icon(
                            Icons.work,
                            size: 20, // Increased icon size
                            color: controller.selectedAddress.value == 'Work'
                                ? Colors.white // Text color white when selected
                                : Color(0xFF007f97), // Default icon color
                          ),
                          label: Text(
                            'Work',
                            style: TextStyle(
                              fontSize: 16, // Increased text size
                              color: controller.selectedAddress.value == 'Work'
                                  ? Colors.white // Text color white when selected
                                  : Color(0xFF007f97), // Default text color when not selected
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: controller.selectedAddress.value == 'Work'
                                ? Color(0xFF007f97) // Background color when selected
                                : Colors.white, // Default background when not selected
                            side: const BorderSide(color: Color(0xFF007f97)), // Border color
                          ),
                        );
                      }),

                      // Other Button
                      Obx(() {
                        return OutlinedButton.icon(
                          onPressed: () {
                            controller.selectAddress('Other');
                          },
                          icon: Icon(
                            Icons.location_on,
                            size: 20, // Increased icon size
                            color: controller.selectedAddress.value == 'Other'
                                ? Colors.white // Text color white when selected
                                : Color(0xFF007f97), // Icon color
                          ),
                          label: Text(
                            'Other',
                            style: TextStyle(
                              fontSize: 16, // Increased text size
                              color: controller.selectedAddress.value == 'Other'
                                  ? Colors.white // Text color white when selected
                                  : Color(0xFF007f97), // Text color
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: controller.selectedAddress.value == 'Other'
                                ? Color(0xFF007f97)
                                : Colors.white,
                            side: const BorderSide(color: Color(0xFF007f97)), // Border color
                          ),
                        );
                      }),
                    ],
                  ),



                  // Show additional input fields when Home button is selected
                  Obx(() {
                    if (controller.selectedAddress.value == 'Home') {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Mobile Number
                          const Text(
                            'Mobile Number',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Checkbox for Mark as your default address
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (bool? newValue) {},
                              ),
                              const Text(
                                'Mark as your default address',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return SizedBox.shrink(); // If not "Home", do not display extra fields
                  }),


                  // Show additional input fields when Home button is selected
                  Obx(() {
                    if (controller.selectedAddress.value == 'Work') {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Mobile Number
                          const Text(
                            'Mobile Number',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Checkbox for Mark as your default address
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (bool? newValue) {},
                                  activeColor: Color(0xFF007f97),
                              ),
                              const Text(
                                'Mark as your default address',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return SizedBox.shrink(); // If not "Home", do not display extra fields
                  }),


                  // Show additional input fields when Home button is selected
                  Obx(() {
                    if (controller.selectedAddress.value == 'Other') {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Mobile Number
                          const Text(
                            'Mobile Number',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Checkbox for Mark as your default address
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (bool? newValue) {},
                                activeColor: Color(0xFF007f97),
                              ),
                              const Text(
                                'Mark as your default address',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return SizedBox.shrink(); // If not "Home", do not display extra fields
                  }),
                ],
              ),
            ),
          ),

          // Footer with Cancel and Next buttons
          Container(
            width: double.infinity, // Ensure the footer takes full width
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                // Cancel Button with equal width, styled as text
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back(); // Navigate back to the previous screen
                    },
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 18, // Text size
                        color: Color(0xFF007f97), // Text color
                        fontWeight: FontWeight.bold, // Optional: make the text bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Space between the two buttons

                // Next Button with equal width
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality to save the address or move to the next screen
                      print('Next button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF007f97), // Set background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
