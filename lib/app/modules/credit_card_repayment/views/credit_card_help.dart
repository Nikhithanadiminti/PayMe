import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CreditCardHelp extends StatelessWidget {
  const CreditCardHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
