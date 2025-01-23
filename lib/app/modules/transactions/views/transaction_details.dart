import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionDetails(),
    );
  }
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction Successful",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "12:15 PM on 10 Jan 2025",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Paid to Section
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF007f97),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Varun",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "+918919189632",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "₹6000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Banking Name: ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: Text(
                                "Varun kumar Mudadla",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black),
            // Transfer Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transfer Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Transaction ID",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Text(
                        "T2501082005413954268782",
                        style: TextStyle(color: Colors.black),
                      ),
                      // SizedBox(width: 8),
                      // Icon(Icons.copy, color: Colors.white70, size: 16),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Debited from",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Text(
                        "XXXX111111",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.copy, color: Colors.black, size: 16),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "UTR",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Text(
                        "105882976259",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.copy, color: Colors.black, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black),
            SizedBox(height: 10,),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildActionButton(Icons.reply, "Send Again"),
                      buildActionButton(Icons.history, "View History"),
                      buildActionButton(Icons.account_balance_wallet, "Split Expense"),
                      buildActionButton(Icons.share, "Share Receipt"),
                    ],
                  ),
                  SizedBox(height: 10), // Add space between icons and the Divider
                ],
              ),
            ),

            SizedBox(height: 5,),
            Divider(color: Colors.black),
            // Contact Support Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.help, color: Colors.black),
                title: Text(
                  "Contact PayMe Support",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                onTap: () {
                  // Handle support action
                },
              ),
            ),
            // Powered By Section
            // Padding(
            //   padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            //   child: Center(
            //     child: Column(
            //       children: [
            //         Text(
            //           "Powered by",
            //           style: TextStyle(color: Colors.white70),
            //         ),
            //         SizedBox(height: 4),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Image.network(
            //
            //               height: 24,
            //             ),
            //             SizedBox(width: 8),
            //             Text(
            //               "Axis Bank",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xFF007f97).withOpacity(0.1), // Light background for the box
            borderRadius: BorderRadius.circular(8.0), // Rounded corners for the box
          ),
          child: Icon(icon, color: Color(0xFF007f97), size: 24), // Icon inside the box
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.black, fontSize: 12)), // Label below the box
      ],
    );
  }
}

