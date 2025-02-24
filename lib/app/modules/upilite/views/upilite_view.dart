import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upilite_controller.dart';

class UpiliteView extends GetView<UpiliteController> {
  const UpiliteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("UPI Lite", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/upi_banner.png"), // Add banner image
                    SizedBox(height: 10),
                    Text(
                      "100% acceptance like UPI",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Works even when your bank is down",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Cashback Promo Section
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_offer, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Upto ₹100 Cashback*",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("View T&C", style: TextStyle(color: Color(0xFF007f97), fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("Upto ₹100 cashback* on Meesho transaction via PhonePe UPI Lite"),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Add Money Section
              Text("Add money", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "₹ ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Quick Amount Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickAmountButton("₹200"),
                  _quickAmountButton("₹1,000", isPopular: true),
                  _quickAmountButton("₹2,000"),
                ],
              ),
              SizedBox(height: 16),

              // Add Money Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF007f97),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: Text("Add Money", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              SizedBox(height: 12),

              // T&C Agreement
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "By continuing, you agree to ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "PhonePe T&C",
                        style: TextStyle(color: Color(0xFF007f97), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAmountButton(String amount, {bool isPopular = false}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(amount, style: TextStyle(fontSize: 16)),
        ),
        if (isPopular)
          Positioned(
            top: -10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text("Popular", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ),
      ],
    );
  }
}