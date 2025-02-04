import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goldloan_controller.dart';

class GoldloanView extends GetView<GoldloanController> {
  const GoldloanView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gold Loan App',
      theme: ThemeData(
        primaryColor: Color(0xFF007f97),
      ),
      home: GoldLoanView(),
    );
  }
}

class GoldLoanView extends StatelessWidget {
  const GoldLoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF007f97),
      appBar: AppBar(
        title: Text('Gold Loan', style: TextStyle(color: Colors.white)),
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
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: ListView(
                padding: EdgeInsets.all(12),
                children: [
                  LoanProviderTile(
                    logoPath: 'assets/images/muthoot_finance.png',
                    title: 'Muthoot Finance',
                    subtitle: 'Get a loan starting at ₹5000',
                  ),
                  LoanProviderTile(
                    logoPath: 'assets/images/muthoot_fincorp.png',
                    title: 'Muthoot FinCorp',
                    subtitle: '30 mins approval | 1.0% | ₹25 PF',
                  ),
                  LoanProviderTile(
                    logoPath: 'assets/images/iifl_finance.png',
                    title: 'IIFL Finance',
                    subtitle: 'Starts @0.99% pm* | Max Value for gold',
                  ),
                ],
              ),
            ),
          ),
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

class LoanProviderTile extends StatelessWidget {
  final String logoPath;
  final String title;
  final String subtitle;

  const LoanProviderTile({super.key, required this.logoPath, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(logoPath),
          backgroundColor: Colors.transparent,
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF007f97)),
        onTap: () {},
      ),
    );
  }
}

