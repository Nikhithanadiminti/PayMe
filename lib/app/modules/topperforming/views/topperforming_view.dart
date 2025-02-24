import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/topperforming_controller.dart';

class TopperformingView extends GetView<TopperformingController> {
  const TopperformingView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF007f97),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF007f97),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funds with strong past performance"),
        actions: [
          IconButton(icon: Icon(Icons.share, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.help_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("TOP PERFORMING FUNDS", style: TextStyle(color: Colors.purple, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            _fundCard(context, 'assets/images/motilal.png', "Motilal Oswal Midcap Fund", "Equity: Mid Cap", "27.75%", "₹500", "₹22,897.61Cr"),
            _fundCard(context, 'assets/images/hdfc.png', "HDFC Mid-Cap Opportunities Fund", "Equity: Mid Cap", "24.19%", "₹100", "₹76,060.89Cr"),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("High return funds", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            _fundCard(context, 'assets/images/edelweiss.png', "Edelweiss Mid Cap Fund", "Equity: Mid Cap", "22.68%", "₹100", "₹8,280.35Cr"),
            _fundCard(context, 'assets/images/nippon.png', "Nippon India Growth Fund", "Equity: Mid Cap", "22.44%", "₹100", "₹35,277.80Cr"),
            _fundCard(context, 'assets/images/sbi.png', "SBI Contra Fund", "Equity: Contra", "21.53%", "₹500", "₹41,906.90Cr"),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.list, color: Colors.purple),
                      SizedBox(width: 10),
                      Text("View all funds in this collection", style: TextStyle(color: Colors.purple, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text("PhonePe Wealth Broking Private Limited", style: TextStyle(color: Colors.grey, fontSize: 14)),
            ),
            Center(
              child: Text("Investments are subject to market risks. T&C apply", style: TextStyle(color: Colors.blue, fontSize: 12)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _fundCard(BuildContext context, String imagePath, String title, String subtitle, String returnRate, String minInvest, String fundSize) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(imagePath, height: 40),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(subtitle, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _fundDetailColumn("Last 3Y", returnRate, "% p.a"),
              _fundDetailColumn("Min Invest.", minInvest, ""),
              _fundDetailColumn("Fund Size", fundSize, ""),
            ],
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Text("More Details", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}

Widget _fundDetailColumn(String title, String value, String suffix) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
      SizedBox(height: 4),
      Text("$value$suffix", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  );
}
