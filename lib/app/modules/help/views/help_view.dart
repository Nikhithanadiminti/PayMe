import 'package:demo_project/app/modules/help/views/transaction_statement_questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'help_appbar.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(130), child: HelpAppbar()),
      body: Column(
        children: [
          // Transaction Statements title
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Colors.grey[200],
            child: Text(
              "Transaction Statements",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // List of help topics
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                buildHelpItem(

                  title: "How do I get a statement of my payments on PayMe?",
                  description:
                  "To download a statement of your payments, Important...", onClick: () {
                    Get.to(()=> StatementOfPayment());
                },
                ),
                buildHelpItem(
                  title:
                  "What if I can't see details of a payment in my transaction statement?",
                  description:
                  "Important: Your transaction statement will only...", onClick: () {
                  Get.to(()=>DetailsOfPayment());
                },
                ),
                buildHelpItem(
                  title:
                  "What if I can't find my transaction statement in my inbox?",
                  description:
                  "In such cases, we recommend that you check the...", onClick: () {
                  Get.to(()=>TransactionStatementInbox());
                },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHelpItem({required String title, required String description,
   required VoidCallback onClick
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
    onTap: onClick,
        ),
        Divider(),
      ],
    );
  }
}

class ViewTickets extends StatelessWidget {
  const ViewTickets({super.key});

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
        backgroundColor: Color(0xFF007f97),
        title: Text(""
            "View Tickets",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}



