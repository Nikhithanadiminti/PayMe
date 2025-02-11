import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/scanned_payment_details_controller.dart';

class ScannedPaymentDetailsView extends GetView<ScannedPaymentDetailsController> {
  const ScannedPaymentDetailsView({super.key, required String contactName});

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async{
        controller.resetAmount();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
      
          backgroundColor: Colors.white,
          leading: IconButton(
      
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Reset the amount when the back button is pressed
              controller.resetAmount();
              Get.back(); // Navigate back
            },
          ),
          title: Row(
            children: [
              // Profile image with initials
              Obx(() {
                return CircleAvatar(
                  radius: 25,
                  child: Text(
                    controller.initials,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                );
              }),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Obx(() {
                        return Row(
                          mainAxisSize: MainAxisSize.min, // Ensures tight wrapping of children
                          children: [
                            Flexible(
                              child: Text(
                                controller.recipientName.value,
                                style: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.verified,
                              color: Colors.green,
                              size: 19,
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {},
                      child: Obx(() {
                        return Text(
                          controller.recipientInfo.value,
                          style: const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "To",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 50),
                    Image.asset(
                      'assets/images/bhim.png',
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'UPI linked Bank A/c',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Dismiss the keyboard when tapping outside the input field
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '₹',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  // Dismiss the keyboard when tapping outside
                                  FocusScope.of(context).unfocus();
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: controller.width.value,
                                  child: TextField(
                                    controller: controller.amountController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(7),
                                    ],
                                      onChanged: (value) {
                                        controller.hasInteractedWithAmount.value = true;
                                        controller.onAmountChanged(value);
                                        if (value.isNotEmpty) {
                                          controller.isAmountValid.value = true;
                                        }
                                      },


                                      cursorColor: const Color(0xFF007f97),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '0',
                                      hintStyle: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Obx(() {
                          return Text(
                            controller.amountInWords.value,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                            ),
                            textAlign: TextAlign.center,
                          );
                        }),

                        Obx(() {
                          return Visibility(
                            visible: !controller.isAmountValid.value && controller.hasInteractedWithAmount.value, // Show validation if user interacted
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Please enter an amount to proceed',
                                style: TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Show the bottom sheet when the button is clicked
                          if (controller.amountController.text.isEmpty) {
                            controller.isAmountValid.value = false; // Show validation if empty
                          } else {
                            controller.isAmountValid.value = true;
                            // Proceed with payment logic
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // Allow scrollable content
                              backgroundColor: Colors.transparent, // Transparent background to match the design
                              builder: (context) {
                                // Automatically select the first bank when the bottom sheet is shown
                                controller.selectFirstBankIfNoneSelected();

                                return DraggableScrollableSheet(
                                  initialChildSize: 0.5, // Half of the screen size initially
                                  minChildSize: 0.5, // Minimum size (30% of the screen)
                                  maxChildSize: 0.5, // Maximum size (80% of the screen for better visibility)
                                  builder: (context, scrollController) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Total payable and close button
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Total payable',
                                                style: TextStyle(color: Colors.white, fontSize: 16),
                                              ),
                                              Obx(() {
                                                final formattedTotalPayable = NumberFormat('#,##0.00').format(controller.totalPayable.value);
                                                return Text(
                                                  '₹ $formattedTotalPayable',
                                                  style: const TextStyle(color: Colors.white, fontSize: 20),
                                                );
                                              }),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);  // Close the bottom sheet
                                                },
                                                child: const Icon(Icons.close, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),

                                          // List of banks
                                          Expanded(
                                            child: ListView.builder(
                                              controller: scrollController, // Use the provided scrollController for DraggableScrollableSheet
                                              itemCount: controller.banks.length + 1, // Add 1 for the "Add bank" option
                                              itemBuilder: (context, index) {
                                                if (index == controller.banks.length) {
                                                  // "Add bank" button
                                                  return ListTile(
                                                    contentPadding: EdgeInsets.zero,
                                                    leading: const Icon(Icons.add, color: Colors.white),
                                                    title: const Text('Add bank accounts', style: TextStyle(color: Colors.white)),
                                                    onTap: () {
                                                      // Handle add bank action
                                                    },
                                                  );
                                                }

                                                final bank = controller.banks[index];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  padding: const EdgeInsets.all(16),
                                                  margin: const EdgeInsets.only(bottom: 8), // Add spacing between items
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.account_balance,
                                                            color: controller.selectedBank.value == bank
                                                                ? Colors.green
                                                                : (index == 0 ? Colors.red : Colors.orange),
                                                          ),
                                                          const SizedBox(width: 12),
                                                          Text(
                                                            '${bank.name} •• ${bank.account}',
                                                            style: const TextStyle(color: Colors.white),
                                                          ),
                                                        ],
                                                      ),
                                                      Obx(() {
                                                        return Radio<Bank>(
                                                          value: bank,
                                                          groupValue: controller.selectedBank.value,
                                                          onChanged: (Bank? value) {
                                                            if (value != null) {
                                                              controller.selectedBank.value = value;
                                                              controller.updateTotalPayable();
                                                            }
                                                          },
                                                          activeColor: Colors.green,
                                                        );
                                                      }),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),

                                          // Pay button
                                          Container(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (controller.amountController.text.isEmpty) {
                                                  controller.isAmountValid.value = false;
                                                } else {
                                                  controller.isAmountValid.value = true;
                                                  // Show bottom sheet or proceed with payment logic
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(0xFF007f97),
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: Obx(() {
                                                final formattedTotalPayable = NumberFormat('#,##0.00').format(controller.totalPayable.value);
                                                return Text(
                                                  'Pay ₹ $formattedTotalPayable',
                                                  style: const TextStyle(fontSize: 18, color: Colors.white),
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF007f97),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.security,
                              color: Colors.white,
                              size: 19,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Proceed Securely',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      'assets/images/UPI.jpg',
                      height: 30,
                      width: 50,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
