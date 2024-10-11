import 'package:beyond_medplus_app/utils/app_colors.dart';
import 'package:beyond_medplus_app/utils/app_textfield.dart';
import 'package:beyond_medplus_app/utils/gap.dart';
import 'package:beyond_medplus_app/utils/text_styling.dart';
import 'package:beyond_medplus_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            title: 'Beyond Medplus',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.appBlackColor),
              useMaterial3: true,
            ),
            home: SignupScreen());
      },
    );
  }
}

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isSelected = false;
  bool isValidated = false;

  validateField() {
    setState(() {
      isValidated = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhiteGreyColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please fill in the form to get started',
              style: appFontStyle(context)
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
            addVerticalSpacing(50),
            AppCustomTextField(
              label: 'First name',
              addBorder: true,
              textEditingController: firstNameController,
              onChanged: (val) {
                validateField();
              },
            ),
            addVerticalSpacing(10),
            AppCustomTextField(
              label: 'Last name',
              addBorder: true,
              textEditingController: lastNameController,
              onChanged: (val) {
                validateField();
              },
            ),
            addVerticalSpacing(10),
            AppCustomTextField(
              label: 'Email',
              addBorder: true,
              textEditingController: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                validateField();
              },
            ),
            addVerticalSpacing(10),
            AppCustomTextField(
              label: 'Phone number',
              addBorder: true,
              textEditingController: phoneController,
              keyboardType: TextInputType.number,
              onChanged: (val) {
                validateField();
              },
            ),
            addVerticalSpacing(10),
            AppCustomTextField(
              label: 'Password',
              addBorder: true,
              textEditingController: passwordController,
              onChanged: (val) {
                validateField();
              },
            ),
            addVerticalSpacing(10),
            AppCustomTextField(
              label: 'Confirm password',
              addBorder: true,
              textEditingController: confirmPasswordController,
              onChanged: (val) {
                validateField();
              },
            ),
            addVerticalSpacing(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                    // padding: const EdgeInsets.all(),
                    alignment: Alignment.center,
                    height: 22.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected ? AppColors.appBrandColor : null,
                        border: Border.all(
                            color: isSelected
                                ? AppColors.appBrandColor
                                : AppColors.appGreyColor,
                            width: 1)),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                addHorizontalSpacing(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'I agree to your',
                      style: appFontStyle(context).copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appGreyColor),
                    ),
                    Column(
                      children: [
                        Text(
                          ' Terms & Conditions',
                          style: appFontStyle(context).copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.appBrandColor),
                        ),
                        Divider(
                          color: AppColors.appBrandColor,
                          thickness: 2,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            addVerticalSpacing(30),
            AppCustomButton(
                width: screenWidth(context),
                btnText: 'Sign Up',
                onPressed: () {},
                isEnabled: isValidated),
            addVerticalSpacing(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: appFontStyle(context).copyWith(
                        fontSize: 15.sp, color: AppColors.appGreyColor),
                  ),
                  Column(
                    children: [
                      Text(
                        ' Log in',
                        style: appFontStyle(context).copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(
                        color: AppColors.appBrandColor,
                        thickness: 2,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isSelected = false;
  bool isValidated = false;

  validateField() {
    setState(() {
      isValidated =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhiteGreyColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back!!',
              style: appFontStyle(context)
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
            addVerticalSpacing(50),
            AppCustomTextField(
              label: 'Email',
              addBorder: true,
              textEditingController: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            addVerticalSpacing(30),
            AppCustomButton(
                width: screenWidth(context),
                btnText: 'Login',
                onPressed: () {},
                isEnabled: isValidated),
            addVerticalSpacing(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: appFontStyle(context).copyWith(
                        fontSize: 15.sp, color: AppColors.appGreyColor),
                  ),
                  Column(
                    children: [
                      Text(
                        ' Create account',
                        style: appFontStyle(context).copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
