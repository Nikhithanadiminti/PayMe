import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_repayment_controller.dart';
import 'loan_account_details.dart';

class LoanRepaymentView extends StatelessWidget {
  final LoanRepaymentController controller = Get.put(LoanRepaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      appBar: AppBar(
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
              hintText: "Search lender",
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
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel Section
              SizedBox(
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.carouselImages.length,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        controller.carouselImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Dots Indicator
              Obx(() =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.carouselImages.length,
                          (index) =>
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentIndex.value == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                    ),
                  )),
              SizedBox(height: 10),
              // Filter by category with BottomSheet
              GestureDetector(
                onTap: () {
                  _showFilterBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Text("Filter by category"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "All Loan Billers",
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> LoanAccountDetails());
                      },
                      child: ListView.separated(
                        padding: EdgeInsets.only(left: 12),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: Image.asset("assets/images/bajaj_finserv.jpg"),
                                ),
                                SizedBox(width: 14),
                                Text("Bajaj Finserv")
                              ],
                            );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    final List<String> filterOptions = [
      "Microfinance Institutions (MFI)",
      "Vehicle Loan",
      "Gold Loan",
      "Small Finance Bank",
      "Consumer Loan",
      "Bank",
      "Home Loan",
      "Others"
    ];

    Map<String, bool> selectedFilters = {
      for (var option in filterOptions) option: false
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Allows the BottomSheet to expand based on content
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: Container(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Filter by category",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // Prevent scrolling conflicts
                        itemCount: filterOptions.length,
                        itemBuilder: (context, index) {
                          final option = filterOptions[index];
                          return CheckboxListTile(
                            title: Text(option),
                            value: selectedFilters[option],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedFilters[option] = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF007f97),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Apply Filters",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}