import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/financial_details_controller.dart';

class FinancialDetailsView extends GetView<FinancialDetailsController> {
  const FinancialDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Financial Details',
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,  // Three vertical dots icon
              color: Colors.white,  // Set icon color to white
            ),
            onPressed: () {
              // Show bottom sheet using GetX when the more icon is pressed
              Get.bottomSheet(
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,  // To ensure the bottom sheet's height is just enough for content
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.delete,  // Delete icon
                          color: Colors.grey,
                          size: 30,// Set color to red for the delete icon
                        ),
                        title: Text(
                          'Delete All',  // Text next to the delete icon
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,// Text color to match the delete icon
                          ),
                        ),
                        onTap: () {
                          // Add your action for "Delete All" here
                          _showLogoutDialog(context);
                          // Get.back();  // Close the bottom sheet when an item is tapped
                        },
                      ),
                    ],
                  ),
                ),
                isDismissible: true, // Allow dismissing the bottom sheet by tapping outside of it
                backgroundColor: Colors.white, // Background color of the bottom sheet
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Padding around the scrollable area
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Container: "Verify PAN Details"
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manage Data',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This information will be used for personalizing your experience & services across PhonePe Platform.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Verify PAN Details',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Verify your PAN once and enjoy seamless experience across PhonePe\'s financial products',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'assets/your_image.png', // Replace with your image path
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Add PAN Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: Color(0xFF007f97),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  // Second Container: "Financial Information"
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Financial Information Title
                        Text(
                          'Financial Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Divider(thickness: 1.5, color: Colors.grey[400]),
                        SizedBox(height: 16),

                        // First Row - House Ownership
                        _buildRow('House Ownership', 'Do you own or rent your current residence?'),
                        _buildRow('Car Ownership', 'Do you own a car?'),
                        _buildRow('2-Wheeler Ownership', 'Do you own a 2-Wheeler?'),
                        _buildRow('Annual Income', 'Please tell us your annual income.'),
                        _buildRow('Occupation', 'What is your occupation?'),
                        _buildRow('Earning Members', 'Who are the earning member(s) in your family?'),
                        _buildRow('Insurances', 'What insurance policies have you purchased?'),
                        _buildRow('Investments', 'Where do you prefer investing?'),

                        // Additional rows can follow the same pattern
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String heading, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading, // Title (e.g., 'House Ownership')
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4), // Space between title and label
                  Text(
                    label, // Label (e.g., 'Do you own or rent your current residence?')
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    overflow: TextOverflow.ellipsis, // This will make long text truncated with ellipsis
                    maxLines: 1, // This ensures that the text stays on a single line
                  )

                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // Define your button action here
                print('$heading Add button pressed');
              },
              child: Text(
                'Add', // Button text
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF007f97), // Button text color, matches the outline color
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                  color: Color(0xFF007f97), // Outline color
                  width: 1, // Outline width
                ),
              ),
            )

          ],
        ),
        SizedBox(height: 14),
        // Divider Line Below
        Divider(
          color: Colors.grey[300],
          thickness: 2,
          indent: 0, // Ensures divider starts from the left edge
          endIndent: 0, // Ensures divider ends at the right edge
        ),
        SizedBox(height: 16), // Space after each row
      ],
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  Get.dialog(
    AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to end the session?',  // Title text
            style: TextStyle(
              fontSize: 16,  // Reduced font size for title
              fontWeight: FontWeight.w500,  // Adjusted font weight
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),  // Space between title and the divider
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),  // Reduced radius for a compact shape
      ),
      contentPadding: EdgeInsets.zero,  // Removing default padding for a cleaner look
      actionsPadding: EdgeInsets.zero,  // Removing extra padding between buttons
      actions: [
        Row(
          children: [
            // Cancel Button
            InkWell(
              onTap: () {
                // Close the dialog when Cancel is pressed
                Get.back();
              },
              child: Container(
                width: 150,  // Set fixed width for Cancel button
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Text(
                    'CANCEL',  // Cancel button text
                    style: TextStyle(
                      color: Color(0xFF007f97),  // Grey text color for Cancel
                      fontSize: 16,  // Button font size
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                // Logout logic can be added here
                // Get.to(LoginView()); // Print logout action
              },
              child: Container(
                width: 150,  // Set fixed width for Confirm button
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Text(
                    'CONFIRM',  // Confirm button text
                    style: TextStyle(
                      color: Color(0xFF007f97),  // Red color for Confirm button
                      fontSize: 16,  // Button font size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    barrierDismissible: false,  // Prevent dialog from being dismissed outside
  );
}

