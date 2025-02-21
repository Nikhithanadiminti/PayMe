import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../loan/views/loan_view.dart';
import '../controllers/creditlineonupi_controller.dart';

class CreditlineonupiView extends GetView<CreditlineonupiController> {
  const CreditlineonupiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Credit Line on UPI', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [IconButton(icon: Icon(Icons.help_outline, color: Colors.white), onPressed: () {})],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Line linked with +91 9704444147',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You can link a credit line to UPI on PhonePe only once you have availed it from your bank.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Use a different mobile number',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search By Bank Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Popular Banks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBankIcon('assets/images/imsbi.png', 'State Bank of India'),
                _buildBankIcon('assets/images/icici logo.png', 'ICICI Bank'),
                _buildBankIcon('assets/images/axis logo.png', 'Axis Bank'),
              ],
            ),
            SizedBox(height: 20),
            Text('All Banks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: [
                  _buildBankListItem('assets/images/axis.png', 'Axis Bank Credit Line'),
                  _buildBankListItem('assets/images/bob.png', 'Bank of Baroda Credit Line'),
                  _buildBankListItem('assets/images/canara.png', 'Canara Bank Credit Line'),
                  _buildBankListItem('assets/images/cub.png', 'City Union Bank Credit Line'),
                  _buildBankListItem('assets/images/hdffc.png', 'HDFC Bank Credit Line'),
                  _buildBankListItem('assets/images/icici.png', 'ICICI Bank Credit Line'),
                  _buildBankListItem('assets/images/indian_bank.png', 'Indian Bank Credit Line'),
                  _buildBankListItem('assets/images/karnataka.png', 'Karnataka Bank Credit Line'),
                  _buildBankListItem('assets/images/pnb.png', 'Punjab National Bank Credit Line'),
                  _buildBankListItem('assets/images/sbi logo.png', 'State Bank of India Credit Line'),
                  _buildBankListItem('assets/images/hdffc.png', 'Tamilnad Mercantile Bank Credit Line'),
                ],
              ),
            ),
            Center(
              child: Text(
                'Your Bank Not Listed Here?',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/upi.png', height: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankIcon(String assetPath, String bankName) {
    return Column(
      children: [
        Image.asset(assetPath, height: 40),
        SizedBox(height: 5),
        Text(
          bankName,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBankListItem(String assetPath, String bankName) {
    return ListTile(
      leading: Image.asset(assetPath, height: 40),
      title: Text(bankName),
      onTap: () {},
    );
  }
}

