import 'package:cordova/app/pages/home/main_page.dart';
import 'package:cordova/app/routes/route_name.dart';
import 'package:cordova/app/styles/colors.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/small_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/large_button.dart';
import '../../widgets/outlined_large_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int currentPage = 0;
  List<Map<String, String>> boardingData = [
    {
      "image": "assets/boarding/boarding_img_1.png",
      "title": "Track your Cholesterol",
      "content":
          "Record and monitor the progress of cholesterol levels more easily",
    },
    {
      "image": "assets/boarding/boarding_img_2.png",
      "title": "Get Percentage of Heart Disease",
      "content": "Give information about percentage of heart disease ",
    },
    {
      "image": "assets/boarding/boarding_img_3.png",
      "title": "Be Healthy",
      "content": "Let’s start your journey with us!!",
    },
  ];

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
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainPage();
          } else {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: boardingData.length,
                        itemBuilder: (context, index) => BoardingContents(
                          image: boardingData[index]["image"]!,
                          title: boardingData[index]["title"]!,
                          content: boardingData[index]["content"]!,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          if (currentPage == boardingData.length - 1)
                            Column(
                              children: [
                                LargeButton(
                                    text: 'Login',
                                    onClicked: () {
                                      context.goNamed(RouteName.loginPage);
                                    }),
                                SizedBox(height: 16.h),
                                OutlinedLargeButton(
                                  text: 'Register',
                                  onClicked: () {
                                    context.goNamed(RouteName.registerPage);
                                  },
                                ),
                              ],
                            ),
                          if (currentPage != boardingData.length - 1)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    boardingData.length,
                                    (index) => buildDots(index),
                                  ).toList(),
                                ),
                                SizedBox(height: 44.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _pageController.previousPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Text(
                                          'Back',
                                          style: TextStyles.b1MediumPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      SmallButton(
                                        text: 'Next',
                                        onClicked: () {
                                          _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
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
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

class BoardingContents extends StatelessWidget {
  const BoardingContents(
      {super.key,
      required this.image,
      required this.title,
      required this.content});

  final String image, title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
              image,
              height: 300.h,
              width: 300.w,
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.h5MediumBlack,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    content,
                    style: TextStyles.b2RegularBlack,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
