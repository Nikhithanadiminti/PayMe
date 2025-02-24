import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WaterController extends GetxController {
  //TODO: Implement WaterController


  RxList<Map<String,String>> allBillers = <Map<String,String>>[].obs;

  RxList<Map<String,String>> filterBillersList = [
    {"logo": "assets/images/hmwssb.jpg", "name": "Hyderabad Metropolitan Water Supply and Sewerage Board","textFieldName": "CAN Number"},
    {"logo": "assets/images/gmwc.jpg", "name": "Greater Warangal Municipal Corporation - Water","textFieldName": "CONNECTION ID"},
    {"logo": "assets/images/bwssb.jpg", "name": "Bangalore Water Supply and Sewerage Board","textFieldName": "RR Number"},
    {"logo": "assets/images/phed.jpg", "name": "PHED - Rajasthan","textFieldName": "Emitra CID Code"},
    {"logo": "assets/images/kwa.jpg", "name": "Kerela Water Authority (KWA)","textFieldName": "Consumer ID"},
    {"logo": "assets/images/cmwssb.jpg", "name": "Chennai Metropolitan Water Supply and Sewerage Board","textFieldName": "Bill Number"},
  ].obs;
  GlobalKey<FormState> billerDetailsFormKey = GlobalKey<FormState>();
  Rx<TextEditingController> searchWaterBillerCon = TextEditingController().obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    allBillers.assignAll(filterBillersList);
  }

  void searchWaterBillers(String query) {
    if (query.isEmpty) {
      filterBillersList.assignAll(allBillers);
    } else {
      filterBillersList.assignAll(allBillers.where((biller) {
        return biller["name"]!.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
    filterBillersList.refresh();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
