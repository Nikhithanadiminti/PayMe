import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../otpVerification/views/otp_verification_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70),

                // // PhonePe Logo
                // Image.asset(
                //   'assets/images/payglogo.jpg',
                //   width: 50,
                //   height: 50,
                // ),
                // SizedBox(height: 10),

                // Heading
                Text(
                  'Log in to PayMe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                // Description
                Text(
                  'We will create an account if you don’t have one.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 30),

                // Mobile number input
                Text(
                  'Enter mobile number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 30),

                // Proceed button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // No functionality here, just UI part
                      Get.to(() => OtpVerificationView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF007f97),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Proceed',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(child: Container()),

                // Terms and Conditions text
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      // Use GetX to navigate to the Terms and Conditions page
                      // Get.to(() => TermsPage()); // Navigate to the Terms Page (replace with actual page)
                    },
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        children: [
                          TextSpan(
                            text:
                            'By proceeding, you are agreeing to PayMe\'s ',
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              color: Color(0xFF007f97), // Light blue color
                            ),
                          ),
                          TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFF007f97), // Light blue color
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

          // Help icon (already implemented)
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                print("Help Icon Pressed");
              },
              child: Icon(
                Icons.help_outline,  // Material Icon for Help
                size: 30,  // Set the size of the icon
                color: Colors.black,  // Set the color of the icon (you can change it as needed)
              ),
            ),
          )

        ],
      ),
    );
  }
}
