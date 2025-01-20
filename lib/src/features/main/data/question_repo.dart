import 'package:quiz/src/core/models/questions_model.dart';
import 'package:quiz/src/core/networking/api_service.dart';

class QuestionRepo {
  final ApiService apiService;
  QuestionRepo({required this.apiService});
  Future<Questions> getQuestions() async {
    return apiService.getQuestions();
  }
}
