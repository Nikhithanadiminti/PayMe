import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/to_mobile_number_controller.dart';

class ToMobileNumberView extends GetView<ToMobileNumberController> {

  const ToMobileNumberView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Money',
        style: TextStyle(
          color: Colors.white
        )
        ),
        backgroundColor: Color(0xFF007f97),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        actions: [
          Row(
            children: [
              // Refresh Icon
              IconButton(
                onPressed: () {
                  // Refresh action
                },
                icon: const Icon(Icons.refresh),
              ),

              // Help Icon inside a Circle
              IconButton(
                onPressed: () {
                  // Help action (e.g., navigate to help page)
                },
                icon: const  Icon(
                    Icons.help_outline,  // Help icon inside the circle// Icon size
                  ),
                ),
            ],
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
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Container for the letter "J" with orange background
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFF007f97), // Light white background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.help_outline,
                size: 32,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Split expense',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Divide bills & pay (No daily limit!)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                // Add navigation logic here, if needed
                // Get.to(ProfileDetailsView());
              },
              child: Text(
                'Try Now',  // Replacing the arrow icon with the text 'Try Now'
                style: TextStyle(
                  color: Color(0xFF007f97),
                  fontSize: 16,  // Adjust font size as needed
                  fontWeight: FontWeight.bold,  // Optional: for emphasis
                ),
              ),
            ),
          ],
        ),
      ),


      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFFFFFF),
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
          children: contactDetails.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, String> contact = entry.value;
            bool isLast = index == contactDetails.length - 1;
            return _buildContactRow(
              contact['name']!,
              contact['label']!,
              contact['date']!,
              contact['image']!,
              isLast,
            );
          }).toList(),
        ),
      ),
    ]
    )
    ),
    );
  }
}
Widget _buildContactRow(String name, String label, String date, String imageAssetPath, bool isLast) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      children: [
        Row(
          children: [
            // Profile image
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imageAssetPath),
            ),
            SizedBox(width: 16),
            // Column for name and label
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,

                  ),
                ),
                SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Spacer(),
            // Date on the right side
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        // Add a divider only if it's not the last item
        if (!isLast)
          Divider(thickness: 1, color: Colors.grey[300], indent: 60), // Starts from the label's position
      ],
    ),
  );
}
final List<Map<String, String>> contactDetails = [
  {
    "name": "John Doe",
    "label": "Friend",
    "date": "20/01",
    "image": "assets/images/profile_image1.jpg"
  },
  {
    "name": "Jane Smith",
    "label": "Family",
    "date": "21/01",
    "image": "assets/images/profile_image.jpg"
  },
  {
    "name": "Alice Johnson",
    "label": "Work",
    "date": "22/01",
    "image": "assets/images/profile_image1.jpg"
  },
  {
    "name": "John Doe",
    "label": "Friend",
    "date": "20/01",
    "image": "assets/images/profile_image1.jpg"
  },
  {
    "name": "Jane Smith",
    "label": "Family",
    "date": "21/01",
    "image": "assets/images/profile_image.jpg"
  },
  {
    "name": "Alice Johnson",
    "label": "Work",
    "date": "22/01",
    "image": "assets/images/profile_image1.jpg"
  },
  {
    "name": "John Doe",
    "label": "Friend",
    "date": "20/01",
    "image": "assets/images/profile_image1.jpg"
  },
  {
    "name": "Jane Smith",
    "label": "Family",
    "date": "21/01",
    "image": "assets/images/profile_image.jpg"
  },
  {
    "name": "Alice Johnson",
    "label": "Work",
    "date": "22/01",
    "image": "assets/images/profile_image1.jpg"
  },
  // Add more contact entries as needed
];
