import 'package:cordova/app/routes/route_name.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FormBoardingPage extends StatelessWidget {
  const FormBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 202.w,
              height: 190.h,
            ),
            SizedBox(
              height: 42.h,
            ),
            Text(
              'WELCOME TO CORDOVA',
              style: TextStyles.h5SemiBoldBlack,
            ),
            SizedBox(
              height: 8.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    "Thank you trusting Cordova, after this you will be asked a few question that is ",
                style: TextStyles.b1RegularBlack,
                children: [
                  TextSpan(
                    text: "essential",
                    style: TextStyles.b1SemiBoldBlack,
                  ),
                  TextSpan(
                    text:
                        " for prediction calculation.  We hope you fill out the form with that in mind for the best result",
                    style: TextStyles.b1RegularBlack,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            LargeButton(
                text: 'Start',
                onClicked: () {
                  context.goNamed(RouteName.formPage);
                })
          ],
        ),
      ),
    );
  }
}
