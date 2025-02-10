import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cable_tv_controller.dart';

class CableTvView extends GetView<CableTvController> {
  const CableTvView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAllOperators(),
            ],
          ),
        ),
      ),
    );
  }
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF007f97),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.help_outline, color: Color(0xFF007f97)),
              onPressed: () {},
            ),
            hintText: "Type your Cable TV operator's Name",
            hintStyle: const TextStyle(color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      elevation: 0,
    );
  }
}

Widget _buildAllOperators() {
  final allOperators = [
    {"logo": "assets/images/au_bank.png", "name": "ACT TV"},
    {"logo": "assets/images/dhanalaxmi_bank.png", "name": "Asianet Digital"},
    {"logo": "assets/images/axis logo.png", "name": "Hathway Postpaid Digital Cable TV"},
    {"logo": "assets/images/bank of baroda.png", "name": "Paymytv - Den"},
    {"logo": "assets/images/canara bank logo.png", "name": "Paymytv - Hathway"},
    {"logo": "assets/images/dbs bank.png", "name": "UCN Cable"},
    {"logo": "assets/images/federal bank.jpg", "name": "Alka Vishwadarshan"},
    {"logo": "assets/images/hdfc bank logo.png", "name": "Ambiga Digital Vision"},
    {"logo": "assets/images/icici logo.png", "name": "Amrita Cable Network"},
    {"logo": "assets/images/idbi bank.jpg", "name": "BCN Digital"},
    {"logo": "assets/images/indian bank logo.png", "name": "Bapi Electric and Cable Network"},
    {"logo": "assets/images/indian bank logo.png", "name": "Bapi Electric and Cable Network"},
    {"logo": "assets/images/indian bank logo.png", "name": "CCNDS CABLE"},
    {"logo": "assets/images/indian bank logo.png", "name": "Cochin Cable Vision"},
    {"logo": "assets/images/indian bank logo.png", "name": "Deetech Cable Network"},
    {"logo": "assets/images/indian bank logo.png", "name": "Dreamland Cables"},
    {"logo": "assets/images/indian bank logo.png", "name": "GTPL Hathway Limited"},
    {"logo": "assets/images/indian bank logo.png", "name": "Indigital"},
    {"logo": "assets/images/indian bank logo.png", "name": "Jemari Cable Darshan"},
    {"logo": "assets/images/indian bank logo.png", "name": "Laxmimata Cable Network"},
    {"logo": "assets/images/indian bank logo.png", "name": "M M Communication"},
  ];
  return _buildOperatorSection("All Operators", allOperators, isList: true);
}

Widget _buildOperatorSection(String title, List<Map<String, String>> banks,
    {bool isList = false}) {
  dynamic operator;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.grey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        isList
            ? ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: banks.length,
          separatorBuilder: (_, __) => const Divider(color: Colors.grey),
          itemBuilder: (context, index) {
            final bank = banks[index];
            return _buildOperatorItem(bank["logo"]!, bank["name"]!);
          },
        )
            : Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: List.generate(
              (banks.length / 3).ceil(),
                  (rowIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: banks
                    .skip(rowIndex * 3)
                    .take(3)
                    .map((bank) =>
                    OperatorItem(logoPath: operator["logo"]!, operatorName: operator["name"]!))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildOperatorItem(String logo, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(logo),
        ),
        const SizedBox(width: 14),
        Text(name),
      ],
    ),
  );
}

class OperatorItem extends StatelessWidget {
  final String logoPath;
  final String operatorName;

  const OperatorItem({required this.logoPath, required this.operatorName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(logoPath),
        ),
        const SizedBox(height: 8),
        Text(operatorName, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}