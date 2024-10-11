import 'package:beyond_medplus_app/utils/app_colors.dart';
import 'package:beyond_medplus_app/utils/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomButton extends StatelessWidget {
  final double? width;
  final String btnText;
  final VoidCallback onPressed;
  final bool isEnabled;
  final double? height;
  final Color? color;
  const AppCustomButton({
    super.key,
    this.width,
    required this.btnText,
    required this.onPressed,
    required this.isEnabled,
    this.height,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 60.h,
        width: width ?? 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isEnabled ? AppColors.appBrandColor : const Color(0xFFCCCCCC),
        ),
        child: Center(
          child: Text(btnText,
              style: appFontStyle(context).copyWith(
                  color: AppColors.appWhiteGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
