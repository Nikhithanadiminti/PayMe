import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostpaidController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  // Updated image paths
  final carouselImages = [
    'assets/images/postpaid1.png',
    'assets/images/postpaid2.png',
  ];

  final List<Map<String,String>> recentContactsList = [
    {"image": "assets/images/vi_image.jpg", "name": "Vinayak","mobile" : "8919189632","last_recharge": "Today"},
    {"image": "assets/images/airtel_digital.png", "name": "Virat","mobile": "8550285712","last_recharge": "Today"},
    {"image": "assets/images/vi_image.jpg", "name": "Pavan","mobile": "8910297679","last_recharge": "Yesterday"},
  ];

  final List<Map<String,String>> myContactsList = [
    {"image": "assets/images/profile_image.png", "name": "Abhishek","mobile" : "8919189632"},
    {"image": "assets/images/profile_image.png", "name": "Abhay","mobile": "8550285712"},
    {"image": "assets/images/profile_image.png", "name": "Birat","mobile": "8910297679"},
  ];

  late Timer autoScrollTimer;

  get recents => null;



  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        final nextPage = (currentIndex.value + 1) % carouselImages.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        currentIndex.value = nextPage;
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
