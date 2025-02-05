import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loan_account_details_help.dart';

class LoanAccountDetails extends StatelessWidget {
  const LoanAccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Bajaj Finserv",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF007f97),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Get.to(() => LoanAccountDetailsHelp());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Title container with TextField
          Container(
            margin: EdgeInsets.only(left:12,right:12,top:12),
            padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loan Account Number",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0), // Spacing between title and TextField
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Loan Account Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFF007f97),), // Black border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFF007f97), width: 2.0), // Black border when focused
                    ),
                   contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/bharat_connect.png",
                height: 50,
                    width: 50),
                SizedBox(width: 10),
                Text(
                  "By proceeding further, you allow PayMe to \nfetch your current and future dates and \nremind you"
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            ),
              backgroundColor:Colors.blueGrey.withOpacity(0.1) ),
            onPressed: (){

        }, child: Text(
          "CONFIRM",
          style: TextStyle(color: Colors.black12.withOpacity(0.3),fontWeight: FontWeight.w800),
        )),
      ),
    );
  }
}
