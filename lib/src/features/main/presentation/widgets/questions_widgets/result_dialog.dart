import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/core/helpers/spacing.dart';
import 'package:quiz/src/core/widgets/app_button.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

class ResultDialog extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final Color resultColor;
  final String userPerformance;

  const ResultDialog(
      {super.key,
      required this.correctAnswers,
      required this.totalQuestions,
      required this.resultColor,
      required this.userPerformance});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 280.h,
            width: 350.w,
            padding: EdgeInsets.all(20.w),
            decoration: _dialogShape(),
            child: _dialogContent(
                context: context,
                userPerformance: userPerformance,
                resultColor: resultColor),
          ),
          Positioned(
            top: -50.h,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: resultColor,
                  width: 6.0,
                ),
              ),
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    '$correctAnswers/$totalQuestions',
                    style: AppTextStyles.interFont16White100Medium1.copyWith(
                      color: resultColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _dialogShape() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColor.royalBlue, AppColor.skyBlue],
        stops: [0.0, 1.7],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20.r),
    );
  }

  Widget _dialogContent(
      {required BuildContext context,
      required String userPerformance,
      required Color resultColor}) {
    return Column(
      children: [
        verticalSpace(height: 50),
        Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              userPerformance,
              style: AppTextStyles.interFont16White100Medium1
                  .copyWith(color: resultColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppButton(
                width: 120,
                height: 35,
                onTap: () {
                  getIt<MainCubit>().viewResult();
                  Navigator.pop(context);
                },
                color: AppColor.green,
                child: Text(
                  'view result',
                  style: AppTextStyles.interFont16White100Medium1,
                )),
            AppButton(
                width: 80,
                height: 35,
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                color: AppColor.red,
                child: Text(
                  'Exit',
                  style: AppTextStyles.interFont16White100Medium1,
                )),
          ],
        )
      ],
    );
  }
}
