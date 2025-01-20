import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectReceiverBankAccountController extends GetxController {
  // List of popular banks with icons
  final popularBanks = [
    {'name': 'State Bank of \nIndia', 'image': 'assets/images/sbi logo.png'},
    {'name': 'Union Bank Of \nIndia', 'image': 'assets/images/union bank logo.png'},
    {'name': 'Canara Bank', 'image': 'assets/images/canara bank logo.png'},
    {'name': 'HDFC Bank', 'image': 'assets/images/hdfc bank logo.png'},
    {'name': 'India Post \nPayment Bank', 'image': 'assets/images/ipb logo.png'},
    {'name': 'Andhra Pragathi \nGrameena Bank', 'image': 'assets/images/apgp bank logo.png'},
    {'name': 'Indian Bank', 'image': 'assets/images/indian bank logo.png'},
    {'name': 'Kotak Mahindra \nBank', 'image': 'assets/images/kotak bank logo.png'},
    {'name': 'Axis Bank', 'image': 'assets/images/axis logo.png'},
  ];


  // List of all banks
  final allBanks = [
    'State Bank of India',
    'HDFC Bank',
    'ICICI Bank',
    'Punjab National Bank',
    'Axis Bank',
    'Kotak Mahindra Bank',
    'Bank of Baroda',
    'Canara Bank',
    'Union Bank of India',
    'IDBI Bank',
    'Indian Overseas Bank',
    'Central Bank of India',
    'Bank of Maharashtra',
    'UCO Bank',
    'Federal Bank',
    'South Indian Bank',
    'Yes Bank',
    'IndusInd Bank',
    'RBL Bank',
    'Bandhan Bank',
  ];


  late FocusNode searchFocusNode;
  // Observable for the search query
  var searchQuery = ''.obs;

  // Computed property for filtered banks based on the search query
  List<String> get filteredBanks => allBanks
      .where((bank) => bank.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList();

  // Optional: Example observable count (can be removed if unused)
  final count = 0.obs;

  @override
  void onInit() {
    searchFocusNode = FocusNode();
    super.onInit();
    // Additional initialization code can be placed here
  }

  @override
  void onReady() {
    super.onReady();
    // Code to run when the controller is ready
  }

  @override
  void onClose() {
    searchFocusNode.dispose(); // Dispose of the FocusNode

    super.onClose();
    // Code to clean up when the controller is closed
  }

  // Example method for incrementing the count
  void increment() => count.value++;
}
