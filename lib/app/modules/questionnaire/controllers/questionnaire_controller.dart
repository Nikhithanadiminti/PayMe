import 'package:get/get.dart';

class QuestionnaireController extends GetxController {
  // Current question index
  var currentQuestionIndex = 0.obs;

  // Store answers for each question
  var answers = List<String>.filled(8, '', growable: false).obs;

  // Method to move to the next question
  void nextQuestion() {
    if (currentQuestionIndex.value < 7) {
      currentQuestionIndex.value++;  // Move to the next question
    }
  }

  // Method to go back to the previous question
  void prevQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;  // Move to previous question
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
