import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/core/models/questions_model.dart';
import 'package:quiz/src/core/networking/network_exceptions.dart';
import 'package:quiz/src/core/widgets/app_alert_dialog.dart';
import 'package:quiz/src/features/main/data/question_repo.dart';
import 'package:quiz/src/features/main/presentation/widgets/questions_widgets/result_dialog.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.questionRepo}) : super(const MainState());
  final QuestionRepo questionRepo;
  late PageController pageController;

  Future<void> getQuestions({required BuildContext context}) async {
    Questions response = await questionRepo.getQuestions();
    List<Map<String, dynamic>> allTopicsAndQuestions = [];
    try {
      allTopicsAndQuestions
          .add({'topic': response.topic, 'questions': response.questions});
      emit(state.copyWith(
          allTopicsAndQuestions: allTopicsAndQuestions, isLoading: false));
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppAlertDialog(
            errorMessage: NetworkExceptions.getDioExceptionMessage(e),
          );
        },
      );
    }
  }

  void setSelectTopicIndex(int index) {
    // set page controller
    pageController = PageController(viewportFraction: 0.37);
    // we fill selected topic answers and correct answers list list with -1
    List<int> answers =
        List.filled(state.allTopicsAndQuestions[index]['questions'].length, -1);
    List<int> correctAnswers =
        List.filled(state.allTopicsAndQuestions[index]['questions'].length, -1);
    emit(
      state.copyWith(
        selectedTopicIndex: index,
        answers: answers,
        correctAnswers: correctAnswers,
      ),
    );
  }

  void setAnswer(int index, int answer) {
    List<int> answers = state.answers;
    List<int> correctAnswers = state.correctAnswers;
    answers[index] = answer;
    // set correct answer
    Question question = state.allTopicsAndQuestions[state.selectedTopicIndex]
        ['questions'][index];
    for (int i = 0; i < question.options.length; i++) {
      if (question.options[i].isCorrect) {
        correctAnswers[index] = i;
      }
    }

    // check if all answers are selected
    if (!answers.contains(-1)) {
      emit(state.copyWith(
          answers: answers,
          isAllAnswered: true,
          selectedAnswer: answer,
          correctAnswers: correctAnswers));
    } else {
      emit(state.copyWith(
          answers: answers,
          isAllAnswered: false,
          selectedAnswer: answer,
          correctAnswers: correctAnswers));
    }
  }

  void selectQuestion(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
    emit(state.copyWith(
        currentQuestionIndex: index, selectedAnswer: state.answers[index]));
  }

  // for page counter animation
  double getPageValue({required int index}) {
    double value = 0.0;
    if (pageController.position.haveDimensions) {
      value = pageController.page! - index;
      value = (1 - (value.abs() * 0.5)).clamp(0.5, 1.0);
    } else {
      value = (index - pageController.initialPage).toDouble();
      value = (1 - (value.abs() * 0.5)).clamp(0.5, 1.0);
    }

    return value;
  }

  void submitAnswer({required BuildContext context}) {
    if (state.isAllAnswered) {
      // get use performance
      int correctAnswers = 0;

      // calculate correct answers
      for (int i = 0; i < state.answers.length; i++) {
        if (state.answers[i] == state.correctAnswers[i]) {
          correctAnswers++;
        }
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ResultDialog(
            correctAnswers: correctAnswers,
            totalQuestions: state.answers.length,
            resultColor:
                _getPerformanceColor(correctAnswers, state.answers.length),
            userPerformance:
                _getPerformanceMessage(correctAnswers, state.answers.length),
          );
        },
      );
    } else {
      // check if any question is not answered after the current question
      for (int i = state.currentQuestionIndex + 1;
          i < state.answers.length;
          i++) {
        if (state.answers[i] == -1) {
          selectQuestion(i);
          return;
        }
      }
      // check if any question is not answered before the current question
      for (int i = 0; i <= state.currentQuestionIndex; i++) {
        if (state.answers[i] == -1) {
          selectQuestion(i);
          return;
        }
      }
    }
  }

  void viewResult() {
    emit(state.copyWith(showAnswers: true));
  }

  void reset() {
    pageController.dispose();
    emit(
      state.copyWith(
        selectedTopicIndex: 0,
        currentQuestionIndex: 0,
        isAllAnswered: false,
        answers: [],
        selectedAnswer: -1,
        showAnswers: false,
        correctAnswers: [],
      ),
    );
  }

  Color _getPerformanceColor(int correctAnswers, int totalQuestions) {
    double percentage = correctAnswers / totalQuestions;
    if (percentage >= 0.8) return AppColor.green;
    if (percentage >= 0.5) return AppColor.yellow;
    return AppColor.red;
  }

  String _getPerformanceMessage(int correctAnswers, int totalQuestions) {
    double percentage = correctAnswers / totalQuestions;
    if (percentage >= 0.8) return 'Fantastic job! You nailed it! 🥳';
    if (percentage >= 0.5) return 'Good effort! Keep going! 😊';
    return 'Don\'t give up! Keep practicing! 😔';
  }
}
