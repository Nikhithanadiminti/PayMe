import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/autopay_controller.dart';

class AutopayView extends GetView<AutopayController> {
  const AutopayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF007f97),
        title: const Text("AutoPay", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white), // Changed back arrow color to white
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF007f97),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Never miss a payment with AutoPay",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Set it up once and we’ll take care of your recurring payments",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/autopay_banner.png',
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Why use AutoPay?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureTile(
                    "Easy set-up",
                    "Set it up with just one click",
                    Icons.timer,
                  ),
                  _buildFeatureTile(
                    "Automatic & on-time payments",
                    "Avoid late fee with hassle-free payments",
                    Icons.event,
                  ),
                  _buildFeatureTile(
                    "Instant notifications",
                    "Get instant updates whenever a payment has been made",
                    Icons.notifications,
                  ),
                  _buildFeatureTile(
                    "Full control on settings",
                    "Pause, modify and cancel any time you want!",
                    Icons.settings,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile(String title, String subtitle, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF007f97)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
