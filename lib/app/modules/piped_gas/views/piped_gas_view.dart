import 'package:demo_project/app/modules/piped_gas/controllers/piped_gas_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PipedGasView extends GetView<PipedGasController> {
  const PipedGasView({super.key});

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
              _buildAllBillers(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF007f97),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.help_outline, color: Color(0xFF007f97)),
              onPressed: () {},
            ),
            hintText: "Search Provider",
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
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

  Widget _buildAllBillers() {
    final allBillers = [
      {"logo": "assets/images/ag&p_pratham.png", "name": "AG&P Pratham - AGP CGD India Pvt Ltd"},
      {"logo": "assets/images/bhagyanagar_gas.png", "name": "Bhagyanagar Gas Limited(BGL)"},
      {"logo": "assets/images/megha_gas.jpg", "name": "Megha Gas"},
    ];

    return _buildBillersSection("All Billers", allBillers, isList: true);
  }

  Widget _buildBillersSection(String title, List<Map<String, String>> billers,
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
            itemCount: billers.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.grey),
            itemBuilder: (context, index) {
              final biller = billers[index];
              return GestureDetector(
                onTap: (){
                  // print("check navigation---------------");
                   Get.to(()=>BillersDetailsView(title: billers[index]["name"]!,));
                },
                  child: _buildBillerItem(biller["logo"]!, biller["name"]!));
            },
          )
              : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: List.generate(
                (billers.length / 3).ceil(),
                    (rowIndex) => GestureDetector(
                      onTap: (){
                        // print("check navigation---------------");
                        Get.to(()=>BillersDetailsView(title: billers[rowIndex]["name"]!,));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: billers
                        .skip(rowIndex * 3)
                        .take(3)
                        .map((biller) =>
                        BillerItem(logoPath: biller["logo"]!, billerName: biller["name"]!))
                        .toList(),
                                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillerItem(String logo, String name) {
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

class BillerItem extends StatelessWidget {
  final String logoPath;
  final String billerName;

  const BillerItem({required this.logoPath, required this.billerName, Key? key})
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
        Text(billerName, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class BillersDetailsView extends StatelessWidget {
  final String title;

  BillersDetailsView({required this.title,super.key});

  PipedGasController pipedGasController = Get.put(PipedGasController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {

            },
          ),
        ],
        title: Text(
          title,
        style: TextStyle(fontSize: 18,color: Colors.white),),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30,bottom: 16,right: 16,left: 16),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white38.withOpacity(0.9),
              boxShadow: [ BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CA Number"),
                SizedBox(height: 5),
                Form(
                  key: pipedGasController.billerDetailsFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction, // <-- Add this line
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      // hintText: "",
                      // hintStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your CA Number";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),]
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/bharat_connect.webp",
                    height: 50,
                    width: 50),
                SizedBox(width: 10),
                Text(
                    "By proceeding further, you allow PayMe to \nfetch your current and future dates and \nremind you"
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            if(!pipedGasController.billerDetailsFormKey.currentState!.validate()){

            }
          },
          child: const Text(
            "Confirm",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}


