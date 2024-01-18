import 'package:cordova/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cordova/app/styles/colors.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/small_button.dart';
import 'package:cordova/app/widgets/large_button.dart';
import 'package:go_router/go_router.dart';
import 'form_one.dart';
import 'form_two.dart';
import 'form_three.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: const [
                    FormOne(),
                    FormTwo(),
                    FormThree(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    if (currentPage < 3) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => buildDots(index),
                        ).toList(),
                      ),
                    ],
                    SizedBox(height: 44.h),
                    if (currentPage == 0) ...[
                      LargeButton(
                        text: 'Next',
                        onClicked: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ] else if (currentPage == 1) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Back',
                                style: TextStyles.b1MediumPrimary,
                              ),
                            ),
                            SmallButton(
                              text: 'Next',
                              onClicked: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ] else if (currentPage == 2) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Back',
                                style: TextStyles.b1MediumPrimary,
                              ),
                            ),
                            SmallButton(
                              text: 'Submit',
                              onClicked: () {
                                context.goNamed(RouteName.mainPage);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDots(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: currentPage == index ? 29.w : 8.w,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: currentPage == index
            ? ColorStyles.accent600
            : ColorStyles.secondary600,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
