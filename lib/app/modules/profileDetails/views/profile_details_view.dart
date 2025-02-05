import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../addAddress/views/add_address_view.dart';
import '../../additionalDetails/views/additional_details_view.dart';
import '../../financialDetails/views/financial_details_view.dart';
import '../../profileEditDetails/views/profile_edit_details_view.dart';
import '../controllers/profile_details_controller.dart';

class ProfileDetailsView extends GetView<ProfileDetailsController> {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with the profile image
          SliverAppBar(
            expandedHeight: 200,
            floating: false, // AppBar will not float over the content
            pinned: true, // AppBar stays pinned at the top when the profile image scrolls out
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Profile Image
                  Positioned(
                    top: 70,
                    left: MediaQuery.of(context).size.width * 0.25,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.help_outline), // Help icon
                onPressed: () {
                  // Implement Help button functionality
                  // For example, show a dialog or navigate to a help page
                  print("Help button pressed");
                },
              ),
            ],
          ),

          // Below the SliverAppBar, the scrollable content area
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0), // Padding for first container
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the container
                    borderRadius: BorderRadius.circular(12), // Border radius for rounded corners
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
                      // Personal Details header with Edit and Camera icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Personal Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Color(0xFF007f97)),
                                onPressed: () {
                                  Get.to(() => ProfileEditDetailsView());// Implement Edit functionality
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.camera_alt, color: Color(0xFF007f97)),
                                onPressed: () {
                                  // Implement Camera functionality
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Full Name section
                      Row(
                        children: [
                          Text('JOHN DOE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),

                      // Phone Number section (no label, just the value)
                      Row(
                        children: [
                          Text('+123456789', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 8),

                      // Email section with a Verify button on the right
                      Row(
                        children: [
                          Text(
                            'johndoe@example.com',
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(child: SizedBox()), // This will take up the remaining space and push the button to the right
                          OutlinedButton(
                            onPressed: () {
                              // Implement Verify button functionality
                            },
                            child: Text('Verify', style: TextStyle(color: Color(0xFF007f97))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // New Container below the first one
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
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
                      SizedBox(height: 20),
                      _buildRow('Financial Details', 'Income, Employment details and more'),
                      _buildRow('Additional Details', 'Age, Gender and more', isLastRow: true),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0), // Padding for the second container
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Light shadow
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Saved Address" Heading
                      const Text(
                        'Saved Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16), // Space below the heading

                      // Dotted Border Container with + Icon and Add New Text
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Add Address screen when tapped
                          Get.to(() => AddAddressView());
                        },
                        child: DottedBorder(
                          color: Colors.grey, // Dotted border color
                          strokeWidth: 2, // Border width
                          dashPattern: const [6, 4], // Length of dashes and spaces
                          borderType: BorderType.RRect, // Rounded corners for the border
                          radius: const Radius.circular(8), // Rounded corners for the dashed border
                          child: Container(
                            width: 180.0, // Width of the dashed container
                            height: 100.0, // Height of the dashed container
                            padding: const EdgeInsets.all(16.0), // Padding inside the dashed container
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                              crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
                              children: [
                                Icon(
                                  Icons.add, // Add icon
                                  color: const Color(0xFF007f97), // Icon color
                                  size: 24, // Icon size
                                ),
                                const SizedBox(height: 8), // Space between icon and text
                                const Text(
                                  'Add New', // Text for the button
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF007f97), // Text color matching the icon
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Helper widget for the rows
  Widget _buildRow(String heading, String label, {bool isLastRow = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Expanded widget containing text and chevron icon
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4), // Space between title and label
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Color(0xFF007f97),
                      size: 30,
                    ),
                    onPressed: () {
                      // Navigate based on heading or label
                      if (heading == 'Financial Details') {
                        // Navigate to Financial Details screen
                        Get.to(() => FinancialDetailsView());
                      } else if (heading == 'Additional Details') {
                        // Navigate to Additional Details screen
                        Get.to(() => AdditionalDetailsView());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 14),
        if (!isLastRow)
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ),
        SizedBox(height: 8),
      ],
    );
  }
}
