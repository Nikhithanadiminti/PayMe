import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/additional_details_controller.dart';

class AdditionalDetailsView extends GetView<AdditionalDetailsController> {
  const AdditionalDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdditionalDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdditionalDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
