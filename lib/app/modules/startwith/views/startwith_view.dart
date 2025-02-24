import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/startwith_controller.dart';

class StartwithView extends GetView<StartwithController> {
  const StartwithView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text('Start with ₹100', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
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
              Text(
                'Top mutual funds to invest with just 100',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Start small build big. Ideal for investors who are looking to start small.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 16),
              _buildTagRow(),
              SizedBox(height: 16),
              _buildFundCard('ICICI Prudential Large & Mid Cap Fund', '20.21%', '₹17,694.45Cr', 'assets/images/icici.png'),
              _buildFundCard('Axis Growth Opportunities Fund', '13.9%', '₹14,007.12Cr', 'assets/images/axis.png'),
              _buildFundCard('Tata Large & Mid Cap Fund', '14.14%', '₹8,244.61Cr', 'assets/images/tata.png'),
              _buildFundCard('HDFC Flexi Cap Fund', '20.98%', '₹66,304.16Cr', 'assets/images/hdfc.png'),
              _buildFundCard('Aditya Birla Sun Life Pure Value Fund', '17.76%', '₹6,377.82Cr', 'assets/images/aditya.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTagRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTag('High Growth'),
        _buildTag('No Lock-in'),
        _buildTag('Ideal for 3+ years'),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildFundCard(String title, String returnRate, String fundSize, String imagePath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Equity: Large & Mid Cap', style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFundDetail('Last 3Y', returnRate),
                      _buildFundDetail('Min Invest.', '₹100'),
                      _buildFundDetail('Fund Size', fundSize),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFundDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.black54, fontSize: 12)),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
