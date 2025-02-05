import 'package:demo_project/app/modules/add_upi_id/views/add_upi_id_view.dart';
import 'package:demo_project/app/modules/add_upi_number/views/add_upi_number_view.dart';
import 'package:demo_project/app/modules/select_receiver_bank_account/views/select_receiver_bank_account_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/to_bank_upi_id_controller.dart';

class ToBankUpiIdView extends GetView<ToBankUpiIdController> {
  const ToBankUpiIdView({super.key});
  final String imagePath = ''; // Replace with dynamic path
  bool get imageExists => imagePath.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF007f97),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back ,color: Colors.white,), // Back icon
            onPressed: () {
              Get.back(); // Navigate back
            },
          ),
          title: const Text('Transfer Money',style: TextStyle(color: Colors.white),), // Center title
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

            // Search Input Field
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF007f97)),
                    hintText: 'Search Bank Account, UPI ID',
                    hoverColor: Colors.white, // Set hover color here
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFF007f97), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFF007f97).withOpacity(0.6), width: 2),
                    ),
                  ),
                ),

              ),
            ),

            // TabBar
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Color(0xFF007f97),
                unselectedLabelColor: Colors.black,
                //labelStyle: TextStyle(),
                indicatorColor: Color(0xFF007f97),
                indicatorWeight: 3.0,
                tabs: [
                  Tab(text: '     ' 'BANK\nACCOUNTS',),
                  Tab(text: 'UPI ID'),
                  Tab(text: 'UPI NUMBER'),
                ],
              ),
            ),

            // TabBarView Content
            Expanded(

              child: TabBarView(
                children: [

              Container(
              color: Colors.white,
                child: Column(

                children: [
                // Expanded ListView for dynamic items
                Expanded(
                child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 8, // Replace with your dynamic item count
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0), // Padding inside the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                        CircleAvatar(
                              backgroundImage: AssetImage(
                                imageExists ? 'assets/images/sbi logo.png' : 'assets/images/sbi logo.png',
                              ),
                              backgroundColor: Colors.blueAccent, // Optional fallback color
                              radius: 20.0,
                            ),
                            const SizedBox(width: 12.0), // Spacing between avatar and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deekay Automotives', // Replace with dynamic data
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  const Text(
                                    'State Bank of India..3010',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  const SizedBox(height: 2.0), // Space between subtitle and row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sent: 50,000",
                                        style: const TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.more_vert), // Three-dot menu icon
                                  onSelected: (value) {
                                    // Handle navigation based on the selected item
                                    switch (value) {
                                      case 'View History':
                                      // Get.to(() => ViewHistoryScreen()); // Replace with your screen
                                        break;
                                      case 'Add Shortcut':
                                      // Get.to(() => AddShortcutScreen()); // Replace with your screen
                                        break;
                                      case 'Edit':
                                      // Get.to(() => EditScreen()); // Replace with your screen
                                        break;
                                      case 'Remove':
                                      // Get.to(() => RemoveScreen()); // Replace with your screen
                                        break;
                                      case 'Share':
                                      // Get.to(() => ShareScreen()); // Replace with your screen
                                        break;
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                    // View History
                                    PopupMenuItem<String>(
                                      value: 'View History',
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Row(
                                            children: [
                                              Icon(Icons.history, color: Colors.white),
                                              SizedBox(width: 8),
                                              Text(
                                                'View History',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.grey, thickness: 1), // Underline
                                        ],
                                      ),
                                    ),
                                    // Add Shortcut
                                    PopupMenuItem<String>(
                                      value: 'Add Shortcut',
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Row(
                                            children: [
                                              Icon(Icons.arrow_forward, color: Colors.white),
                                              SizedBox(width: 8),
                                              Text(
                                                'Add Shortcut',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.grey, thickness: 1), // Underline
                                        ],
                                      ),
                                    ),
                                    // Edit
                                    PopupMenuItem<String>(
                                      value: 'Edit',
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Row(
                                            children: [
                                              Icon(Icons.edit, color: Colors.white),
                                              SizedBox(width: 8),
                                              Text(
                                                'Edit',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.grey, thickness: 1), // Underline
                                        ],
                                      ),
                                    ),
                                    // Remove
                                    PopupMenuItem<String>(
                                      value: 'Remove',
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Row(
                                            children: [
                                              Icon(Icons.delete, color: Colors.white),
                                              SizedBox(width: 8),
                                              Text(
                                                'Remove',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.grey, thickness: 1), // Underline
                                        ],
                                      ),
                                    ),
                                    // Share
                                    PopupMenuItem<String>(
                                      value: 'Share',
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Row(
                                            children: [
                                              Icon(Icons.share, color: Colors.white),
                                              SizedBox(width: 8),
                                              Text(
                                                'Share',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                  color: const Color(0xFF1E1E2E), // Background color of the dropdown menu
                                ),

                                Text(
                                  "23 Mar 2024",
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                            ),
                    ),
                    // Add Bank Account Button at the bottom
                  Container(
                    color: Colors.transparent, // Make the container transparent
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(SelectReceiverBankAccountView());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF007f97), // Set the background color
                          ),
                          child: const Text(
                            'Add Bank Account',
                            style: TextStyle(color: Colors.white,fontSize: 16),
                            // Set text color

                          ),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/UPI.jpg', // Replace with your image path
                    height: 30, // Set desired height
                    width: 50, // Set desired width
                  ),

                ],
                    ),
              ),

                 Container(
                   color: Colors.white,
                   child: Column(
                      children: [
                        // Dynamic list of records with dividers
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            itemCount: 8, // Replace with your dynamic item count
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  // Single record item
                                  Row(
                                    children: [
                                      // Leading profile icon
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                          imageExists ? 'assets/images/axis logo.png' : 'assets/images/axis logo.png',
                                        ),
                                        backgroundColor: Colors.blueAccent, // Optional fallback color
                                        radius: 20.0,
                                      ),
                                      const SizedBox(width: 16.0),
                                      // Bank account details
                                      Expanded(
                                        child:
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Kiran kumar', // Replace with dynamic data
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Spacer(),


                              PopupMenuButton<String>(
                              icon: const Icon(Icons.more_vert), // Three-dot menu icon
                              onSelected: (value) {
                              // Handle navigation based on the selected item
                              switch (value) {
                              case 'View History':
                              // Get.to(() => ViewHistoryScreen()); // Replace with your screen
                              break;
                              case 'Add Shortcut':
                              // Get.to(() => AddShortcutScreen()); // Replace with your screen
                              break;
                                case 'Block':
                                // Get.to(() => AddShortcutScreen()); // Replace with your screen
                                  break;
                              case 'Edit':
                              // Get.to(() => EditScreen()); // Replace with your screen
                              break;
                              case 'Remove':
                              // Get.to(() => RemoveScreen()); // Replace with your screen
                              break;
                              case 'Share':
                              // Get.to(() => ShareScreen()); // Replace with your screen
                              break;
                              }
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                              // View History
                              PopupMenuItem<String>(
                              value: 'View History',
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Row(
                              children: [
                              Icon(Icons.history, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                              'View History',
                              style: TextStyle(color: Colors.white),
                              ),
                              ],
                              ),
                              Divider(color: Colors.grey, thickness: 1), // Underline
                              ],
                              ),
                              ),
                              // Add Shortcut
                              PopupMenuItem<String>(
                              value: 'Add Shortcut',
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Row(
                              children: [
                              Icon(Icons.arrow_forward, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                              'Add Shortcut',
                              style: TextStyle(color: Colors.white),
                              ),
                              ],
                              ),
                              Divider(color: Colors.grey, thickness: 1), // Underline
                              ],
                              ),
                              ),

                                PopupMenuItem<String>(
                                  value: 'Block',
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Row(
                                        children: [
                                          Icon(Icons.block, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            'Block',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.grey, thickness: 1), // Underline
                                    ],
                                  ),
                                ),
                              // Edit
                              PopupMenuItem<String>(
                              value: 'Edit',
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Row(
                              children: [
                              Icon(Icons.edit, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                              ),
                              ],
                              ),
                              Divider(color: Colors.grey, thickness: 1), // Underline
                              ],
                              ),
                              ),
                              // Remove
                              PopupMenuItem<String>(
                              value: 'Remove',
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Row(
                              children: [
                              Icon(Icons.delete, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                              'Remove',
                              style: TextStyle(color: Colors.white),
                              ),
                              ],
                              ),
                              Divider(color: Colors.grey, thickness: 1), // Underline
                              ],
                              ),
                              ),
                              // Share
                              PopupMenuItem<String>(
                              value: 'Share',
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Row(
                              children: [
                              Icon(Icons.share, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                              'Share',
                              style: TextStyle(color: Colors.white),
                              ),
                              ],
                              ),

                              ],
                              ),
                              ),
                              ],
                              color: const Color(0xFF1E1E2E), // Background color of the dropdown menu
                              ),



                              ],
                                            ),
                                            const Text(
                                              'obulakirankumar@ybl', // Replace with dynamic details
                                              style: TextStyle(color: Colors.black54),
                                            ),
                                            if (index < 9) // Avoid showing divider for the last record
                                              const Divider(
                                                thickness: 0.4,
                                                height: 16,
                                                color: Colors.grey,
                                              ),
                                          ],
                                        ),
                                      ),
                                      // Three dots menu

                                    ],
                                  ),
                                  // Divider below each record

                                ],
                              );
                            },
                          ),
                        ),
                        // Add Bank Account Button at the bottom
                        Container(
                          color: Colors.transparent, // Make the container transparent
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                 Get.to(AddUpiIdView());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF007f97), // Set the background color
                                ),
                                child: const Text(
                                  'Add UPI ID',
                                  style: TextStyle(color: Colors.white,fontSize: 16), // Set text color
                                ),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/UPI.jpg', // Replace with your image path
                          height: 30, // Set desired height
                          width: 50, // Set desired width
                        ),
                      ],
                    ),
                 ),


                  Container(
                    color: Colors.white, // Background color of the container
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end, // Center content vertically
                      children: [
                        // Image
                        Image.asset(
                          'assets/images/send money using Upi.jpg', // Replace with your image path
                          height: 200, // Set desired height
                          width: 250, // Set desired width
                        ),

                        // Text
                        const SizedBox(height: 16), // Spacing
                        const Text(
                          'Send money using UPI Number',
                          style: TextStyle(
                            fontSize: 18, // Font size
                            fontWeight: FontWeight.bold, // Bold text
                            color: Colors.black, // Text color
                          ),
                        ),

                        // Buttons
                        const SizedBox(height: 16), // Spacing
                        Container(
                          color: Colors.transparent, // Make the container transparent
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                              Get.to(AddUpiNumberView());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF007f97), // Set the background color
                                minimumSize: Size(200, 50), // Set width and height
                              ),
                              child: const Text(
                                'ADD UPI NUMBER',
                                style: TextStyle(color: Colors.white, fontSize: 16), // Set text color
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),


                        Image.asset(
                          'assets/images/UPI.jpg', // Replace with your image path
                          height: 30, // Set desired height
                          width: 50, // Set desired width
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),

            // Add Bank Account Button

          ],
        ),
      ),
    );
  }
}
