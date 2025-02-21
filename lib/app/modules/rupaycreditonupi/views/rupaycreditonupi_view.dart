import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rupaycreditonupi_controller.dart';

const Color primaryColor = Color(0xFF007f97);

class RupaycreditonupiView extends GetView<RupaycreditonupiController> {
  const RupaycreditonupiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Rupay Credit on UPI',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Line linked with +91 9704444147',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can link a credit line to UPI on PhonePe only once you have availed it from your bank.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Use a different mobile number',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search By Bank Name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Popular Banks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: GridView.builder(
                itemCount: bankList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return _buildBankIcon(bankList[index]['image']!, bankList[index]['name']!);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('All Banks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: allBanks.length,
                itemBuilder: (context, index) {
                  return _buildBankListItem(allBanks[index]['image']!, allBanks[index]['name']!);
                },
              ),
            ),
            Center(
              child: const Text(
                'Your Bank Not Listed Here?',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
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
        const SizedBox(height: 5),
        Text(
          bankName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
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

final List<Map<String, String>> bankList = [
  {'image': 'assets/images/hdfc bank logo.png', 'name': 'HDFC Bank Credit Card'},
  {'image': 'assets/images/sbi.png', 'name': 'SBI Credit Card'},
  {'image': 'assets/images/axis logo.png', 'name': 'Axis Bank Credit Card'},
  {'image': 'assets/images/icici.png', 'name': 'ICICI Bank Credit Card'},
  {'image': 'assets/images/bob.png', 'name': 'Bank of Baroda Credit Card'},
  {'image': 'assets/images/kotaak.png', 'name': 'Kotak Mahindra Bank Credit Card'},
  {'image': 'assets/images/yes bank.png', 'name': 'Yes Bank Credit Card'},
  {'image': 'assets/images/union bank logo.png', 'name': 'Union Bank Credit Card'},
  {'image': 'assets/images/pnb.png', 'name': 'Punjab National Bank Credit Card'},
];

final List<Map<String, String>> allBanks = [
  {'image': 'assets/images/au_bank.png', 'name': 'AU Small Finance Bank Credit Card'},
  {'image': 'assets/images/axis logo.png', 'name': 'Axis Bank Credit Card'},
  {'image': 'assets/images/bob.png', 'name': 'Bank of Baroda Credit Card'},
  {'image': 'assets/images/csb.png', 'name': 'CSB Bank Credit Card'},
  {'image': 'assets/images/canara.png', 'name': 'Canara Bank Credit Card'},
  {'image': 'assets/images/hdffc.png', 'name': 'City Union Bank Credit Card'},
  {'image': 'assets/images/hdffc.png', 'name': 'ESAF Small Finance Bank Credit Card'},
  {'image': 'assets/images/federal bank.jpg', 'name': 'Federal Bank Credit Card'},
  {'image': 'assets/images/hdfc bank logo.png', 'name': 'HDFC Bank Credit Card'},
  {'image': 'assets/images/icici logo.png', 'name': 'ICICI Bank Credit Card'},
  {'image': 'assets/images/idfc.png', 'name': 'IDFC First Bank Credit Card'},
  {'image': 'assets/images/induslnd.png', 'name': 'Induslnd Bank Credit Card'},
  {'image': 'assets/images/indian_bank.png', 'name': 'Indian Bank Credit Card'},
  {'image': 'assets/images/hdffc.png', 'name': 'Indian Overseas Bank Credit Card'},
  {'image': 'assets/images/kotaak.png', 'name': 'Kotak Mahindra Bank Credit Card'},
  {'image': 'assets/images/pnb.png', 'name': 'Punjab National Bank Credit Card'},
  {'image': 'assets/images/rbl.png', 'name': 'RBL Bank of India Credit Card'},
  {'image': 'assets/images/sbi.png', 'name': 'SBI Credit Card'},
  {'image': 'assets/images/sbm.png', 'name': 'SBM Bank India Credit Card'},
  {'image': 'assets/images/saraswat bank.png', 'name': 'Saraswat Co-op Bank Credit Card'},
  {'image': 'assets/images/union bank logo.png', 'name': 'Union Bank Credit Card'},
  {'image': 'assets/images/utkarsh.png', 'name': 'Utkarsh Small Finance Bank Credit Card'},
  {'image': 'assets/images/yes bank.png', 'name': 'Yes Bank Credit Card'},
];




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

