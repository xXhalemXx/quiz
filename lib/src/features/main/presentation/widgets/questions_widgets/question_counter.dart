import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

class QuestionCounter extends StatelessWidget {
  const QuestionCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return PageView.builder(
            itemCount: state
                .allTopicsAndQuestions[state.selectedTopicIndex]['questions']
                .length,
            controller: getIt<MainCubit>().pageController,
            onPageChanged: (index) {
              getIt<MainCubit>().selectQuestion(index);
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: getIt<MainCubit>().pageController,
                builder: (context, _) {
                  return _counterCard(
                      index: index,
                      isAnswered: state.answers[index] != -1,
                      showCorrectAnswer: state.showAnswers,
                      isCorrectAnswer:
                          state.answers[index] == state.correctAnswers[index]);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _counterCard(
      {required int index,
      required bool isAnswered,
      required bool isCorrectAnswer,
      required bool showCorrectAnswer}) {
    return Center(
      child: SizedBox(
        height: Curves.easeOut
                .transform(getIt<MainCubit>().getPageValue(index: index)) *
            150.h,
        width: Curves.easeOut
                .transform(getIt<MainCubit>().getPageValue(index: index)) *
            150.w,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            gradient: showCorrectAnswer
                ? null
                : isAnswered
                    ? null
                    : const LinearGradient(
                        colors: [AppColor.royalBlue, AppColor.skyBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
            color: showCorrectAnswer
                ? isCorrectAnswer
                    ? AppColor.green
                    : AppColor.red
                : isAnswered
                    ? AppColor.yellow
                    : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: AppTextStyles.interFont96DeepBlue100ExtraBold1.copyWith(
                  fontSize:
                      getIt<MainCubit>().getPageValue(index: index) * 80.sp),
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    );
  }
}
