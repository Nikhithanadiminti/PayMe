import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_upi_id_controller.dart';

class AddUpiIdView extends GetView<AddUpiIdController> {
  const AddUpiIdView({super.key});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back(); // Navigate back
          },
        ),
        title: const Text(
          'Add UPI ID',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              // Handle info button click
            },
          ),
        ],
      ),
      body: GestureDetector(

        onTap: () {
          // Unfocus the TextFormField when tapping outside of it
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(  // Ensure this is scrollable
          child: Padding(
            padding: EdgeInsets.all(16.0),  // Add padding to the main content
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,  // Minimize the column's size to fit content
                children: [
                  Text(
                    'You can send or request money to the UPI ID'
                        ' of your contact. The name of the contacts is'
                        ' returned on successful verification of the UPI ID.',
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: controller.upiController,
                    focusNode: controller.focusNode,
                    decoration: InputDecoration(
                      labelText: 'Beneficiary UPI ID',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF007f97), width: 2),
                      ),
                      suffixIcon: Obx(() {
                        return controller.showAdditionalFields.value
                            ? Icon(Icons.security_sharp, color: Color(0xFF007f97))
                            : SizedBox();
                      }),
                    ),
                    onChanged: (value) {
                      controller.validateUpiId(value);
                    },
                  ),
                  SizedBox(height: 16),
                  Obx(() {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: controller.isUpiIdValid.value || controller.isButtonClicked.value
                            ? controller.verifyUpiId
                            : null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey;
                              } else if (controller.isButtonClicked.value) {
                                return Colors.green;
                              }
                              return Colors.green;
                            },
                          ),
                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.black;
                              } else if (controller.isButtonClicked.value) {
                                return Colors.white;
                              }
                              return Colors.white;
                            },
                          ),
                        ),
                        child: Text(
                          controller.isButtonClicked.value ? "Verified" : "Verify",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return controller.showAdditionalFields.value
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Registered Name',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Obula Kiran Kumar',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: controller.nicknameController,
                          decoration: InputDecoration(
                            labelText: 'Nickname (Optional)',
                            labelStyle: TextStyle(color: Color(0xFF007f97)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF007f97), width: 2),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Container();
                  }),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(6.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isButtonClicked.value
                          ? () {
                        // Handle Add Bank Account button click
                        // Add logic here for saving the data
                      }
                          : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF007f97)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(
                        "Save", // The text remains constant as "Save"
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
