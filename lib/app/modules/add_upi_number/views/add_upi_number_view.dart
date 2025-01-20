import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_upi_number_controller.dart';

class AddUpiNumberView extends GetView<AddUpiNumberController> {
  const AddUpiNumberView({super.key});

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
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.00),
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
            children: [
              // Info paragraph
              Text(
                'You can send or request money to the UPI ID'
                    'of your contact. The name of the contacts is'
                    ' returned on successful verification of the UPI ID.',
                // textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),

              // Text input with focus and controller
              TextFormField(
                controller: controller.upiController, // Using the controller
                focusNode: controller.focusNode, // Using the focus node
                decoration: InputDecoration(
                  labelText: 'Beneficiary UPI ID',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF007f97), width: 2),
                  ),
                  // Show the verified icon if the UPI ID is valid and verified
                  suffixIcon: Obx(() {
                    return controller.showAdditionalFields.value
                        ? Icon(Icons.security_sharp, color: Color(0xFF007f97)) // Verified icon
                        : SizedBox(); // Empty widget when no icon is needed
                  }),
                ),
                onChanged: (value) {
                  controller.validateUpiId(value); // Validate on text change
                },
              ),

              SizedBox(height: 16),

              // Verify button aligned to the right
              Obx(() {
                return Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    // Enable the button if the UPI ID is valid or if the button has already been clicked (for further actions)
                    onPressed: controller.isUpiIdValid.value || controller.isButtonClicked.value
                        ? controller.verifyUpiId // If valid UPI ID or button clicked, call verify
                        : null, // Disable button if UPI ID is invalid and button hasn't been clicked yet
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.grey; // Grey background when disabled
                          } else if (controller.isButtonClicked.value) {
                            return Colors.green; // Green background after success (when clicked)
                          }
                          return Colors.green; // Default green background when enabled
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.black; // Black text when disabled
                          } else if (controller.isButtonClicked.value) {
                            return Colors.white; // White text after success (when clicked)
                          }
                          return Colors.white; // Default white text when enabled
                        },
                      ),
                    ),
                    child: Text(
                      controller.isButtonClicked.value ? "Verified" : "Verify", // Change text after verification
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),

              // Show additional fields if verification was successful
              Obx(() {
                return controller.showAdditionalFields.value
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Registered Name',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                    Text('Obula Kiran Kumar',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.start,),

                    SizedBox(height: 16),

                    // Nickname (optional) field
                    TextFormField(
                      controller: controller.nicknameController,
                      decoration: InputDecoration(
                        labelText: 'Nickname (Optional)',
                        labelStyle: TextStyle(color: Color(0xFF007f97)),
                        // Bottom border only
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xFF007f97), width: 2),
                        ),
                      ),
                    ),
                  ],
                )
                    : Container(); // If not verified, don't show additional fields
              }),

              Spacer(),

              // Save Button
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isButtonClicked.value
                          ? () {
                        // Handle Add Bank Account button click
                        // Add logic here for saving the data
                      }
                          : null, // Disable button if verification is not done
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey; // Grey background when disabled
                            } else if (controller.isButtonClicked.value) {
                              return Color(0xFF007f97); // Green background when verified
                            }
                            return Color(0xFF007f97); // Default green background when enabled
                          },
                        ),
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.black; // Black text when disabled
                            } else if (controller.isButtonClicked.value) {
                              return Colors.white; // White text when verified
                            }
                            return Colors.white; // Default white text when enabled
                          },
                        ),
                      ),
                      child: Text(
                        controller.isButtonClicked.value ? "Save" : "Save", // Change text after verification
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
