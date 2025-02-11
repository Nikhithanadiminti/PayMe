import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mutualfundloan_controller.dart';

class MutualfundloanView extends GetView<MutualfundloanController> {
  const MutualfundloanView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Against MF/Shares',
      theme: ThemeData(
        primaryColor: Color(0xFF007f97),
      ),
      home: LoanMFShareView(),
    );
  }
}

class LoanMFShareView extends StatelessWidget {
  const LoanMFShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        title: Text('Loan Against MF/Shares', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF007f97),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();  // This will go back to the previous screen using GetX
          },

        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // Loan Providers List
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/volt_money.png'), // Replace with correct icon
                    ),
                    title: Text('Volt Money', style: TextStyle(color: Colors.black)),
                    subtitle: Text('₹25K - ₹5 Cr. | 10.49% | Min ₹50K MF portfolio',
                        style: TextStyle(color: Colors.black54)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                    onTap: () {},
                  ),
                  Divider(color: Colors.black26),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/fibe.png'), // Replace with correct icon
                    ),
                    title: Text('Fibe', style: TextStyle(color: Colors.black)),
                    subtitle: Text('Get ₹15k to ₹10L in 10 mins | 2Mn+ Customers served',
                        style: TextStyle(color: Colors.black54)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          // Footer Text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Powered by PhonePe Lending Services Private Limited',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

