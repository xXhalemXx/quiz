import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/constants/constants.dart';

class HintText extends StatelessWidget {
  const HintText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26.w, right: 36.w),
      child: Text(
        'Select the subject you\'d like to work on 🥰',
        style: AppTextStyles.interFont24White100SemiBold1,
      ),
    );
  }
}
