import 'package:flutter/material.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Error',
        style: AppTextStyles.interFont20Red100Medium1_1,
      ),
      content: Text(
        errorMessage,
        style: AppTextStyles.interFont16Black100Medium1,
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            getIt<MainCubit>().getQuestions(context: context);
          },
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
