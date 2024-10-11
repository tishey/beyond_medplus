import 'package:beyond_medplus_app/utils/app_colors.dart';
import 'package:beyond_medplus_app/utils/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool isEnabled;
  final int? maxLength;
  final bool isFieldValidated;
  final String? initialValue;
  final bool addBorder;
  final int? maxlines;
  const AppCustomTextField({
    Key? key,
    this.label,
    this.isFieldValidated = false,
    this.prefixIcon,
    this.initialValue,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.validator,
    this.textEditingController,
    this.isEnabled = true,
    this.onSaved,
    this.addBorder = false,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white : null,
          ),
        ),
        addVerticalSpacing(8.h),
        SizedBox(
          // height: 50.h,
          child: TextFormField(
            // maxLines: maxlines,
            initialValue: initialValue,

            maxLines: maxlines ?? 1,
            autovalidateMode: AutovalidateMode.always,
            maxLengthEnforcement: MaxLengthEnforcement.none,

            enabled: isEnabled,
            onTap: onTap,
            // maxLength: maxLength,
            onSaved: onSaved,
            controller: textEditingController!,

            // cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
            cursorColor: isDark ? Colors.white : Colors.black,
            cursorWidth: 0.7,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            onChanged: (text) {
              if (onChanged != null) onChanged!(text);
            },
            validator: validator,
            inputFormatters: [
              formatter ?? FilteringTextInputFormatter.singleLineFormatter
            ],
            style: GoogleFonts.redHatDisplay(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),

            decoration: InputDecoration(
                errorStyle: GoogleFonts.redHatDisplay(
                  color: theme.colorScheme.error,
                  fontSize: 10.sp,
                ),
                hintStyle: GoogleFonts.redHatDisplay(
                    fontSize: 14.sp,
                    color: const Color(0XFFBEBECB),
                    fontWeight: FontWeight.w700),
                hintText: hintText,
                contentPadding: const EdgeInsets.only(
                  left: 15.0,
                  top: 19.0,
                ),
                filled: true,
                fillColor:
                    isDark ? const Color(0xFF0F241A) : const Color(0xFFF9FAF8),
                suffixIcon: suffixIcon,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: !addBorder || isDark
                        ? const Color(0xFF2E3C35)
                        //  Colors.white
                        : const Color(
                            0XFFEBEBEB), // Set the desired error border color
                    width: 1.5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: addBorder || isDark
                        ? const Color(0xFF2E3C35)
                        : const Color(0XFFEBEBEB),
                    width: 1.5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: !addBorder || isDark
                          ? const Color(0xFF2E3C35)
                          : AppColors.appGreyColor,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: !addBorder || isDark
                          ? const Color(0xFF2E3C35)
                          : const Color(0XFFEBEBEB),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: !addBorder || isDark
                            ? const Color(0xFF2E3C35)
                            : const Color(0XFFEBEBEB),
                        width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: !addBorder || isDark
                            ? const Color(0xFF2E3C35)
                            : const Color(0XFFEBEBEB),
                        // AppColors.sGreyColor.withOpacity(.3),
                        width: 1.5),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5.0)))),
          ),
        )
      ],
    );
  }
}

class SNCustomDropDownCard extends StatelessWidget {
  final String? label;
  final VoidCallback onTap;
  final String hinText;
  final bool? isCheck;
  const SNCustomDropDownCard({
    Key? key,
    this.label,
    required this.onTap,
    this.isCheck,
    required this.hinText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: theme.textTheme.bodyMedium!.copyWith(),
        ),
        addVerticalSpacing(8.5.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select...',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: AppColors.appGreyColor),
                ),
                isCheck == false
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
