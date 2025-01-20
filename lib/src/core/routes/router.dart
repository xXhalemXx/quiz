library route_pages;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';
import 'package:quiz/src/features/main/presentation/pages/question_page.dart';
import 'package:quiz/src/features/main/presentation/pages/topics_page.dart';
import '/src/core/error/error.dart';
import 'routes.dart';

class AppRoute {
  static const initial = RoutesName.initial;

  static get builder => null;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<MainCubit>(),
            child: const TopicsPage(),
          ),
        );
      case RoutesName.topics:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<MainCubit>(),
            child: const TopicsPage(),
          ),
        );
      case RoutesName.questions:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<MainCubit>(),
            child: const QuestionPage(),
          ),
        );

      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
