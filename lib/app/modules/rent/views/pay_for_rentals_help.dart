import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayForRentalsHelp extends StatelessWidget {
  const PayForRentalsHelp({super.key});

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
          style: TextStyle(
              color: Colors.white
          ),),
        backgroundColor: Color(0xFF007f97),
      ),

    );
  }
}
