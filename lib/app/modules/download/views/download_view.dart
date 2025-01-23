import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../help/views/help_view.dart';

class DownloadStatement extends StatefulWidget {
  const DownloadStatement({super.key});

  @override
  State<DownloadStatement> createState() => _DownloadStatementState();
}

class _DownloadStatementState extends State<DownloadStatement> {
  String? _selectedRange = "Last 30 Days"; // Default selected option for Range
  String? _selectedFY = "Current FY"; // Default selected option for Financial Year

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(110),
          child: Column(
            children: [
              AppBar(
                leading: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(
                      Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Download Statement",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xFF007f97),
                actions: [
                  IconButton(
                    icon: Icon(Icons.help_outline),
                    color: Colors.white,
                    onPressed: () {
                      // Navigate to the Help screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Help()),
                      // );
                      Get.to(()=> HelpView());
                    },
                  ),
                ],
              ),
              SizedBox(height: 5),
              TabBar(
                indicatorColor: Color(0xFF007f97),
                labelColor: Color(0xFF007f97),
                dividerHeight: 1,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: "Range",),
                  Tab(text: "Financial Year"),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Range Tab Content
            RangeTab(
              selectedRange: _selectedRange,
              onRangeSelected: (value) {
                setState(() {
                  _selectedRange = value;
                });
              },
            ),
            // Financial Year Tab Content
            FinancialYearTab(
              selectedFY: _selectedFY,
              onFYSelected: (value) {
                setState(() {
                  _selectedFY = value;
                });
              },
            ),
          ],
        ),
        bottomNavigationBar:
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF007f97),
              padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
              onPressed: (){

          },
              child: Text("DOWNLOAD",style: TextStyle(fontSize: 17,color: Colors.white),)),
        ),
      ),
    );
  }
}

class RangeTab extends StatelessWidget {
  final String? selectedRange;
  final Function(String?) onRangeSelected;

  const RangeTab({
    super.key,
    required this.selectedRange,
    required this.onRangeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        SizedBox(height: 0,),
        RadioListTile<String>(
          title: Text("Last 30 Days"),
          activeColor: Color(0xFF007f97),
          value: "Last 30 Days",
          groupValue: selectedRange,
          onChanged: onRangeSelected,
        ),
        Spacer(),
        RadioListTile<String>(
          title: Text("Last 90 Days"),
          activeColor: Color(0xFF007f97),
          value: "Last 90 Days",
          groupValue: selectedRange,
          onChanged: onRangeSelected,
        ),
        RadioListTile<String>(
          title: Text("Last 180 Days"),
          activeColor: Color(0xFF007f97),
          value: "Last 180 Days",
          groupValue: selectedRange,
          onChanged: onRangeSelected,
        ),
        RadioListTile<String>(
          title: Text("Last 365 Days"),
          activeColor: Color(0xFF007f97),
          value: "Last 365 Days",
          groupValue: selectedRange,
          onChanged: onRangeSelected,
        ),
        RadioListTile<String>(
          title: Text("Select Date Range (Calendar)"),
          activeColor: Color(0xFF007f97),
          value: "Select Date Range",
          groupValue: selectedRange,
          onChanged: (value) {
            if (value == "Select Date Range") {
              showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              ).then((dateRange) {
                if (dateRange != null) {
                  onRangeSelected("Selected: ${dateRange.start} - ${dateRange.end}");
                }
              });
            } else {
              onRangeSelected(value);
            }
          },
        ),
      ],
    );
  }
}

class FinancialYearTab extends StatelessWidget {
  final String? selectedFY;
  final Function(String?) onFYSelected;

  const FinancialYearTab({
    super.key,
    required this.selectedFY,
    required this.onFYSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        RadioListTile<String>(
          title: Text("Current FY"),
          activeColor: Color(0xFF007f97),
          value: "Current FY",
          groupValue: selectedFY,
          onChanged: onFYSelected,
        ),
        RadioListTile<String>(
          title: Text("FY 2023-2024"),
          activeColor: Color(0xFF007f97),
          value: "FY 2023-2024",
          groupValue: selectedFY,
          onChanged: onFYSelected,
        ),
        RadioListTile<String>(
          title: Text("FY 2022-2023"),
          activeColor: Color(0xFF007f97),
          value: "FY 2022-2023",
          groupValue: selectedFY,
          onChanged: onFYSelected,
        ),
        RadioListTile<String>(
          title: Text("FY 2021-2022"),
          activeColor: Color(0xFF007f97),
          value: "FY 2021-2022",
          groupValue: selectedFY,
          onChanged: onFYSelected,
        ),
      ],
    );
  }
}