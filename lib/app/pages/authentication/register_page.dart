import 'package:cordova/app/styles/colors.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/large_button.dart';
import 'package:cordova/app/widgets/text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_name.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController confirmationPasswordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 93.h,
          ),
          GestureDetector(
            onTap: () {
              context.goNamed(RouteName.onboardingPage);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF323232),
              ),
            ),
          ),
          SizedBox(
            height: 42.h,
          ),
          const RegisterContent()
        ],
      ),
    );
  }
}

class RegisterContent extends StatelessWidget {
  const RegisterContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorStyles.grey50,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding:
              EdgeInsets.only(top: 48.h, right: 16.w, left: 16.w, bottom: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Register",
                  style: TextStyles.h3SemiBoldBlack,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Register for a personalized resources and tools that will guide you towards a heart-healthy lifestyle.",
                  style: TextStyles.b2MediumBlack,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyles.b2MediumBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomTextField(
                  controller: nameController,
                  type: CustomTextFieldType.input,
                  hintText: 'Sando',
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyles.b2MediumBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomTextField(
                    controller: emailController,
                    type: CustomTextFieldType.input,
                    hintText: 'sando1234@gmail.com'),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyles.b2MediumBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomTextField(
                    controller: passwordController,
                    type: CustomTextFieldType.inputPasswordAndHint,
                    obscure: true,
                    hintText: 'sando321'),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/error-warning-line.png'),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      'Password must contain at least 8 character',
                      style: TextStyles.c2RegularGrey500,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Confirmation Password',
                      style: TextStyles.b2MediumBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomTextField(
                    controller: confirmationPasswordController,
                    type: CustomTextFieldType.inputPassword,
                    obscure: true,
                    hintText: 'sando321'),
                SizedBox(
                  height: 24.h,
                ),
                LargeButton(
                    text: 'Register',
                    onClicked: () {
                      context.goNamed(RouteName.formBoardingPage);
                    }),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'or',
                  style: TextStyles.c2MediumBlack,
                ),
                SizedBox(
                  height: 8.h,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(382.sp, 40.sp),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: ColorStyles.primary600,
                        width: 1.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google-icon.png',
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Register with Google',
                        style: TextStyles.b1MediumPrimary,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyles.b2RegularBlack,
                    children: [
                      TextSpan(
                          text: "Login",
                          style: TextStyles.b2MediumInfo600Underline,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(RouteName.loginPage);
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
