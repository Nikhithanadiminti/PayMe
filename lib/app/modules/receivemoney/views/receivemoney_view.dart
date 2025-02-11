import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/receivemoney_controller.dart';

class ReceivemoneyView extends GetView<ReceivemoneyController> {
  const ReceivemoneyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text('Receive Money', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
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
            Text('From any UPI app',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 _buildIcon('assets/images/phonepe.png'),
                _buildIcon('assets/images/bhim.png'),
                 _buildIcon('assets/images/gpay.png'),
                 _buildIcon('assets/images/paytm.png'),

              ],
            ),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Image.asset('assets/images/kotaak.png', width: 40),
                title: Text('Kotak Mahi...ank - 8419',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Primary',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
            SizedBox(height: 16),
            Image.asset('assets/images/qr_code.png', width: 200, height: 200),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTextButton(Icons.share, 'SHARE QR'),
                _buildTextButton(Icons.download, 'DOWNLOAD QR'),
              ],
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('UPI IDs and Numbers',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 8),
            _buildUpiTile('vydapadmavathi@ybl', true),
            _buildUpiTile('vydapadmavathi@axl', false),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.asset(assetPath, width: 40, height: 40),
    );
  }

  Widget _buildTextButton(IconData icon, String text) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildUpiTile(String upiId, bool isPrimary) {
    return Card(
      color: Colors.white24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(upiId, style: TextStyle(color: Colors.white)),
        subtitle: isPrimary
            ? Text('Displayed on home',
            style: TextStyle(color: Colors.white70, fontSize: 12))
            : null,
        trailing: Icon(Icons.copy, color: Colors.white),
      ),
    );
  }
}

