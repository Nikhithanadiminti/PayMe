import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_new_credit_card_controller.dart';

class AddNewCreditCardView extends GetView<AddNewCreditCardController> {
  const AddNewCreditCardView({super.key});

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
              _buildCarousel(),
              const SizedBox(height: 20),
              _buildPopularBanks(),
              const SizedBox(height: 20),
              _buildAllBanks(),
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
            hintText: "Search banks",
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

  Widget _buildCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.carouselImages.length,
            onPageChanged: (index) {
              controller.currentIndex.value = index;
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.asset(
                  controller.carouselImages[index],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.carouselImages.length,
                  (index) => Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentIndex.value == index
                      ? const Color(0xFF007f97)
                      : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPopularBanks() {
    final banks = [
      {"logo": "assets/images/axis logo.png", "name": "Axis Bank"},
      {"logo": "assets/images/hdfc bank logo.png", "name": "HDFC Bank"},
      {"logo": "assets/images/sbi logo.png", "name": "SBI Bank"},
      {"logo": "assets/images/icici logo.png", "name": "ICICI Bank"},
      {"logo": "assets/images/federal bank.jpg", "name": "Federal Bank"},
      {"logo": "assets/images/kotak bank logo.png", "name": "Kotak Bank"},
    ];

    return _buildBankSection("Popular Banks", banks);
  }

  Widget _buildAllBanks() {
    final allBanks = [
      {"logo": "assets/images/au_bank.png", "name": "AU Small Finance Bank"},
      {"logo": "assets/images/dhanalaxmi_bank.png", "name": "Dhanalaxmi Bank"},
      {"logo": "assets/images/axis logo.png", "name": "Axis Bank"},
      {"logo": "assets/images/bank of baroda.png", "name": "Bank of Baroda"},
      {"logo": "assets/images/canara bank logo.png", "name": "Canara Bank"},
      {"logo": "assets/images/dbs bank.png", "name": "DBS Bank"},
      {"logo": "assets/images/federal bank.jpg", "name": "Federal Bank"},
      {"logo": "assets/images/hdfc bank logo.png", "name": "HDFC Bank"},
      {"logo": "assets/images/icici logo.png", "name": "ICICI Bank"},
      {"logo": "assets/images/idbi bank.jpg", "name": "IDBI Bank"},
      {"logo": "assets/images/indian bank logo.png", "name": "Indian Bank"},
    ];

    return _buildBankSection("All Banks", allBanks, isList: true);
  }

  Widget _buildBankSection(String title, List<Map<String, String>> banks,
      {bool isList = false}) {
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
              return _buildBankItem(bank["logo"]!, bank["name"]!);
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
                      BankItem(logoPath: bank["logo"]!, bankName: bank["name"]!))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankItem(String logo, String name) {
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
}

class BankItem extends StatelessWidget {
  final String logoPath;
  final String bankName;

  const BankItem({required this.logoPath, required this.bankName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(logoPath),
        ),
        const SizedBox(height: 8),
        Text(bankName, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}


