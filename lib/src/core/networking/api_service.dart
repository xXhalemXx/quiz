import 'package:dio/dio.dart';
import 'package:quiz/src/core/constants/app_strings.dart';
import 'package:quiz/src/core/models/questions_model.dart';

abstract class ApiService {
  Future<Questions> getQuestions();
}

class ApiServiceImp implements ApiService {
  final Dio dio;

  ApiServiceImp({required this.dio});

  @override
  Future<Questions> getQuestions() async {
    Response<Map<String, dynamic>> response =
        await dio.get('${AppStrings.baseUrl}/Uw5CrX');
    return Questions.fromJson(response.data!);
  }
}
