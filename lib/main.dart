import 'package:demo_project/app/modules/add_upi_id/controllers/add_upi_id_controller.dart';
import 'package:demo_project/app/modules/add_upi_number/controllers/add_upi_number_controller.dart';
import 'package:demo_project/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:demo_project/app/modules/footer/controllers/footer_controller.dart';
import 'package:demo_project/app/modules/qr_code_scanner/controllers/qr_code_scanner_controller.dart';
import 'package:demo_project/app/modules/scanned_payment_details/controllers/scanned_payment_details_controller.dart';
import 'package:demo_project/app/modules/select_receiver_bank_account/controllers/select_receiver_bank_account_controller.dart';
import 'package:demo_project/app/modules/to_bank_upi_id/controllers/to_bank_upi_id_controller.dart';
import 'package:demo_project/app/modules/to_mobile_no/controllers/to_mobile_no_controller.dart';
import 'package:demo_project/app/modules/to_mobile_num_payment_details/controllers/to_mobile_num_payment_details_controller.dart';
import 'package:demo_project/app/modules/to_self_account/controllers/to_self_account_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(FooterController());
  Get.put(DashboardController());
  Get.put(SelectReceiverBankAccountController());
  Get.put(ToBankUpiIdController());
  Get.put(ToSelfAccountController());
  Get.put(AddUpiIdController());
  Get.put(AddUpiNumberController());
  Get.put(QrCodeScannerController());
  Get.put(ScannedPaymentDetailsController());
  Get.put(ToMobileNoController());
  Get.put(ToMobileNumPaymentDetailsController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
