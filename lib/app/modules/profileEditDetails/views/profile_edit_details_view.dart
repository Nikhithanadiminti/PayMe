import 'package:demo_project/app/modules/profileDetails/views/profile_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_edit_details_controller.dart';

class ProfileEditDetailsView extends GetView<ProfileEditDetailsController> {
  const ProfileEditDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Details',
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
              Icons.help_outline,  // Material help icon
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name Section
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xFF007f97),
                  size: 35, // Increase the icon size (adjust as needed)
                ),
                const SizedBox(width: 20), // Increased space between the icon and the text field
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(color: Colors.grey, fontSize: 14), // Label color and size
                      border: InputBorder.none, // Removes the box border
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 1.0), // Line style
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 2.0), // Focused line style
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16), // Space between fields

            // Email Address Section
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Color(0xFF007f97),
                  size: 35, // Increased icon size
                ),
                const SizedBox(width: 20), // Increased space between the icon and the text field
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: const TextStyle(
                        color: Colors.grey, // Label color
                        fontSize: 14, // Font size of the label
                      ),
                      border: InputBorder.none, // Removes the box border
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 1.0), // Line style
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 2.0), // Focused line style
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24), // Space before the footer

// Update Changes Button (Full Width)
            Expanded(child: Container()), // Keeps button at the bottom of the screen

// Full-width button with no border radius
            SizedBox(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Handle the update logic here
                Get.to(ProfileDetailsView());
                },
                child: const Text(
                  'UPDATE CHANGES',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), // Vertical padding
                  backgroundColor: const Color(0xFF007f97), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No border radius
                  ),
                  minimumSize: Size(double.infinity, 48), // Ensure button stretches to full width and has height
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
