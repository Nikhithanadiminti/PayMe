import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../../to_mobile_no/controllers/to_mobile_no_controller.dart';


class Bank {
  final String name;
  final String account;
  bool isSelected;

  Bank({required this.name, required this.account, this.isSelected = false});
}

class ToMobileNumPaymentDetailsController extends GetxController {
  // Observable variable to store the contact name
  final ToMobileNoController _toMobileNoController = Get.find();

  final recipientName = "Recipient Name".obs;
  final recipientInfo = "Recipient Info".obs;
  final amount = 0.0.obs;
  final scannedData = "".obs;
  var formattedAmount = ''.obs;
  var amountInWords = ''.obs;
  RxDouble width = 50.0.obs;
  var isAmountValid = false.obs;
  var hasInteractedWithAmount = false.obs;

  TextEditingController amountController = TextEditingController();
  RxDouble totalPayable = 0.0.obs;

  RxString contactName = ''.obs;

  final count = 0.obs;


  var banks = <Bank>[
    Bank(name: 'State Bank Of India', account: '•• XX33'),
    Bank(name: 'Axis Bank', account: '•• 8189'),
    Bank(name: 'Icici Bank', account: '•• XX33'),
    Bank(name: 'Hdfc Bank', account: '•• 8189'),
    Bank(name: 'Canara Bank', account: '•• XX33'),
    Bank(name: 'ICICI Bank', account: '•• XX33'),

  ].obs;

  void selectFirstBankIfNoneSelected() {
    // Check if no bank is selected, and select the first bank in the list
    if (selectedBank.value == null && banks.isNotEmpty) {
      selectedBank.value = banks[0];  // Automatically select the first bank
      updateTotalPayable();  // Update the total payable when a bank is selected
    }
  }

  var selectedBank = Rx<Bank?>(null); // Track selected bank

  // Method to add a new bank to the list
  void addBank(String name, String account) {
    banks.add(Bank(name: name, account: account));
    update(); // Refresh the UI
  }

  // Method to update the total payable value when a bank is selected
  void updateTotalPayable() {
    // Don't reset the total payable unless there's no amount
    if (selectedBank.value != null) {
      totalPayable.value = amount.value > 0 ? amount.value : totalPayable.value; // Keep the entered amount
    } else {
      totalPayable.value = 0.0; // Reset if no bank is selected
    }
  }





  String get initials {
    final names = recipientName.value.split(" ");
    if (names.length >= 2) {
      return "${names[0][0]}${names[1][0]}".toUpperCase();
    } else if (names.isNotEmpty) {
      return names[0][0].toUpperCase();
    }
    return "";
  }

  void onAmountChanged(String value) {
    String cleanValue = value.replaceAll(',', '');

    if (cleanValue.isEmpty) {
      formattedAmount.value = '';
      amount.value = 0.0;
      amountInWords.value = '';
      amountController.value = TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
      totalPayable.value = 0.0; // Reset total payable
      return;
    }else{
      int numericValue = int.tryParse(cleanValue) ?? 0;
      amount.value = numericValue.toDouble();
      totalPayable.value = amount.value; // Update total payable
    }

    int numericValue = int.tryParse(cleanValue) ?? 0;
    String formatted = NumberFormat('#,###').format(numericValue);

    amountController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );

    amountInWords.value = _convertToWords(numericValue);
    totalPayable.value = numericValue.toDouble(); // Ensure this is consistent
  }




  String _convertToWords(int number) {
    // Implement a number-to-words conversion function here
    // For simplicity, here's a basic example for numbers up to 9999999
    if (number == 0) return "Zero";

    List<String> units = ["", "Thousand", "Million"];
    List<String> words = [];
    int unitIndex = 0;

    while (number > 0) {
      int chunk = number % 1000;
      if (chunk > 0) {
        words.insert(
            0,
            "${_convertChunk(chunk)} ${units[unitIndex]}"
                .trim());
      }
      number ~/= 1000;
      unitIndex++;
    }

    return words.join(' ').trim();
  }

  String _convertChunk(int chunk) {
    // Handle numbers from 0 to 999
    List<String> belowTwenty = [
      "",
      "One",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Eleven",
      "Twelve",
      "Thirteen",
      "Fourteen",
      "Fifteen",
      "Sixteen",
      "Seventeen",
      "Eighteen",
      "Nineteen"
    ];
    List<String> tens = [
      "",
      "",
      "Twenty",
      "Thirty",
      "Forty",
      "Fifty",
      "Sixty",
      "Seventy",
      "Eighty",
      "Ninety"
    ];
    if (chunk < 20) {
      return belowTwenty[chunk];
    } else if (chunk < 100) {
      return "${tens[chunk ~/ 10]} ${belowTwenty[chunk % 10]}".trim();
    } else {
      return "${belowTwenty[chunk ~/ 100]} Hundred ${_convertChunk(chunk % 100)}"
          .trim();
    }
  }

  // Method to update payment details based on scanned data
  void updateScannedDetails(String data) {
    scannedData.value = data;
    totalPayable.value = 0.0;
    amount.value = 0.0;
    print('Scanned QR Code Data..................................................: $data');
    // Example parsing logic (assumes JSON data)
    try {
      final details = _parseScannedData(data);
      if (details != null) {
        recipientName.value = details['name'] ?? "Recipient Name";
        recipientInfo.value = details['info'] ?? "Recipient Info";
        amount.value = details['amount'] ?? 0.0;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to parse scanned data');
    }
  }

  // Custom method to parse scanned data

  Map<String, dynamic>? _parseScannedData(String data) {
    try {
      totalPayable.value = 0.0;
      amount.value = 0.0;
      // Parsing the QR code URL parameters
      final uri = Uri.parse(data);
      final queryParameters = uri.queryParameters;

      // Extracting name (pn) and info (pa) from query parameters
      final recipientName = queryParameters['pn']
          ?.split(" ")
          ?.first ?? "Recipient Name";
      final recipientInfo = queryParameters['pa'] ?? "Recipient Info";

      return {
        'name': recipientName,
        'info': recipientInfo,
        'amount': 0.0, // You can extend this logic to extract amount if needed
      };
    } catch (e) {
      print('Error parsing QR code data: $e');
      return null;
    }
  }



  @override
  void onInit() {
    super.onInit();
    if (banks.isNotEmpty) {
      selectedBank.value = banks.first; // Set the first bank as default
      updateTotalPayable(); // Update the total payable for the first bank
    }
    amountController.addListener(_onTextChanged);
    contactName.value = _toMobileNoController.selectedContactName.value;
  }


  @override
  void resetAmount() {
    hasInteractedWithAmount.value = false;
    amountInWords.value = '';
    amountController.clear(); // Clears the TextField
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    amountController.removeListener(_onTextChanged);
    super.onClose();
  }

  void _onTextChanged() {
    // Dynamically change the width based on the text length
    width.value = amountController.text.isEmpty ? 50 : 100 + (amountController.text.length * 17).toDouble();
  }

}
