import 'package:flutter/material.dart';

class CustomTransactionHistoryCard extends StatelessWidget {
  const CustomTransactionHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.only(top: 10,bottom: 10),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
       // border: Border.all(color: Color(0xFF007f97))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('images/profile_image.png',
                      height: 50,
                      width: 50,),
                  SizedBox(width: 10),
                  Expanded(
                      child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text("Paid to"),
                      Row(
                        children: [
                          Text("Varun"),
                          Spacer(),
                          Text("\u{20B9}6000"),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ],
                  )
                  )
                ],
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("1 day ago"),
              ),
              Row(
                children: [
                  Text("Debited From"),
                  SizedBox(width: 6),
                  Image.asset('images/bank_image.png',height: 40,width: 40,),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
