import 'package:flutter/material.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/helpers/spacing.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';
import 'package:quiz/src/features/main/presentation/widgets/common/background_image.dart';
import 'package:quiz/src/features/main/presentation/widgets/common/common_app_bar.dart';
import 'package:quiz/src/features/main/presentation/widgets/common/page_background.dart';
import 'package:quiz/src/features/main/presentation/widgets/topics_widgets/hint_text.dart';
import 'package:quiz/src/features/main/presentation/widgets/topics_widgets/topics_list.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<MainCubit>().getQuestions(context: context);
    return Scaffold(
      body: Container(
        decoration: backgroundImage(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(height: 48),
              const CommonAppBar(
                isMain: true,
              ),
              verticalSpace(height: 5),
              const HintText(),
              verticalSpace(height: 5),
              const PageBackground(showYellowLines: true, child: TopicsList()),
            ],
          ),
        ),
      ),
    );
  }
}
