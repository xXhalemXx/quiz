import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/core/widgets/app_button.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// first container to add border around button
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return AppButton(
          width: 80,
          height: 35,
          onTap: () {
            if (state.showAnswers) {
              Navigator.pop(context);
            } else {
              getIt<MainCubit>().submitAnswer(context: context);
            }
          },
          child: Text(
            state.showAnswers
                ? 'Exit'
                : state.isAllAnswered
                    ? 'Submit'
                    : 'Next',
            style: AppTextStyles.interFont16White100Medium1,
          ),
        );
      },
    );
  }
}
