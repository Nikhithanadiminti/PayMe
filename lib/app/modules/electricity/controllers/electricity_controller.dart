import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectricityController extends GetxController {
  //TODO: Implement WaterController


  RxList<Map<String,String>> allBillers = <Map<String,String>>[].obs;

  RxList<Map<String,String>> filterBillersList = [
    {"logo": "assets/images/npdcl.webp", "name": "Northern Power Distribution Company of Telangana Ltd. (NPDCL)","textFieldName": "USC Number"},
    {"logo": "assets/images/spdcl.jpg", "name": "Southern Power Distribution Company of Telangana Ltd. (SPDCL)","textFieldName": "Unique Service Number"},
    {"logo": "assets/images/adani_electricity.png", "name": "Adani Electricity Mumbai Limited","textFieldName": "Account Number"},
    {"logo": "assets/images/besl.png", "name": "Bharatpur Electricity Services Ltd (BESL)","textFieldName": "K Number"},
    {"logo": "assets/images/apcpdcl.jpg", "name": "Central Power Distribution Company Ltd of Andhra Pradesh (APCPDCL)","textFieldName": "Service Number"},
    {"logo": "assets/images/dgvcl.jpg", "name": "Dakshin Gujarat Vij (DGVCL)","textFieldName": "Consumer Number"},
    {"logo": "assets/images/Electricity-Department-Nagaland.png", "name": "Department of Power Nagaland","textFieldName": "Consumer Number"},
    {"logo": "assets/images/Electricity Department Chandigarh.jpg", "name": "Electricity Department Chandigarh","textFieldName": "Account Number without(/)"},
    {"logo": "assets/images/gift.png", "name": "Gift Power Company Limited","textFieldName": "Consumer Number"},
    {"logo": "assets/images/ged.png", "name": "Goa Electricity Department (GED)","textFieldName": "Contract Account Number"},
    {"logo": "assets/images/lpdd.png", "name": "Ladakh Power Development Department (LPDD)","textFieldName": "Consumer Number"},
    {"logo": "assets/images/pgvcl.jpg", "name": "Paschim Gujarat Vij (PGVCL)","textFieldName": "Consumer Number"},
    {"logo": "assets/images/Electricity-Department-Sikkim.png", "name": "Sikkim Power Urban","textFieldName": "Contract Account  Number"},
    {"logo": "assets/images/ttd.png", "name": "TTD Electricity","textFieldName": "Connection Number"},
  ].obs;
  GlobalKey<FormState> billerDetailsFormKey = GlobalKey<FormState>();
  Rx<TextEditingController> searchElectricityBillerCon = TextEditingController().obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    allBillers.assignAll(filterBillersList);
  }

  void searchElectricityBillers(String query) {
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
