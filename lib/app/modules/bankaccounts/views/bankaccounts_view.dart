import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bankaccounts_controller.dart';

class BankaccountsView extends GetView<BankaccountsController> {
  const BankaccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF007f97),
        title: const Text(
          "Bank Accounts",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Each bank account in a separate card
          _bankAccountCard(
            imagePath: "assets/images/kotaak.png",
            bankName: "Kotak Mahindra",
            accountNumber: "8419",
            isPrimary: true,
          ),
          _bankAccountCard(
            imagePath: "assets/images/axis logo.png",
            bankName: "Axis Bank",
            accountNumber: "1184",
            isPrimary: false,
          ),
          _bankAccountCard(
            imagePath: "assets/images/icici logo.png",
            bankName: "ICICI Bank",
            accountNumber: "XX40",
            isPrimary: false,
          ),

          const Spacer(),

          // Add New Bank Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Handle add new bank account logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007f97),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                "Add New Bank Account",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Wraps each bank tile in its own card-like container
  Widget _bankAccountCard({
    required String imagePath,
    required String bankName,
    required String accountNumber,
    required bool isPrimary,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: _bankTile(
        imagePath: imagePath,
        bankName: bankName,
        accountNumber: accountNumber,
        isPrimary: isPrimary,
      ),
    );
  }

  /// Single bank tile with name, account number, and 'Primary' label if applicable
  Widget _bankTile({
    required String imagePath,
    required String bankName,
    required String accountNumber,
    required bool isPrimary,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        "$bankName - $accountNumber",
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPrimary)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "Primary",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}
