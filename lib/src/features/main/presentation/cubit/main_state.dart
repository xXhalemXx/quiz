part of 'main_cubit.dart';

class MainState extends Equatable {
  // variables to mange topics page state
  final bool isLoading;
  final List<Map<String, dynamic>> allTopicsAndQuestions;
  // variables to mange questions page state
  final int selectedTopicIndex;
  final int currentQuestionIndex;
  final int selectedAnswer;
  final bool isAllAnswered;
  final List<int> answers;
  final List<int> correctAnswers;
  final bool showAnswers;

  const MainState({
    this.isLoading = true,
    this.allTopicsAndQuestions = const [],
    this.currentQuestionIndex = 0,
    this.isAllAnswered = false,
    this.answers = const [],
    this.selectedTopicIndex = 0,
    this.selectedAnswer = -1,
    this.correctAnswers = const [],
    this.showAnswers = false,
  });

  MainState copyWith({
    bool? isLoading,
    List<Map<String, dynamic>>? allTopicsAndQuestions,
    int? currentQuestionIndex,
    bool? isAllAnswered,
    List<int>? answers,
    int? selectedTopicIndex,
    int? selectedAnswer,
    List<int>? correctAnswers,
    bool? showAnswers,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      allTopicsAndQuestions:
          allTopicsAndQuestions ?? this.allTopicsAndQuestions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isAllAnswered: isAllAnswered ?? this.isAllAnswered,
      answers: answers ?? this.answers,
      selectedTopicIndex: selectedTopicIndex ?? this.selectedTopicIndex,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      showAnswers: showAnswers ?? this.showAnswers,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        allTopicsAndQuestions,
        currentQuestionIndex,
        isAllAnswered,
        answers,
        selectedTopicIndex,
        selectedAnswer,
        correctAnswers,
        showAnswers,
      ];
}
