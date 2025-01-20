import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/constants/colors.dart';
import 'package:quiz/src/core/helpers/spacing.dart';
import 'package:quiz/src/features/main/presentation/widgets/questions_widgets/question_counter.dart';
import 'package:quiz/src/features/main/presentation/widgets/questions_widgets/question_details.dart';
import 'package:quiz/src/features/main/presentation/widgets/questions_widgets/submit_button.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // empty cards for view
        questionCardSample(width: 300, height: 387, top: -70, left: 45),
        questionCardSample(width: 330, height: 368, top: -50, left: 30),
        // question and options in this card
        questionCardSample(
          width: 365,
          height: 347,
          top: -25,
          left: 15,
          child: const QuestionDetails(),
        ),

        Padding(
          padding: EdgeInsets.only(top: 332.h),
          child: Column(children: [
            // question numbers to select from them
            const QuestionCounter(),
            verticalSpace(height: 10),
            // submit button
            const Align(
              alignment: Alignment.centerRight,
              child: SubmitButton(),
            )
          ]),
        )
      ],
    );
  }

  Widget questionCardSample(
      {required double width,
      required double height,
      Widget? child,
      required int top,
      required int left}) {
    return Positioned(
      top: top.h,
      left: left.w,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColor.royalBlue, AppColor.skyBlue],
            stops: [0.0, 1.7],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.3),
              spreadRadius: 2.h,
              blurRadius: 3.h,
              offset: Offset(0, 3.h),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.deepBlue, width: 0.5.w),
        ),
        child: child,
      ),
    );
  }
}
