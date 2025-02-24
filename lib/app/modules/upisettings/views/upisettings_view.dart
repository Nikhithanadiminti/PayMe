import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/upisettings_controller.dart';

class UpisettingsView extends GetView<UpisettingsController> {
  const UpisettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text('UPI Settings',style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUpiSection('@ybl', 'YES BANK', [
                buildUpiItem('vydapadmavathi@ybl', 'Kotak Mahindra Bank', '8419', Icons.account_balance),
                buildUpiItem('vyda.padmavathi@ybl', 'Axis Bank', '1184', Icons.account_balance),
                buildUpiItem('9704444147-2@ybl', 'ICICI Bank', 'XX40', Icons.account_balance),
              ]),
              SizedBox(height: 20),
              buildUpiSection('@ibl', 'ICICI Bank', [
                buildUpiItem('vydapadmavathi@ibl', 'Kotak Mahindra Bank', '8419', Icons.account_balance, isActivatable: true),
                buildUpiItem('vyda.padmavathi@ibl', 'Axis Bank', '1184', Icons.account_balance),
                buildUpiItem('9704444147-2@ibl', 'ICICI Bank', 'XX40', Icons.account_balance),
              ]),
              SizedBox(height: 20),
              buildUpiSection('@axl', 'AXIS BANK', [
                buildUpiItem('vydapadmavathi@axl', 'Kotak Mahindra Bank', '8419', Icons.account_balance),
                buildUpiItem('vyda.padmavathi@axl', 'Axis Bank', '1184', Icons.account_balance),
                buildUpiItem('9704444147-2@axl', 'ICICI Bank', 'XX40', Icons.account_balance),
              ]),
              SizedBox(height: 20),
              buildPrimaryUpiDisplay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUpiSection(String upiProvider, String bankName, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              upiProvider,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF007f97)),
            ),
            SizedBox(height: 8),
            Column(children: children),
          ],
        ),
      ),
    );
  }

  Widget buildUpiItem(String upiId, String bankName, String lastDigits, IconData icon, {bool isActivatable = false}) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF007f97)),
      title: Text(upiId, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$bankName - $lastDigits'),
      trailing: isActivatable ? Text('ACTIVATE', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)) : null,
    );
  }

  Widget buildPrimaryUpiDisplay() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UPI ID to display on Home',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_balance, color: Color(0xFF007f97)),
                        SizedBox(width: 8),
                        Text('Kotak Mahindra Bank - 8419', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('vydapadmavathi@ybl', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.edit, color: Color(0xFF007f97)),
              ],
            ),
            //SizedBox(height: 10),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Use your PhonePe UPI ID on PhonePe'
                ),
                Switch(value: false, onChanged: (value) {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

