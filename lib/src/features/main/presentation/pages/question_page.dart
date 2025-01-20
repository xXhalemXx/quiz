import 'package:flutter/material.dart';
import 'package:quiz/src/core/config/config.dart';
import 'package:quiz/src/core/helpers/spacing.dart';
import 'package:quiz/src/features/main/presentation/cubit/main_cubit.dart';
import 'package:quiz/src/features/main/presentation/widgets/common/background_image.dart';
import 'package:quiz/src/features/main/presentation/widgets/common/common_app_bar.dart';
import 'package:quiz/src/features/main/presentation/widgets/common/page_background.dart';
import 'package:quiz/src/features/main/presentation/widgets/questions_widgets/question_card.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: backgroundImage(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(height: 48),
                const CommonAppBar(
                  isMain: false,
                ),
                verticalSpace(height: 100),
                const PageBackground(
                  showYellowLines: false,
                  child: QuestionCard(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    getIt<MainCubit>().reset();
    super.dispose();
  }
}
