import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/creditscore_controller.dart';

class CreditscoreView extends GetView<CreditscoreController> {
  const CreditscoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Score',
      theme: ThemeData(
        primaryColor: Color(0xFF007f97),
      ),
      home: CreditScoreView(),
    );
  }
}

class CreditScoreView extends StatelessWidget {
  const CreditScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        title: Text('Credit Score', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF007f97),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Banner Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/credit_score_banner.png', // Replace with actual banner image
              fit: BoxFit.cover,
            ),
          ),
          // Title Text
          Text(
            'Why check your credit score on PhonePe',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'Limited period offer!',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          SizedBox(height: 20),
          // Features List
          Expanded(
            child: ListView(
              children: [
                _buildFeatureItem(Icons.monetization_on, 'Get personalised loan offers'),
                _buildFeatureItem(Icons.insights, 'Get summarised credit insights'),
                _buildFeatureItem(Icons.credit_score, 'No impact on your credit score'),
              ],
            ),
          ),
          // Footer Note
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Note: Bureau will fetch the credit score linked to your registered number.',
              style: TextStyle(color: Colors.white70, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          // Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text('Check Credit Score', style: TextStyle(color: Color(0xFF007f97), fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Icon(icon, color: Color(0xFF007f97)),
          title: Text(title, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}


