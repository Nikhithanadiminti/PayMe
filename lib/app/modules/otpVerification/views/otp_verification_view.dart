import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/otp_verification_controller.dart';
class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify OTP',
          style: TextStyle(
            fontWeight: FontWeight.bold,  // Make the title bold
            fontSize: 24,  // You can also adjust the font size if needed
          ),
        ),
        centerTitle: false,
      ), // Remove the AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           // Space between title and text below

            // Instruction text
            Text(
              'Enter the OTP sent by PayMe to your number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),  // Space between instruction and OTP fields

            // OTP input fields (4 text fields)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),  // Space between OTP fields and button

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ProfileView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007f97),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}