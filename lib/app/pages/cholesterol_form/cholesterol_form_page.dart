import 'package:cordova/app/routes/route_name.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/cholesterol_repository/firebase_cholesterol_repo.dart';
import '../../styles/colors.dart';
import '../../widgets/text_fields.dart';

class CholesterolFormPage extends StatefulWidget {
  const CholesterolFormPage({super.key});

  @override
  State<CholesterolFormPage> createState() => _CholesterolFormPageState();
}

bool isLoading = false;
TextEditingController cholesterolTotalController = TextEditingController();
TextEditingController triglyceridesController = TextEditingController();
TextEditingController heartRateController = TextEditingController();
TextEditingController bloodPreasureController = TextEditingController();
TextEditingController cholesterolTestDateController = TextEditingController();

class _CholesterolFormPageState extends State<CholesterolFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: 80.h, left: 16.w, right: 16.w, bottom: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.goNamed(RouteName.mainPage);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: Color(0xFF323232),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  'Cholesterol Tracker',
                  style: TextStyles.h5MediumBlack,
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Cholesterol Total',
                  style: TextStyles.b2MediumBlack,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              controller: cholesterolTotalController,
              type: CustomTextFieldType.inputWithSuffixAndHint,
              hintText: 'Ex : 180',
              suffixText: 'mg/dL',
            ),
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
                  'LDL and HDL is not cholesterol total',
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
                  'Triglycerides',
                  style: TextStyles.b2MediumBlack,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              controller: triglyceridesController,
              type: CustomTextFieldType.inputWithSuffixAndHint,
              hintText: 'Ex : 180',
              suffixText: 'mg/dL',
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Heart Rate',
                  style: TextStyles.b2MediumBlack,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              controller: heartRateController,
              type: CustomTextFieldType.inputWithSuffixAndHint,
              hintText: 'Ex : 80',
              suffixText: 'BPM',
            ),
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(
              onTap: () {
                _displayInfoBottomSheet(context);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/error-warning-line-info.png',
                    width: 16.w,
                    height: 16.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'LDL and HDL is not cholesterol total',
                    style: TextStyles.c2RegularInfo600Underline,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Blood Preasure',
                  style: TextStyles.b2MediumBlack,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              controller: bloodPreasureController,
              type: CustomTextFieldType.inputWithSuffixAndHint,
              hintText: 'Ex : 180/20',
              suffixText: 'mmHg',
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Cholesterol’s Test Date',
                  style: TextStyles.b2MediumBlack,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              controller: cholesterolTestDateController,
              type: CustomTextFieldType.inputAndIcon,
              hintText: 'yyyy/mm/dd',
              suffixIcon: 'assets/icons/event.png',
            ),
            SizedBox(
              height: 8.h,
            ),
            Expanded(child: Container()),
            LargeButton(
                text: 'Submit',
                onClicked: () {
                  isLoading ? null : _submitForm;
                })
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_validateFormData()) {
      setState(() {
        isLoading = true;
      });

      try {
        final bool success = await _postCholesterolData();
        if (success) {
          await _displayWarningBottomSheet(context);
        }
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  bool _validateFormData() {
    return true;
  }

  Future<bool> _postCholesterolData() async {
    try {
      final int cholesterolTotal = int.parse(cholesterolTotalController.text);
      final int triglycerides = int.parse(triglyceridesController.text);
      final int heartRate = int.parse(heartRateController.text);
      final String bloodPressure = bloodPreasureController.text;
      final String cholesterolTestDate = cholesterolTestDateController.text;

      final cholesterolRepo = FirebaseCholesterolRepository();

      final bool success = await cholesterolRepo.checkCholesterol(
        triglycerides,
        cholesterolTotal,
        bloodPressure,
        heartRate,
        cholesterolTestDate,
      );

      return success;
    } catch (e) {
      return false;
    }
  }
}

Future _displayInfoBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: const Color(0xFF999999),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) => SizedBox(
            height: 609.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What is a Rest Heart Rate(RHR)',
                      style: TextStyles.b1MediumBlack),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Resting heart rate (RHR) refers to the number of times your heart beats per minute when you are at rest. This means your heart is pumping the lowest amount of blood needed to supply oxygen to your entire body. Normal RHR ranges from 60 - 100 bpm (beats per minute).",
                    style: TextStyles.b2RegularBlack,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('How to Count RHR?', style: TextStyles.b1MediumBlack),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "The best time to check your resting heart rate is in the morning before getting out of bed. To measure your pulse, do it using one of the two methods below:",
                    style: TextStyles.b2RegularBlack,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    '\u2022 Place your index and middle fingers on the opposite wrist right under the thumb.',
                    style: TextStyles.b2RegularBlack,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '\u2022 Place your index and middle fingers on the lower neck, right under the throat.',
                    style: TextStyles.b2RegularBlack,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Count the beats in 15 seconds. Multiply the result by 4 to get your resting heart rate.",
                    style: TextStyles.b2RegularBlack,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "* you can track your heart rate with a wearable device like a heart rate monitor or smartwatch.",
                    style: TextStyles.c1RegularBlack,
                  ),
                  Expanded(child: Container()),
                  LargeButton(
                      text: 'Go Back',
                      onClicked: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ));
}

Future _displayWarningBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.white,
      barrierColor: const Color(0xFF999999),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) => SizedBox(
            height: 355.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 24.h, bottom: 32.h, left: 16.w, right: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/error-warning-fill.png',
                    width: 128.w,
                    height: 128.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Please double check all of your data, any data that has been submitted ",
                          style: TextStyles.b1MediumBlack,
                        ),
                        TextSpan(
                          text: "cannot be edited",
                          style: TextStyles.b1BoldBlack,
                        ),
                        TextSpan(
                          text: " in the future",
                          style: TextStyles.b1MediumBlack,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(183.sp, 40.sp),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                              color: ColorStyles.primary600,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyles.b1MediumPrimary,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorStyles.primary600),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(183.sp, 40.sp)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          context.goNamed(RouteName.mainPage);
                        },
                        child: Text(
                          'Submit',
                          style: TextStyles.b1MediumWhite,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
}
