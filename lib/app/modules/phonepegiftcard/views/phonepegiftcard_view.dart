import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phonepegiftcard_controller.dart';

class PhonepegiftcardView extends GetView<PhonepegiftcardController> {
  const PhonepegiftcardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("PhonePe Gift Card", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/gift_card.png', // Replace with actual image path
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total Cashback and Gift Card Balance",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹0",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Updated: 10 Feb 2025",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Refresh Balance",
                      style: TextStyle(color: Color(0xFF007f97), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add_circle_outline, color: Colors.black),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Claim Gift Card", style: TextStyle(color: Colors.black, fontSize: 16)),
                          Text("Use Card ID & PIN", style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "CLAIM NOW",
                      style: TextStyle(color: Color(0xFF007f97), fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF007f97),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: Text("BUY NEW CARD", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
