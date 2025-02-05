import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'help_appbar.dart';

class StatementOfPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(130), child: HelpAppbar()),
      body: SingleChildScrollView(
          child: Column(
            children: [
              // Main content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question
                    Text(
                      "How do I get a statement of my payments on PayMe?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Steps
                    Text(
                      "To download a statement of your payments,",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8.0),
                    buildStepRow(1, "Tap History on your PayMe app home screen."),
                    SizedBox(height: 8.0),
                    buildStepRow(
                        2, "Tap Download Statement on the top left and select the months or financial year."),
                    SizedBox(height: 8.0),
                    buildStepRow(3, "Tap Proceed."),
                    SizedBox(height: 16.0),
                    // Important Note
                    Text(
                      "Important:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Ensure that you have added and verified your email address before requesting the statement.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 24.0),
                    // Feedback Buttons
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Is this information helpful?",
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Handle thumbs up
                                },
                                icon: Icon(Icons.thumb_up, color: Colors.green),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle thumbs down
                                },
                                icon: Icon(Icons.thumb_down, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget buildStepRow(int number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step number
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.0),
        // Step text
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class DetailsOfPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:PreferredSize(preferredSize: Size.fromHeight(130), child: HelpAppbar()),
      body: SingleChildScrollView(
          child: Column(
              children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question
              Text(
                "What if I can't see details of a payment in my transaction statement?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              // Important note
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Important: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    TextSpan(
                      text:
                      "Your transaction statement will only contain details of payments you made before 3 days from the date you raised a request.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Additional information
              Text(
                "If you’re unable to find details of a transaction that you made before 3 days from the request date, please report this issue using",
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  // Handle link tap
                },
                child: Text(
                  " https://support.payme.com/statement",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              // Feedback Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Is this information helpful?",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle thumbs up
                          },
                          icon: Icon(Icons.thumb_up, color: Colors.green),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle thumbs down
                          },
                          icon: Icon(Icons.thumb_down, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ],
      ),
      ),
    );
  }
}

class TransactionStatementInbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(preferredSize: Size.fromHeight(130), child: HelpAppbar()),
      body: SingleChildScrollView(
          child: Column(
              children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                // Question

                Text(
                  "What if I can't find my transaction statement in my inbox?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                // Explanation
                Text(
                  "In such cases, we recommend that you check the spam folder of your PayMe registered email ID for your statement.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16.0),
                Text(
                  "If you still don’t find the statement, please report this issue using",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle link tap
                  },
                  child: Text(
                    " https://support.payme.com/statement",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                // Feedback Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Is this information helpful?",
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle thumbs up
                            },
                            icon: Icon(Icons.thumb_up, color: Colors.green),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle thumbs down
                            },
                            icon: Icon(Icons.thumb_down, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
        ),
        ],
          ),
        ),
    );
  }
}
