import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.height,
      required this.onTap,
      required this.child,
      this.color,
      this.width});
  final double height;
  final double? width;
  final VoidCallback onTap;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    /// first container to add border around button
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: width?.w ?? double.infinity,
      height: height.h + 15.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: color ?? Colors.blue,
          width: 2,
        ),
      ),

      /// second container give shadow, color to button
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Center(
          child: Container(
            width: width?.w ?? double.infinity,
            height: height.h,
            decoration: BoxDecoration(
              gradient: color == null
                  ? const LinearGradient(
                      colors: [Color(0xFF2196F3), Color(0xFF448AFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              color: color,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            // at the end inkwell and text
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(20.r),
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
