import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/core/helpers/spacing.dart';
import 'package:quiz/src/core/models/questions_model.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

class QuestionDetails extends StatelessWidget {
  const QuestionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        Question question =
            state.allTopicsAndQuestions[state.selectedTopicIndex]['questions']
                [state.currentQuestionIndex];
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // question number
                  Text(
                    'Question: ${state.currentQuestionIndex + 1}/${state.allTopicsAndQuestions[state.selectedTopicIndex]['questions'].length}',
                    style: AppTextStyles.interFont20DeepBlue100regular1,
                  ),
                  // question text
                  Text(
                    question.description,
                    style: AppTextStyles.interFont20White100Medium1_1,
                  ),
                  verticalSpace(height: 10),
                  // question options
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      question.options.length,
                      (index) => _questionOption(
                        text: question.options[index].description,
                        isSelected:
                            state.answers[state.currentQuestionIndex] == index,
                        onTap: () {
                          if (state.showAnswers) return;
                          getIt<MainCubit>()
                              .setAnswer(state.currentQuestionIndex, index);
                        },
                        showAnswers: state.showAnswers,
                        isCorrect:
                            state.correctAnswers[state.currentQuestionIndex] ==
                                index,
                      ),
                    ),
                  ),
                  // question detailed solution
                  verticalSpace(height: 10.h),
                  Visibility(
                    visible: state.showAnswers &&
                        state.answers[state.currentQuestionIndex] !=
                            state.correctAnswers[state.currentQuestionIndex],
                    child: state.showAnswers
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                              'The correct answer is ${question.options[state.correctAnswers[state.currentQuestionIndex]].description}',
                              style: AppTextStyles.interFont20White100Medium1_1,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _questionOption(
      {required String text,
      required bool isSelected,
      required bool showAnswers,
      required bool isCorrect,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        margin: EdgeInsets.only(bottom: 10.h, right: 5.w, left: 5.w),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: showAnswers
              ? isCorrect && isSelected
                  ? null
                  : isSelected
                      ? null
                      : const LinearGradient(
                          colors: [AppColor.skyBlue, AppColor.royalBlue],
                          stops: [-1.7, 1.7],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
              : isSelected
                  ? null
                  : const LinearGradient(
                      colors: [AppColor.skyBlue, AppColor.royalBlue],
                      stops: [-1.7, 1.7],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
          color: showAnswers
              ? isCorrect && isSelected
                  ? AppColor.green
                  : isSelected
                      ? AppColor.red
                      : null
              : isSelected
                  ? AppColor.yellow
                  : null,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.3),
              spreadRadius: 2.h,
              blurRadius: 3.h,
              offset: Offset(0, 3.h),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.interFont20White100Medium1_1,
          ),
        ),
      ),
    );
  }
}
