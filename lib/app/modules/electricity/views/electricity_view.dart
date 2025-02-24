import 'package:demo_project/app/modules/electricity/controllers/electricity_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class ElectricityView extends GetView<ElectricityController> {
  ElectricityView({super.key});
  ElectricityController electricityController = Get.put(ElectricityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Obx(()=>
              TextFormField(
                onChanged: (value){
                  electricityController.searchElectricityBillerCon.value;
                },
                controller: electricityController.searchElectricityBillerCon.value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.help_outline, color: Color(0xFF007f97)),
                    onPressed: () {},
                  ),
                  hintText: "Search By Biller",
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
               // margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  "assets/images/credit_card_repayment2.webp",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Obx(()=>
              electricityController.searchElectricityBillerCon.value.text.isNotEmpty
                  ? const SizedBox()
                  : _buildBillersSection("Billers in Telangana",electricityController.filterBillersList),
              ),
              const SizedBox(height: 25),
              _buildBillersSection("All Billers",electricityController.filterBillersList),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBillersSection(String title, List<Map<String, String>> billers,
      {bool isList = false}) {
    return  Obx(()=>
    // title == "Billers in Telangana" && waterController.searchWaterBillerCon.value.text.isNotEmpty
    //   ? const SizedBox()
    //   :
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              electricityController.searchElectricityBillerCon.value.text.isNotEmpty
                  ? "Search Results" : title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 14),
          // isList ?
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: title == "Billers in Telangana" && electricityController.searchElectricityBillerCon.value.text.isEmpty
                ? 2
                : billers.length,
            separatorBuilder: (context, index) {
              return Column(
                children: [
                  const Divider(color: Colors.grey),
                  SizedBox(height: 8)
                ],
              );
            },
            itemBuilder: (context, index) {
              final biller = billers[index];
              return GestureDetector(
                  onTap: (){
                    Get.to(()=>BillersDetailsView(
                        title: billers[index]["name"]!,
                        textFieldTitle: billers[index]["textFieldName"]!
                    ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        // Card(
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        //   child: Container(
                        //     height: 30,
                        //     width: 30,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.rectangle,
                        //       image: DecorationImage(
                        //           image: AssetImage(biller["logo"]!),
                        //       fit: BoxFit.cover)
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 30,
                        //   width: 30,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.only(topLeft: Radius.circular(2)),
                        //     child: Image.asset(biller["logo"]!),
                        //   ),
                        // ),
                        Container(
                          height: 30,
                          width: 30,
                          //padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Image.asset(biller["logo"]!,
                          fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(child: Text(biller["name"]!, style: const TextStyle(fontSize: 12))),
                      ],
                    ),
                  )
              );
            },
          )
          //     : Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Column(
          //     children: List.generate(
          //       (billers.length / 3).ceil(),
          //           (rowIndex) => GestureDetector(
          //         onTap: (){
          //           // print("check navigation---------------");
          //           Get.to(()=>BillersDetailsView(title: billers[rowIndex]["name"]!,));
          //         },
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: billers
          //               .skip(rowIndex * 3)
          //               .take(3)
          //               .map((biller) =>
          //               BillerItem(logoPath: biller["logo"]!, billerName: biller["name"]!))
          //               .toList(),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    )
    );
  }
}

class BillersDetailsView extends StatelessWidget {
  final String title;
  final String textFieldTitle;

  BillersDetailsView({required this.title,required this.textFieldTitle,super.key});

  ElectricityController electricityController = Get.put(ElectricityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {

            },
          ),
        ],
        title: Text(
          title,
          style: TextStyle(fontSize: 18,color: Colors.white),),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30,bottom: 16,right: 16,left: 16),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white38.withOpacity(0.9),
                boxShadow: [ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(textFieldTitle),
                SizedBox(height: 5),
                Form(
                  key: electricityController.billerDetailsFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction, // <-- Add this line
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      // hintText: "",
                      // hintStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your $textFieldTitle";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),]
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/bharat_connect.webp",
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            if(!electricityController.billerDetailsFormKey.currentState!.validate()){

            }
          },
          child: const Text(
            "Confirm",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
