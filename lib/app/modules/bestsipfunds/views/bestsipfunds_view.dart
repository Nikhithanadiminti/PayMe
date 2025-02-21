import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bestsipfunds_controller.dart';

class BestsipfundsView extends GetView<BestsipfundsController> {
  const BestsipfundsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text('Best SIP Funds', style: TextStyle(color: Colors.white)),
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
                'BEST SIP FUNDS',
                style: TextStyle(color: Colors.purple, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Invest in Funds with strong SIP Performance',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Grow your money with Best SIP Funds. Ideal for long term investment.',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              SizedBox(height: 16),
              _buildTagRow(),
              SizedBox(height: 16),
              Text(
                'Shortlisted Funds',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'by PhonePe Research team.',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              SizedBox(height: 8),
              _buildFundCard('SBI Contra Fund', '21.53%', '₹41,906.90Cr', '₹500', 'assets/images/sbi.png'),
              _buildFundCard('ICICI Prudential Value Discovery Fund', '19.73%', '₹48,987.78Cr', '₹100', 'assets/images/icici.png'),
              _buildFundCard('Kotak Equity Opportunities Fund', '15.8%', '₹25,648.49Cr', '₹100', 'assets/images/kotak.png'),
              _buildFundCard('ICICI Prudential Value Discovery Fund', '17.54%', '₹84,640.59Cr', '₹1000', 'assets/images/ppfas.png'),
              _buildFundCard('HDFC Flexi Cap Fund', '20.84%', '₹66,304.16Cr', '₹100', 'assets/images/hdfc.png'),

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
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildFundCard(String title, String returnRate, String fundSize, String minInvest, String imagePath) {
    return Card(
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
                  Text('Equity: Contra', style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFundDetail('Last 3Y', returnRate),
                      _buildFundDetail('Min Invest.', minInvest),
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
