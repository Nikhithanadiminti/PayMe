import 'package:demo_project/app/modules/transactions/views/transaction_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../download/views/download_view.dart';
import '../../filters/views/filters_view.dart';
import '../../help/views/help_view.dart';
import '../controllers/transactions_controller.dart';
import 'custom_transaction_history_card.dart';

class TransactionsView extends GetView<TransactionsController> {
  final transactionsController=Get.put(TransactionsController());
   TransactionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(170),
          child: Column(
            children: [
              AppBar(
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
                    "Transaction History",
                  style: TextStyle(color: Colors.white),),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                height: 105,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                      child: TextField(
                        //controller: transactionsController.searchController,
                        decoration: InputDecoration(
                            hintText: "Search by name, number or UPI ID",
                            hintStyle: TextStyle(fontWeight: FontWeight.w400),
                            suffixIcon: Icon(
                              Icons.search,
                              size: 28,
                              color: Color(0xFF007f97),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF007f97),)
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF007f97),)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(()=> DownloadStatement());
                          },
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Color(0xFF007f97),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "Download ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Icons.download,
                                    color: Color(0xFF007f97),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> FiltersView());
                          },
                          child: Container(
                            height: 30, width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Color(0xFF007f97),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Filters",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(padding: EdgeInsets.only(left: 8),
                                  child: Icon(
                                    Icons.filter,
                                    color: Color(0xFF007f97),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 10,left: 16,right: 16,bottom: 20),
          child: Column(
            children: [
             ListView.separated(
               shrinkWrap: true,
               physics: const BouncingScrollPhysics(),
               itemCount: 14,
                 itemBuilder: (context,index){
                 return GestureDetector(
                     onTap: (){
                       Get.to(()=> TransactionDetails() );
                     },
                     child: CustomTransactionHistoryCard());
                 },
               separatorBuilder: (context,index){
                 return SizedBox(height: 10,);
               },
                 )
            ],
          ),),
      ),

    );
  }
}










