import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:quiz/src/core/networking/api_service.dart';
import 'package:quiz/src/core/networking/dio_factory.dart';
import 'package:quiz/src/features/main/data/question_repo.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImp(dio: dio));

  // question repository and cubit
  getIt.registerLazySingleton<QuestionRepo>(
      () => QuestionRepo(apiService: getIt()));
  getIt
      .registerLazySingleton<MainCubit>(() => MainCubit(questionRepo: getIt()));
}
