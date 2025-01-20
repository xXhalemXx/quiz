import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/constants/assets.dart';
import 'package:quiz/src/core/constants/constants.dart';
import 'package:quiz/src/core/helpers/spacing.dart';
import 'package:quiz/src/core/routes/routes.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';

class TopicsList extends StatelessWidget {
  const TopicsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.deepBlue,
                  ),
                )
              : ListView.builder(
                  itemCount: state.allTopicsAndQuestions.length,
                  itemBuilder: (context, index) {
                    return _topicsList(
                      onTap: () {
                        getIt<MainCubit>().setSelectTopicIndex(index);
                        Navigator.pushNamed(context, RoutesName.questions);
                      },
                      title: state.allTopicsAndQuestions[index]['topic'],
                      count: state
                          .allTopicsAndQuestions[index]['questions'].length,
                    );
                  },
                );
        },
      ),
    );
  }

  Widget _topicsList(
          {required VoidCallback onTap,
          required String title,
          required int count}) =>
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          width: 330.w,
          height: 110.h,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(Assets.assetsImagesTopicItemBackground),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.3),
                spreadRadius: 2.h,
                blurRadius: 3.h,
                offset: Offset(0, 3.h),
              )
            ],
          ),
          child: _topicItemContent(onTap: onTap, title: title, count: count),
        ),
      );

  Widget _topicItemContent(
      {required VoidCallback onTap,
      required String title,
      required int count}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                image: const DecorationImage(
                  image: AssetImage(
                      Assets.assetsImagesMolecularBasisOfInheritance),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            horizontalSpace(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.interFont20DeepBlue100Medium1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$count MCQ',
                    style: AppTextStyles.interFont16DeepBlue100Regular1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
