import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/src/core/constants/assets.dart';
import 'package:quiz/src/core/constants/colors.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key, required this.isMain});
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: isMain ? _rankButton() : _backButton(context: context),
          ),
          const Spacer(),
          Image.asset(Assets.assetsImagesLogo, height: 100.h, width: 100.w),
          const Spacer(),
          SizedBox(
            width: 60.w,
          )
        ],
      ),
    );
  }

  Widget _rankButton() {
    return InkWell(
      onTap: () {
        debugPrint('Rank');
      },
      child: SvgPicture.asset(
        Assets.assetsImagesSvgsMenuIcon,
        height: 18.h,
        width: 36.w,
      ),
    );
  }

  Widget _backButton({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_sharp,
        size: 30.w,
        color: AppColor.white,
      ),
    );
  }
}
