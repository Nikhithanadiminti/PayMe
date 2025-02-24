import 'package:demo_project/app/modules/broadband_landline/controllers/broadband_landline_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BroadbandLandlineView extends GetView<BroadbandLandlineController> {
  const BroadbandLandlineView({super.key});


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
    final broadbandLandlineController = Get.put(BroadbandLandlineController());

    return AppBar(
      backgroundColor: Color(0xFF007f97),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value){
            broadbandLandlineController.searchBillers(value);
          },
          controller: broadbandLandlineController.searchController.value,
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
    return Obx(()=> _buildBillersSection("Billers in Telangana", controller.filteredBillers, isList: true));
  }

  Widget _buildBillersSection(String title, List<Map<String, dynamic>> billers,
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
          billers.isEmpty
          ? Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "No billers found"
              ),
            ),
          ) :
          isList
              ? ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: billers.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.grey),
            itemBuilder: (context, index) {
              final biller = billers[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => BillersDetailsView(title: billers[index]["name"]!, textFieldFormKey: billers[index]["formKey"],),  );
                },
                child: _buildBillerItem(biller["logo"]!, biller["name"]!),
              );
            },
          )
              : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: List.generate(
                (billers.length / 3).ceil(),
                    (rowIndex) => GestureDetector(
                  onTap: () {
                    Get.to(() => BillersDetailsView(title: billers[rowIndex]["name"]!, textFieldFormKey: billers[rowIndex]["formKey"],),);
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
  final GlobalKey<FormState> textFieldFormKey;


  BillersDetailsView({
    required this.title,
    required this.textFieldFormKey,
    super.key});

  @override
  Widget build(BuildContext context) {
    BroadbandLandlineController  broadbandLandlineController = Get.put(BroadbandLandlineController());

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 16, right: 16, left: 16),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white38.withOpacity(0.9),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Telephone Number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 12),
                Obx(()=>
                   Form(
                     key: textFieldFormKey,
                     child: TextFormField(
                      controller: broadbandLandlineController.telephoneController.value,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value.toString().isEmpty){
                          return "Telephone Number is required";
                        } else if(value!.length < 6 || value.length > 10){
                          return "Telephone Number must be between 6 to 10";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Enter the number',
                      ),
                                       ),
                   ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/bharat_connect.webp",
                    height: 50,
                    width: 50),
                SizedBox(width: 10),
                Text(
                    "By proceeding further, you allow PayMe \nto fetch your current and future dates and \nremind you"
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
                 backgroundColor: Colors.blueGrey,),
            onPressed: (){
              broadbandLandlineController.onConfirmOfActFibernet();
            }, child: Text(
          "CONFIRM",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
        )),
      ),
    );
  }
}
