import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox addVerticalSpacing(double h) {
  return SizedBox(
    height: h.h,
  );
}

SizedBox addHorizontalSpacing(double w) {
  return SizedBox(
    width: w.w,
  );
}

screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
