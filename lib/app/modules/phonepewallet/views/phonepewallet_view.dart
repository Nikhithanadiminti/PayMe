import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phonepewallet_controller.dart';

class PhonepewalletView extends GetView<PhonepewalletController> {
  const PhonepewalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/images/wallet.png', // Replace with actual image path
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Choose your Wallet",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _walletOption(
              title: "Max balance: ₹2 Lakh",
              subtitle: "Needs simple video verification",
              isSelected: true,
            ),
            SizedBox(height: 10),
            _walletOption(
              title: "Max balance: ₹10,000",
              subtitle: "Needs Govt. ID number",
              isSelected: false,
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF007f97),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: Text("Get Started"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _walletOption({
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

