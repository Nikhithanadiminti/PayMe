import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/loan_controller.dart';

const Color primaryColor = Color(0xFF007f97);

class LoanView extends GetView<LoanController> {
  const LoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Loan", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();  // This will go back to the previous screen using GetX
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.help_outline, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCreditScoreCard(),
            _buildSectionTitle("Partner Loans"),
            _buildLoanOptions(),
            _buildFinancialSuggestions(),
            _buildCreditProfile(),
            _buildManageCredits(),
            _buildPaymentDues(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditScoreCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/credit score.png', height: 120), // Ensure asset exists
          const SizedBox(height: 10),
          const Text(
            "Check Your",
            style: TextStyle(fontSize: 14, color: primaryColor),
          ),
          const Text(
            "Credit Score For Free",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Detailed Insights", style: TextStyle(color: primaryColor)),
              Text("Customised Loans", style: TextStyle(color: primaryColor)),
              Text("100% Secure", style: TextStyle(color: primaryColor)),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            onPressed: () {},
            child: const Text("Check Now", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
      ),
    );
  }

  Widget _buildLoanOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        children: const [
          LoanOption(icon: Icons.directions_car, label: "Car Loan"),
          LoanOption(icon: Icons.motorcycle, label: "Bike Loan"),
          LoanOption(icon: Icons.monetization_on, label: "Gold Loan"),
          LoanOption(icon: Icons.home, label: "Home Loan"),
          LoanOption(icon: Icons.menu_book, label: "Education Loan"),
          LoanOption(icon: Icons.attach_money, label: "Mutual Fund Loan"),
        ],
      ),
    );
  }

  Widget _buildFinancialSuggestions() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Get financial product suggestions",
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),
              Text("Allow access to SMS data", style: TextStyle(color: primaryColor)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            onPressed: () {},
            child: const Text("ALLOW", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditProfile() {
    return _buildTwoColumnCard("Credit Profile", [
      const LoanOption(icon: Icons.speed, label: "Credit Score"),
      const LoanOption(icon: Icons.grid_view, label: "Account Aggregator"),
    ]);
  }

  Widget _buildManageCredits() {
    return _buildTwoColumnCard("Manage Credits", [
      const LoanOption(icon: Icons.credit_card, label: "Rupay Credit on UPI"),
      const LoanOption(icon: Icons.credit_card, label: "Credit Card"),
    ]);
  }

  Widget _buildPaymentDues() {
    return _buildTwoColumnCard("Payment Dues", [
      const LoanOption(icon: Icons.payment, label: "Credit Card Bill Payments"),
      const LoanOption(icon: Icons.money, label: "Loan Repayment"),
    ]);
  }

  Widget _buildTwoColumnCard(String title, List<LoanOption> options) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: options,
          ),
        ],
      ),
    );
  }
}

class LoanOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const LoanOption({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: primaryColor),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: primaryColor)),
      ],
    );
  }
}
