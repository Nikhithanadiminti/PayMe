import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  var carouselImages= <String>[].obs;
  var currentIndex = 0.obs;

  Timer? _timer;
  late PageController pageController;
  // Method to update current index when page changes
  void updateIndex(int index) {
    currentIndex.value = index;
  }

  // Start automatic sliding with a timer
  void startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // Increment the index and loop back to 0 when it reaches the end
      if (currentIndex.value == carouselImages.length - 1) {
        currentIndex.value = 0;
      } else {
        currentIndex.value++;
      }

      pageController.animateToPage(
        currentIndex.value,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }




  @override
  void onInit() {
    super.onInit();
    // Initialize the PageController
    pageController = PageController();

    // Initial images
    carouselImages.addAll([
      'assets/images/credit score.png',
      'assets/images/New year.jpg',
      'assets/images/year resolution.jpg',
    ]);
    // Start the auto-slide timer when the controller is initialized
    startAutoSlide();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
