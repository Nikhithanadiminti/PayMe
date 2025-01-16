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
              Icons.more_vert,  // Material help icon
              color: Colors.white,  // Set icon color to white
            ),
            onPressed: () {
              // Define the action when the help icon is pressed
              print("Help Icon Pressed");
            },
          ),
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Padding for the body content
          child: Container(
            padding: const EdgeInsets.all(16.0), // Inner padding for the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color with some transparency
                  spreadRadius: 2, // How much the shadow spreads
                  blurRadius: 4, // The blur effect of the shadow
                  offset: Offset(0, 2), // Position of the shadow (x, y offset)
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title "Manage Data"
                Text(
                  'Manage Data',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16), // Space between title and label

                // Label text
                Text(
                  'This information will be used for personalizing your experience & services across PhonePe Platform.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600], // Grey color for label text
                  ),
                ),

                // Spacer for some vertical space
                SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16.0), // Inner padding for the new container
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
                      // Row layout for title, label, and image
                      Row(
                        children: [
                          // Left side: Title and label in separate lines, takes half of the screen width
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
                                SizedBox(height: 8), // Space between title and label
                                Text(
                                  'Verify your PAN once and enjoy seamless experience across PhonePe\'s financial products',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  softWrap: true, // Ensures text wraps
                                  maxLines: null,
                                ),
                              ],
                            ),
                          ),
                          // Right side: Image (fixed width)
                          SizedBox(
                            width: 50, // Fixed width for the image
                            height: 50, // Fixed height for the image
                            child: Image.asset(
                              'assets/your_image.png', // Replace with your image path
                              fit: BoxFit.contain, // Ensures the image fits within the box
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16), // Space between content and button

                      // Full-width "PAN Details" button
                      SizedBox(
                        width: double.infinity, // Full width for the button
                        child: ElevatedButton(
                          onPressed: () {
                            // Define your button action here
                          },
                          child: Text('Add PAN Details',
                            style: TextStyle(
                              fontSize: 16, // Set the font size if needed
                              color: Colors.white, // Set the text color (example: white)
                            ),),
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
                )

              ],
            ),
          ),
        )

    );
  }
}
