import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bikeloan_controller.dart';

class BikeloanView extends GetView<BikeloanController> {
  const BikeloanView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bike Loan App',
      theme: ThemeData(
        primaryColor: Color(0xFF007f97),
      ),
      home: BikeLoanView(),
    );
  }
}

class BikeLoanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        title: Text('Bike Loan', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF007f97),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
          // Banner Section
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/bike_loan_banner.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          // Loan Providers List
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/lt_finance.png'), // Replace with correct icon
                  ),
                  title: Text('L&T Finance', style: TextStyle(color: Colors.white)),
                  subtitle: Text('₹2199 EMI | Instant approval', style: TextStyle(color: Colors.white70)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  onTap: () {},
                ),
                Divider(color: Colors.white54),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/hero_ fincorp.png'), // Replace with correct icon
                  ),
                  title: Text('Hero Fincorp', style: TextStyle(color: Colors.white)),
                  subtitle: Text('6.99% | Instant approval', style: TextStyle(color: Colors.white70)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  onTap: () {},
                ),
              ],
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


