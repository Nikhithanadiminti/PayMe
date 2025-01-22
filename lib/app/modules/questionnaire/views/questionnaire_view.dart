import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/questionnaire_controller.dart';

class QuestionnaireView extends GetView<QuestionnaireController> {
  const QuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionnaireController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 0, // Remove the shadow
      ),

      body: Obx(() {
        final currentIndex = controller.currentQuestionIndex.value;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress bar
                    LinearProgressIndicator(
                      value: (currentIndex + 1) / 8,
                      backgroundColor: Colors.grey[300],
                      color: Colors.green,
                    ),
                    SizedBox(height: 8),

                    // Question number
                    Text(
                      'Question ${currentIndex + 1} of 8',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16),

                    // Question title
                    Text(
                      _getQuestionTitle(currentIndex),
                      style: TextStyle(fontSize: 38, color: Colors.grey),
                    ),
                    Text(
                      'This information will be used for personalizing your experience & services across PayMe Platform.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 25),

                    // Question description
                    Text(
                      _getQuestionDescription(currentIndex),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),

                    // Question options
                    Column(
                      children: _buildOptions(currentIndex),
                    ),
                  ],
                ),
              ),
            ),
            // Footer with buttons
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                children: [
                  // Cancel Button with equal width, styled as text
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.back(); // Navigate back to the previous screen
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 23,
                          color: Color(0xFF007f97), // Text color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Space between the two buttons

                  // Next Button with equal width
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.nextQuestion(); // Call to move to the next question
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF007f97), // Set background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // Get question title based on index
  String _getQuestionTitle(int index) {
    switch (index) {
      case 0:
        return 'House Ownership';
      case 1:
        return 'Car Ownership';
      case 2:
        return '2-Wheeler Ownership';
      case 3:
        return 'Annual Income';
      case 4:
        return 'Occupation';
      case 5:
        return 'Earning Members';
      case 6:
        return 'Insurances';
      case 7:
        return 'Investments';
      default:
        return '';
    }
  }



  // Get question description based on index
  String _getQuestionDescription(int index) {
    switch (index) {
      case 0:
        return 'Do you own or rent your current residence?';
      case 1:
        return 'Do you own a car?';
      case 2:
        return 'Do you own a 2-Wheeler?';
      case 3:
        return 'Please tell us your annual income.';
      case 4:
        return 'What is your occupation?';
      case 5:
        return 'Who are the earning member(s) in your household?';
      case 6:
        return 'What insurance policies have you purchased till date?';
      case 7:
        return 'Where do you prefer investing?';
      default:
        return '';
    }
  }

  List<Widget> _buildOptions(int index) {
    List<String> options = [];
    List<Widget> optionWidgets = [];

    // Define options for each question
    switch (index) {
      case 0:
        options = ['Owned', 'Rented'];
        break;
      case 1:
        options = ['Yes', 'No'];
        break;
      case 2:
        options = ['Yes', 'No'];
        break;
      case 3:
        options = ['Less than 5 Lakhs', '5-10 Lakhs', '10-15 Lakhs', '15-25 Lakhs', '25-50 Lakhs' 'More than 50 Lakhs'];
        break;
      case 4:
        options = ['Salaried Employee', 'Business Owner', 'Student', 'Homemaker','Part-Time Employee','Daily Wage Worker','Retired', 'Other'];
        break;
      case 5:
        options = ['Self', 'Spouse', 'Children', 'Parents / In-laws','Siblings','Friends', 'Others'];
        break;
      case 6:
        options = [ 'Life Insurance', 'Health Insurance', 'Vehicle Insurance', 'Travel Insurance','Others', 'Never purchased an insurance'];
        break;
      case 7:
        options = ['Stocks', 'Mutual Funds', 'Real Estate','Public Provident Fund (PPF)', 'Bulion Commodity (Gold/Silver)','Fixed Deposits','Bonds/SGBs','Unit Linked Insurance Plans(ULIP)','Bank Savings','Chit Funds', 'Others'];
        break;
    }

    // Build options with icons and dividers
    for (int i = 0; i < options.length; i++) {
      Widget optionWidget = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Add custom icons for questions 1 and 7 only
              _shouldShowIcons(index) ? _getOptionIcon(options[i]) : Container(),
              SizedBox(width: 8),
              Text(options[i]),
            ],
          ),
          Radio<String>(
            value: options[i],
            groupValue: controller.answers[index],
            onChanged: (String? value) {
              controller.answers[index] = value ?? '';
            },
          ),
        ],
      );

      // Add divider below each option except for the last one
      optionWidgets.add(optionWidget);
      if (i != options.length - 1) {
        optionWidgets.add(Divider());
      }
    }

    return optionWidgets;
  }

  // Method to get the icon based on the option
  Icon _getOptionIcon(String option) {
    switch (option) {
      case 'Owned':
        return Icon(Icons.home, color: Colors.blue); // Icon for "Owned"
      case 'Rented':
        return Icon(Icons.home_outlined, color: Colors.orange); // Icon for "Rented"
      case 'Never purchased an insurance':
        return Icon(Icons.remove_circle_outline, color: Colors.red); // Icon for "Never purchased insurance"
      case 'Health Insurance':
        return Icon(Icons.local_hospital, color: Colors.blue); // Icon for "Health Insurance"
      case 'Life Insurance':
        return Icon(Icons.shield, color: Colors.green); // Icon for "Life Insurance"
      case 'Vehicle Insurance':
        return Icon(Icons.directions_car, color: Colors.blue); // Icon for "Vehicle Insurance"
      case 'Travel Insurance':
        return Icon(Icons.airplanemode_active, color: Colors.orange); // Icon for "Travel Insurance"
      case 'Others':
        return Icon(Icons.more_horiz, color: Colors.grey); // Icon for "Others"
      default:
        return Icon(Icons.help_outline, color: Colors.grey); // Default Icon for unknown options
    }
  }

  bool _shouldShowIcons(int index) {
    return index == 0 || index == 6; // Only show icons for questions 1 and 7
  }
}


