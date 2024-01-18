import 'package:cordova/app/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/activity-banner.png',
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.fill,
              ),
              Positioned(
                  left: 16,
                  top: 36,
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFFFEFEFE)),
                    child: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: Color(0xFF323232),
                    ),
                  ))
            ],
          ),
          Container(
            width: double.infinity,
            height: 104.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mawar's Activity",
                    style: TextStyles.h5MediumBlack,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Activity will be renewed every week to maintain a healthy diet",
                    style: TextStyles.b2RegularBlack,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 16.h, bottom: 38.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Container(
                  width: 382.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 192.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Running",
                                        style: TextStyles.b1SemiBoldBlack,
                                      ),
                                      Text(
                                        "30 Minute",
                                        style: TextStyles.b2MediumBlack,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 192.w, // Lebar teks
                                  child: Text(
                                    "Running significantly enhances cardiovascular health",
                                    style: TextStyles.c1RegularBlack,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorStyles.secondary600),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(152.w, 40.h)),
                              ),
                              onPressed: () {},
                              child: Text(
                                "See Progress",
                                style: TextStyles.b1MediumWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/activity-img.png',
                          width: 150.w,
                          height: 150.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
