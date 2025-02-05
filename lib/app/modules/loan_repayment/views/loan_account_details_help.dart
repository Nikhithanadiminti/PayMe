import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../help/views/help_view.dart';

class LoanAccountDetailsHelp extends StatelessWidget {
  const LoanAccountDetailsHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Help",
          style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF007f97),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ViewTickets());
            },
            child: Padding(
              padding:  EdgeInsets.only(right : 8.0),
              child: Text(
                "VIEW TICKETS",
                style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        color: Color(0xFF007f97),
        child: Row(
          children: [
            // Search bar
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for any help topics",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.0),
            // Language icon
            GestureDetector(
              onTap: () {
                // Language action
              },
              child: Icon(Icons.language, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
