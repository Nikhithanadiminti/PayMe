import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BroadbandLandlineController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;
  List<GlobalKey<FormState>> billerFormKeys = <GlobalKey<FormState>>[];
  final List<Map<String, dynamic>> allBillers = [
    {"logo": "assets/images/act_fibernet.jpg", "name": "ACT Fibernet",},
    {"logo": "assets/images/airtel_broadband.webp", "name": "Airtel Broadband"},
    {"logo": "assets/images/airtel_landline.jpg", "name": "Airtel Landline"},
    {"logo": "assets/images/excell_broadband.jpg", "name": "Excell Broadband"},
    {"logo": "assets/images/netplus_broadband.png", "name": "Netplus Broadband"},
    {"logo": "assets/images/hathway.png", "name": "Hathway Broadband"},
    {"logo": "assets/images/apex.png", "name": "Apex"},
    {"logo": "assets/images/apple_fibernet.jpg", "name": "Apple Fibernet"},
    {"logo": "assets/images/den_broadband.webp", "name": "DEN Broadband"},
    {"logo": "assets/images/Extreme Broadband.png", "name": "Extreme Broadband"},
    {"logo": "assets/images/flash_fibernet.jpg", "name": "Flash Fibernet"},
    {"logo": "assets/images/garuda_groups.jpg", "name": "Garuda Groups"},
    {"logo": "assets/images/megha_gas.jpg", "name": "Gateway Networks"},
    {"logo": "assets/images/Jabbar Communications.jpg", "name": "Jabbar Communications"},
    {"logo": "assets/images/Kings Broadband.png", "name": "Kings Broadband"},
    {"logo": "assets/images/Logon Broadband.jpg", "name": "Logon Broadband"},
  ];

  // List to hold filtered billers
  RxList<Map<String, dynamic>> filteredBillers = <Map<String, dynamic>>[].obs;

  // Updated image paths
  final carouselImages = [
    'assets/images/broadband1.png',
    'assets/images/broadband2.jpg',
  ];

  late Timer autoScrollTimer;

  get recents => null;

  GlobalKey<FormState> billerDetailsFormKey = GlobalKey<FormState>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> telephoneController = TextEditingController().obs;
  GlobalKey<FormState> telephoneFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    startAutoSlide();
    filteredBillers.value.assignAll(allBillers);
    for(int i = 0; i< 15;i++){
      billerFormKeys.add(GlobalKey<FormState>());
      allBillers[i]["formKey"] = billerFormKeys[i];
    }

  }

  onConfirmOfActFibernet(){
    if(!telephoneFormKey.currentState!.validate()){

    }
  }

  // Filter the billers based on search input
  void searchBillers(String query) {
    if (query.isEmpty) {
      filteredBillers.assignAll(allBillers);  // Show all billers when search is empty
    } else {
      filteredBillers.assignAll(allBillers.where((biller) {
        return biller["name"]!.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  void startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        int nextPage = (currentIndex.value + 1) % carouselImages.length;
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    autoScrollTimer.cancel(); // Stop the timer when the controller is disposed
    pageController.dispose();
    super.onClose();
  }
}
