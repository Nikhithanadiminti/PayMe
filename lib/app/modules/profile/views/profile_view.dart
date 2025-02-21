import 'package:demo_project/app/modules/loan/views/loan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Login/views/login_view.dart';
import '../../autopay/views/autopay_view.dart';
import '../../bankaccounts/views/bankaccounts_view.dart';
import '../../creditlineonupi/views/creditlineonupi_view.dart';
import '../../debitandcreditcards/views/debitandcreditcards_view.dart';
import '../../international/views/international_view.dart';
import '../../phonepegiftcard/views/phonepegiftcard_view.dart';
import '../../phonepewallet/views/phonepewallet_view.dart';
import '../../profileDetails/views/profile_details_view.dart';
import '../../receivemoney/views/receivemoney_view.dart';
import '../../rupaycreditonupi/views/rupaycreditonupi_view.dart';
import '../../upilite/views/upilite_view.dart';
import '../../upisettings/views/upisettings_view.dart';
import '../controllers/profile_controller.dart';
//import '../controllers/receivemoney_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile and Payments',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF007f97),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(
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
      body: SingleChildScrollView( // This makes the body scrollable
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Container (Profile Info)
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
                    padding: EdgeInsets.all(18),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.orangeAccent[400],
                    ),
                    child: Center(
                      child: Text(
                        'J',  // Initial letter
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+1 234 567 890',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigate to the ProfileDetails page when clicked
                      Get.to(ProfileDetailsView());
                    },
                    child: Icon(
                      Icons.chevron_right,
                      color: Color(0xFF007f97),
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),  // Space between the containers

            // Second Container (Receive Money Info)
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
                  // Container for "Receive Money" text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receive Money',  // Text for the left side
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet,  // UPI ID icon
                            color: Color(0xFF007f97),  // Icon color
                            size: 20,  // Icon size
                          ),
                          SizedBox(width: 8),  // Space between icon and text
                          Text(
                            'UPI ID: 9876543210@ybl',  // Example UPI ID
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],  // Text color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigate to the ProfileDetails page when clicked
                      Get.to(ReceivemoneyView());
                    },
                    child: Icon(
                      Icons.chevron_right,
                      color: Color(0xFF007f97),
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Payment Methods Section
            Container(
              padding: const EdgeInsets.all(10.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading Text
                  Text(
                    'Payment Methods',  // Heading for Payment Methods
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),  // Space between heading and methods

                  // GridView for Payment Methods (4 items per row)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of items per row
                      // crossAxisSpacing: 16, // Space between columns
                      mainAxisSpacing: 16, // Space between rows
                    ),
                    itemCount: 7, // Total number of payment methods
                    itemBuilder: (context, index) {
                      final paymentMethods = [
                        {'icon': Icons.account_balance, 'label': 'Bank Accounts', 'screen': BankaccountsView()},
                        {'icon': Icons.credit_card, 'label': 'Debit & Credit Cards', 'screen': DebitandcreditcardsView()},
                        {'icon': Icons.phone_android, 'label': 'PayMe Wallet', 'screen': PhonepewalletView()},
                        {'icon': Icons.card_giftcard, 'label': 'PayMe Gift Card', 'screen': PhonepegiftcardView()},
                        {'icon': Icons.upgrade, 'label': 'UPI Lite', 'screen': UpiliteView()},
                        {'icon': Icons.credit_card_rounded, 'label': 'Rupay Credit on UPI', 'screen': RupaycreditonupiView()},
                        {'icon': Icons.local_atm, 'label': 'Credit Line on UPI', 'screen': CreditlineonupiView()},
                      ];

                      return PaymentMethodItem(
                        icon: paymentMethods[index]['icon'] as IconData,
                        label: paymentMethods[index]['label'] as String,
                        destination: paymentMethods[index]['screen'] as Widget,
                      );
                    },
                  ),
                ],
              ),
            ),
      SizedBox(height: 16),  // Space between sections

      // Payment Management Section
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading Text for Payment Management
            Text(
              'Payment Management',  // Heading for Payment Management
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),  // Space between heading and methods

            // GridView for Payment Management (3 items per row)
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of items per row for this section
                mainAxisSpacing: 16, // Space between rows
              ),
              itemCount: 3, // Total number of payment management options
              itemBuilder: (context, index) {
                final paymentManagementOptions = [
                  {'icon': Icons.autorenew, 'label': 'Auto Pay','screen': AutopayView()},
                  {'icon': Icons.language, 'label': 'International','screen': InternationalView()},
                  {'icon': Icons.settings, 'label': 'UPI Settings','screen': UpisettingsView()},
                ];

                return PaymentMethodItem(
                  icon: paymentManagementOptions[index]['icon'] as IconData,
                  label: paymentManagementOptions[index]['label'] as String,
                  destination: paymentManagementOptions[index]['screen'] as Widget,
                );
              },
            ),
          ],
        ),
      ),
            SizedBox(height: 16),
            // New container with PayMe Account Aggregator
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
                  // Left icon

                  Icon(
                      Icons.account_balance_wallet, // Example icon for account
                      color: Color(0xFF007f97),
                      size: 30, // Icon size
                    ),

                  SizedBox(width: 16), // Space between icon and text

                  // Expanded or Flexible widget to allow text wrapping
                  Expanded(  // This ensures the text can take up remaining space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'PayMe Account Aggregator', // Title text
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4), // Space between title and label

                        // Label Text wrapped to the next line if it exceeds width
                        Text(
                          'One place for all your linked accounts and consents', // Label text
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600], // Text color
                          ),
                          maxLines: 2, // Max 2 lines for the label
                          overflow: TextOverflow.ellipsis, // Handle long texts
                          softWrap: true,  // Enable text wrapping to the next line
                        ),
                      ],
                    ),
                  ),

                  // Chevron-right icon on the right side
                  Icon(
                    Icons.chevron_right, // Chevron-right icon
                    color: Color(0xFF007f97), // Icon color
                    size: 30, // Icon size
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Space between sections
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
                'Settings & Preferences',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // First Row
              _buildRow('Bill Notifications', 'REcieve alerts when bill is generated', Icons.notifications),

              // Second Row
              _buildRow('Permissions', 'Manage data sharing settings', Icons.account_circle),

              // Third Row
              _buildRow('Theme', 'Choose beyween light and dark mode', Icons.color_lens),

              // Fourth Row
              _buildRow('Reminders', 'Never miss another bill payment', Icons.access_alarm, isLastRow: true),
            ],
          ),
        ),
            SizedBox(height: 16),
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
                  // Security Section Title
                  Text(
                    'Security',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // First Row (Screen Lock)
                  _buildRow('Screen Lock', 'Biometric & Screen Locks', Icons.fingerprint),

                  // Second Row (Biometric & Screen Locks)
                  _buildRow('Change passcode', 'Reset your app passcode', Icons.key_outlined),

                  // Third Row (Blocked Contacts)
                  _buildRow('Blocked Contacts', 'View and manage blocked contacts', Icons.block_flipped, isLastRow: true),
                ],
              ),
            ),
            SizedBox(height: 16),
            // New container with PayMe Account Aggregator
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
                  // Left icon

                  Icon(
                    Icons.phone_android, // Example icon for account
                    color: Color(0xFF007f97),
                    size: 30, // Icon size
                  ),

                  SizedBox(width: 16), // Space between icon and text

                  // Expanded or Flexible widget to allow text wrapping
                  Expanded(  // This ensures the text can take up remaining space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'About PayMe', // Title text
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4), // Space between title and label

                        // Label Text wrapped to the next line if it exceeds width
                        Text(
                          'Privacy policy, Terms & About PayMe', // Label text
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600], // Text color
                          ),
                          maxLines: 2, // Max 2 lines for the label
                          overflow: TextOverflow.ellipsis, // Handle long texts
                          softWrap: true,  // Enable text wrapping to the next line
                        ),
                      ],
                    ),
                  ),

                  // Chevron-right icon on the right side
                  Icon(
                    Icons.chevron_right, // Chevron-right icon
                    color: Color(0xFF007f97), // Icon color
                    size: 30, // Icon size
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
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
              child: InkWell(
                onTap: () {
                  // Show the confirmation dialog when tapped
                  _showLogoutDialog(context);
                },
                child: Row(
                  children: [
                    // Left Icon for Logout
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(width: 16),
                    // Text widget for the "Logout" label
                    Text(
                      'LOGOUT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            )

            // Space between sections
      ],
      ),
    ),
    ),
    );
  }
}

class CreditloneonupiView {
}

// Custom widget for displaying Payment Method Items
class PaymentMethodItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget destination;

  const PaymentMethodItem({
    required this.icon,
    required this.label,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(destination); // Navigate to the destination screen
      },
    child: Column(
    children: [
        Icon(
          icon,  // Icon passed as parameter
          color: Color(0xFF007f97),  // Icon color
          size: 36,  // Icon size
        ),
        SizedBox(height: 8),  // Space between icon and label
        Text(
          label,  // Text for the payment method
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],  // Text color
          ),
          textAlign: TextAlign.center,  // Center the label text
  // Max 2 lines for the text
        ),
      ],
    ),
    );
  }
}

Widget _buildRow(String heading, String label, IconData icon, {bool isLastRow = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Row with first icon separated from the rest of the content
      Row(
        children: [
          // Left icon (separate)
          Icon(
            icon, // Use the passed dynamic icon here
            color: Color(0xFF007f97), // Icon color
            size: 30, // Icon size
          ),
          SizedBox(width: 16), // Space between icon and text

          // Expanded widget containing text and chevron icon
          Expanded(
            child: Row(
              children: [
                // Expanded section for the text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        heading, // Title text
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4), // Space between title and label

                      // Label Text wrapped to the next line if it exceeds width
                      Text(
                        label, // Label text
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600], // Text color
                        ),
                        maxLines: 2, // Max 2 lines for the label
                        overflow: TextOverflow.ellipsis, // Handle long texts
                        softWrap: true,  // Enable text wrapping to the next line
                      ),
                    ],
                  ),
                ),

                // Chevron-right icon on the right side
                Icon(
                  Icons.chevron_right, // Chevron-right icon
                  color: Color(0xFF007f97), // Icon color
                  size: 30, // Icon size
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 14),
      // Divider Line Below - This is shown only if it's not the last row
      if (!isLastRow)
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
      SizedBox(height: 16), // Space after the row (can adjust)
    ],
  );
}
// Method to show the logout confirmation dialog
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
                Get.to(LoginView()); // Print logout action
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






