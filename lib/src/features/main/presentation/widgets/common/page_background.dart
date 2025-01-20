import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/constants/assets.dart';
import 'package:quiz/src/core/constants/colors.dart';

class PageBackground extends StatelessWidget {
  const PageBackground(
      {super.key, required this.showYellowLines, required this.child});
  final bool showYellowLines;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: _containerDecoration(color: AppColor.white),
          ),
          showYellowLines
              ? Positioned(
                  right: -60.w,
                  bottom: 100.h,
                  child: Image.asset(
                    Assets.assetsImagesYellowLines,
                    height: 345.h,
                    width: 100.w,
                  ),
                )
              : const SizedBox.shrink(),
          Positioned(
            left: 1.w,
            bottom: -170.h,
            child: Container(
              width: 390.w,
              height: 310.h,
              decoration: const BoxDecoration(
                color: AppColor.lightGray,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -230.w,
            bottom: 120.h,
            child: Container(
              width: 390.w,
              height: 310.h,
              decoration: const BoxDecoration(
                color: AppColor.lightGray,
                shape: BoxShape.circle,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration({Color? color}) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      );
}
