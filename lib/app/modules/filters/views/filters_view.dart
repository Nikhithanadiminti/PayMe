import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FiltersView(),
    );
  }
}

class FiltersView extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersView> {
  Map<String, List<String>> filterOptions = {
    'Months': [
      'Jan 2025',
      'Dec 2024',
      'Nov 2024',
      'Oct 2024',
      'Sep 2024',
      'Aug 2024',
      'Jul 2024',
      'Jun 2024',
      'May 2024',
      'Apr 2024',
      'Mar 2024',
    ],
    'Categories': [
      'Money Sent',
      'Money Received',
      'Self Transfers',
      'Recharge & Bill Payments',
      'Merchant Payments',
      'Refunds',
      'Gold & Silver'
    ],
    'Instruments': ['UPI/Bank Account'],
    'Payment Status': ['Failed', 'Successful'],
    'Payment Types': ['Autopay', 'IPO & External Autopay'],
  };

  Map<String, bool> expandedSections = {
    'Months': false,
    'Categories': false,
    'Instruments': false,
    'Payment Status': false,
    'Payment Types': false,
  };

  Map<String, List<bool>> selectedFilters = {};

  @override
  void initState() {
    super.initState();
    // Initialize selected filters with false
    filterOptions.forEach((key, options) {
      selectedFilters[key] = List<bool>.filled(options.length, false);
    });
  }

  // Method to check if the "Apply" button should be enabled
  bool isApplyButtonEnabled() {
    return selectedFilters.values.any((list) => list.contains(true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007f97),
        title: Text(
          'Filters',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedFilters.forEach((key, value) {
                  selectedFilters[key] =
                  List<bool>.filled(selectedFilters[key]!.length, false);
                });
              });
            },
            child: Text(
              'Clear All',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: filterOptions.entries.map((entry) {
            final section = entry.key;
            final options = entry.value;
            return ExpansionTile(
              initiallyExpanded: expandedSections[section] ?? false,
              title: Text(
                section,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: options.asMap().entries.map((optionEntry) {
                final index = optionEntry.key;
                final option = optionEntry.value;
                return CheckboxListTile(
                  value: selectedFilters[section]![index],
                  onChanged: (value) {
                    setState(() {
                      selectedFilters[section]![index] = value ?? false;
                    });
                  },
                  title: Text(option),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: isApplyButtonEnabled() ? Color(0xFF007f97) : Colors.grey,
        child: TextButton(
          onPressed: isApplyButtonEnabled()
              ? () {
            print("Filters Applied");
          }
              : null,
          child: Text(
            'APPLY',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
