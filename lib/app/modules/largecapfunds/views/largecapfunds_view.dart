import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/largecapfunds_controller.dart';

class LargecapfundsView extends GetView<LargecapfundsController> {
  const LargecapfundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text('Large Cap Funds', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LARGE CAP FUNDS',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Invest in India's biggest companies",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Benefit from India's high growth potential. These funds invest in the top 100 companies in India.",
                    ),
                    SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Chip(label: Text('High Growth')),
                          SizedBox(width: 8),
                          Chip(label: Text('No Lock-in')),
                          SizedBox(width: 8),
                          Chip(label: Text('Ideal for 3+ years')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Shortlisted Funds',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              buildFundCard('ICICI Prudential Bluechip Fund', '14.94%', '₹100', '₹63,938.02Cr', 'assets/images/icici.png'),
              buildFundCard('Nippon India Large Cap Fund', '18.19%', '₹100', '₹35,313.47Cr', 'assets/images/nippon.png'),
              buildFundCard('HDFC Large Cap Fund', '15.14%', '₹100', '₹36,587.23Cr', 'assets/images/hdfc.png'),
              buildFundCard('Tata Large Cap Fund', '11.75%', '₹100', '₹2,435.51Cr', 'assets/images/tata.png'),
              buildFundCard('Aditya Birla Sun Life Frontline Equity Fund', '12.25%', '₹100', '₹29,323.24Cr', 'assets/images/aditya.png'),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All Large Cap Funds',
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFundCard(String title, String last3Y, String minInvest, String fundSize, String assetPath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(assetPath, width: 40, height: 40),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last 3Y', style: TextStyle(color: Colors.grey)),
                    Text(last3Y, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Min Invest.', style: TextStyle(color: Colors.grey)),
                    Text(minInvest, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fund Size', style: TextStyle(color: Colors.grey)),
                    Text(fundSize, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text('More Details', style: TextStyle(color: Colors.purple)),
            ),
          ],
        ),
      ),
    );
  }
}
