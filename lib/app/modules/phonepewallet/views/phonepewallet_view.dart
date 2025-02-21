import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/phonepewallet_controller.dart';

class PhonepewalletView extends GetView<PhonepewalletController> {
  const PhonepewalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletSelectionScreen(),
    );
  }
}

class WalletSelectionScreen extends StatelessWidget {
  const WalletSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF007f97),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("PhonePe Wallet", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // 🆕 Added Wallet Image Above "Choose your Wallet"
          Image.asset(
            'assets/images/wallet.png', // 🛠 Ensure the asset path is correct
            height: 120,
          ),

          const SizedBox(height: 10),

          // "Choose your Wallet" Text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Choose your Wallet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Wallet Options
          WalletOption(
            title: "Max balance: ₹2 Lakh",
            subtitle: "Needs simple video verification",
            features: [
              {"icon": Icons.credit_card, "text": "Top up using credit cards or UPI"},
              {"icon": Icons.account_balance_wallet, "text": "Withdraw balance to bank account"},
              {"icon": Icons.qr_code, "text": "Use your wallet to pay at any UPI QR"},
            ],
            isSelected: true,
          ),
          WalletOption(
            title: "Max balance: ₹10,000",
            subtitle: "Needs Govt. ID number",
            features: [],
            isSelected: false,
          ),

          const Spacer(),

          // Get Started Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007f97),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Wallet Option Widget
class WalletOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Map<String, dynamic>> features;
  final bool isSelected;

  const WalletOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.features,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
                  ],
                ),
              ),
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? Colors.green : Colors.grey,
              ),
            ],
          ),
          if (features.isNotEmpty) ...[
            const SizedBox(height: 10),
            Column(
              children: features
                  .map(
                    (feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Icon(feature["icon"], color: Colors.black54, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(feature["text"], style: const TextStyle(fontSize: 14))),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
