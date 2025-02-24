import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SunDirect extends StatelessWidget {
  const SunDirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Sun Direct",
          style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              // Get.to(() => RentHelpView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/cashback_dth.jpg",
                  fit: BoxFit.cover,
                ),
              ),
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
                      "Subscriber Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0), // Spacing between title and TextField
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF007f97)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF007f97), width: 2.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.contacts, color: Color(0xFF007f97)),
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                        "To know your Customer ID, SMS 'ID' from your registered telephone number or SMS 'CID' &It;Smart Card Number&gt; from non-registered telephone number to 9212012299"
                    ),
                    SizedBox(height: 7,),
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0), // Spacing between title and TextField
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF007f97)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF007f97), width: 2.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                        "Enter your amount in rupees"
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
                    Image.asset("assets/images/bharat_connect.webp",
                        height: 50,
                        width: 50),
                    SizedBox(width: 10),
                    Text(
                        "By proceeding further, you allow PayMe \nto fetch your current and future dates and \nremind you"
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
    backgroundColor: Colors.blueGrey,),
            onPressed: (){
            }, child: Text(
          "CONFIRM",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
        )),
      ),
    );
  }
}
