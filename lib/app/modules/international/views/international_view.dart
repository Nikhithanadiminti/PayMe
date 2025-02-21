import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/international_controller.dart';

class InternationalView extends GetView<InternationalController> {
  const InternationalView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text('International',style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "International payments, made easy!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UPI now live in UAE",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/uae.png',
                      width: 100,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset('assets/images/upi_icon.png', width: 50),
                            SizedBox(height: 8),
                            Text("UPI International", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("in 6+ countries"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset('assets/images/money.png', width: 50),
                            SizedBox(height: 8),
                            Text("Receive Money", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("From Singapore"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "ACROSS THE GLOBE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildVideoCard('assets/images/phonepe_nri.png', "PhonePe for NRIs"),
                    _buildVideoCard('assets/images/global_upi.png', "UPI Goes Global"),
                    _buildVideoCard('assets/images/money_abroad.png', "Receive Money from Abroad"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "International STORIES",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              SizedBox(height: 16),
              _buildStoryCard('assets/images/uae_story.png', "Discover UAE with PhonePe | Pay with NeoPay & Network international"),
              _buildStoryCard('assets/images/srilanka_story.png', "Experience the beauty of Sri Lanka with PhonePe"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoCard(String assetPath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(assetPath, width: 100, height: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildStoryCard(String assetPath, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(assetPath, width: double.infinity, height: 150, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
