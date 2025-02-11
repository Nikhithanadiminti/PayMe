import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ToMobileNoController extends GetxController {
  // Observable list for contacts
  var contacts = <Contact>[].obs;
  var filteredContacts = <Contact>[].obs;
  var selectedContactName = ''.obs;
  var showScrollToTopButton = false.obs; // This is the reactive variable

  final hintTexts = [
    "Search any contact / name",
    "Search any mobile number",
    "Start a new payment here",
  ];
  var currentHintIndex = 0.obs; // Observable for hint index
  late Timer _hintTimer;
  // Loading state to manage fetching progress
  var isLoading = true.obs;
  var searchQuery =''.obs;
  // Method to fetch contacts
  Future<void> fetchContacts() async {
    try {
      if (await FlutterContacts.requestPermission()) {
        var fetchedContacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
        contacts.value = fetchedContacts;
        filteredContacts.value = fetchedContacts;
        isLoading.value = false;
      } else {
        print("Permission denied");
        isLoading.value = false;
      }
    } catch (e) {
      // Handle any error during contact fetching
      print('Error fetching contacts: $e');
      isLoading.value = false;
    }
  }

  void filterContacts() {
    if (searchQuery.value.isEmpty) {
      filteredContacts.value = contacts;
    } else {
      filteredContacts.value = contacts.where((contact) {
        // Check if name or phone number contains the search query
        final nameMatch = contact.displayName?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false;
        final phoneMatch = contact.phones.isNotEmpty && contact.phones.first.number!.contains(searchQuery.value) ?? false;
        return nameMatch || phoneMatch;
      }).toList();
    }
  }


  void _startHintCycling() {
    _hintTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentHintIndex.value = (currentHintIndex.value + 1) % hintTexts.length;
    });
  }

  // Set the selected contact name
  void setSelectedContactName(String name) {
    selectedContactName.value = name;
  }


  @override
  void onInit() {
    super.onInit();
    _startHintCycling();
    fetchContacts(); // Fetch contacts when the controller initializes
  }
}