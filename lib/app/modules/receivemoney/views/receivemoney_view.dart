import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/receivemoney_controller.dart';

class ReceivemoneyView extends GetView<ReceivemoneyController> {
  const ReceivemoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF007f97),
        title: const Text("Receive Money", style: TextStyle(color: Colors.white)),
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
          // Blue background section
          Container(
            width: double.infinity,
            color: const Color(0xFF007f97), // Blue background
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "From any UPI app",
                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset("assets/images/phonepe.png", width: 22),
                    const SizedBox(width: 7),
                    Image.asset("assets/images/bhiim.png", width: 24),
                    const SizedBox(width: 10),
                    Image.asset("assets/images/gpayy.png", width: 28),
                    const SizedBox(width: 8),
                    Image.asset("assets/images/paytm.png", width: 28),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // White background starts here
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white, // White background
              child: Column(
                children: [
                  // Bank Details - Kotak Bank
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/kotaak.png"),
                      ),
                      title: const Text(
                        "Kotak Mahindra Bank - 8419",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: Container(
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
                    ),
                  ),

                  const SizedBox(height: 15),

                  // QR Code Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/qr_code.png",
                          width: 190,
                          height: 190,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _actionButton(Icons.share, "Share QR", Colors.blue),
                            _actionButton(Icons.download, "Download QR", Colors.blue),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // UPI IDs Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("UPI IDs and Numbers",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        Text("MANAGE",
                            style: TextStyle(color: Colors.blue, fontSize: 12)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  _upiTile("vydapadmavathi@ybl", "Displayed on home"),
                  _upiTile("vydapadmavathi@axl", ""),

                  const Spacer(),

                  // UPI Powered Logo
                  const Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Image(
                      image: AssetImage("assets/images/upi.png"),
                      width: 7,
                      color: Colors.grey, // UPI logo changed to grey
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Ensure full background remains white
    );
  }

  // Action Button Widget
  Widget _actionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 24, color: color),
        const SizedBox(height: 8, width: 35),
        Text(label, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }

  // UPI ID Tile
  Widget _upiTile(String upiId, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(upiId, style: const TextStyle(fontSize: 14)),
              if (subtitle.isNotEmpty)
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.copy, size: 20, color: Colors.grey),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: upiId));
            },
          ),
        ],
      ),
    );
  }
}
