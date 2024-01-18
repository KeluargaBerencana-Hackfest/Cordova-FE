import 'package:cordova/app/styles/colors.dart';
import 'package:cordova/app/styles/text_styles.dart';
import 'package:cordova/app/widgets/line_chart_sample2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/cholesterol_model.dart';
import '../../../data/repositories/cholesterol_repository/firebase_cholesterol_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? _currentUser;
  late CholesterolModel? cholesterolModel;
  late dynamic idTokenResult;
  String selectedTime = '';

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _displayStressLevelBottomSheetIfNeeded();
    getCholesterolHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyles.primary600, body: _buildMainColumn());
  }

  Widget _buildMainColumn() {
    return Column(
      children: [
        SizedBox(
          height: 103.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyles.b2MediumWhite,
                  ),
                  Text(
                    _currentUser != null ? _currentUser!.displayName ?? '' : '',
                    style: TextStyles.b2MediumWhite,
                  ),
                ],
              ),
              Container(
                width: 46.w,
                height: 46.h,
                decoration: const BoxDecoration(
                    color: Color(0xFF87AFEF),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Image.asset(
                  'assets/icons/female.png', //"photo_profile"
                  width: 30.w,
                  height: 30.h,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CircularPercentIndicator(
          radius: 100.w,
          percent: 0.45,
          lineWidth: 15,
          startAngle: 90,
          progressColor: ColorStyles.secondary600,
          backgroundColor: ColorStyles.secondary50,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cholesterolModel != null
                    ? '${cholesterolModel!.cholesterols['heart_rate']}%'
                    : 'N/A',
                style: TextStyles.h1SemiBoldWhite,
              ),
              Text(
                "Heart attack Risk",
                style: TextStyles.b1MediumWhite,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  cholesterolModel != null
                      ? '${cholesterolModel!.cholesterols["last_cholesterol_record"]}'
                      : 'N/A', //"last_cholesterol_record"
                  style: TextStyles.h5SemiBoldWhite,
                ),
                Text(
                  'Cholesterol',
                  style: TextStyles.b2MediumWhite,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  cholesterolModel != null
                      ? '${cholesterolModel!.cholesterols["cholesterol_level"]}'
                      : 'N/A', // "cholesterol_level"
                  style: TextStyles.h5SemiBoldWhite,
                ),
                Text(
                  'Cholesterol Level',
                  style: TextStyles.b2MediumWhite,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.w),
                    topRight: Radius.circular(34.w))),
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cholesterol Metric",
                          style: TextStyles.h6SemiBoldBlack,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    buildTimeTab(),
                    SizedBox(
                      height: 8.h,
                    ),
                    selectedTime.isNotEmpty
                        ? LineChartSample2(selectedTime: selectedTime)
                        : const SizedBox(
                            // Add a placeholder or default view
                            height: 200,
                            child: Center(
                              child: Text(
                                'Please select a time to view the chart.',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recomended Activity",
                          style: TextStyles.h6SemiBoldBlack,
                        ),
                        Text(
                          "See All",
                          style: TextStyles.b2SemiBoldPrimary600,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 183.w,
                              height: 183.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/activity-img.png',
                                width: 183.w,
                                height: 183.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 183.w,
                              height: 183.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black,
                                      Colors.black.withOpacity(0.1)
                                    ]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Positioned(
                                left: 11.2.w,
                                bottom: 14.64.h,
                                right: 11.38.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Running",
                                      style: TextStyles.b2SemiBoldWhite,
                                    ),
                                    Container(
                                      width: 48.w,
                                      height: 19.38.h,
                                      decoration: BoxDecoration(
                                          color: ColorStyles.accent300,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 2.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "2/5",
                                              style:
                                                  TextStyles.c2MediumAccent600,
                                            ),
                                            Image.asset(
                                              'assets/icons/checkbox-fill-accent.png',
                                              width: 12.w,
                                              height: 12.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildTimeTab() {
    return Container(
      width: 382.w,
      height: 36.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorStyles.accent500),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          buildTimeButton("6 Months"),
          buildTimeButton("1 Year"),
          buildTimeButton("5 Years"),
          buildTimeButton("All Time"),
        ],
      ),
    );
  }

  Widget buildTimeButton(String time) {
    bool isSelected = selectedTime == time;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? ColorStyles.accent500 : null,
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              selectedTime = time;
            });
          },
          child: Text(time,
              style: isSelected
                  ? TextStyles.b2MediumGrey50
                  : TextStyles.b2MediumPrimary),
        ),
      ),
    );
  }

  Future<void> _saveStressLevel(String stressLevel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("selected_stress_level", stressLevel);

    // Simpan timestamp untuk menandai kapan stressLevel disimpan
    prefs.setInt(
        "stress_level_timestamp", DateTime.now().millisecondsSinceEpoch);
  }

// Fungsi untuk mengambil stressLevel yang tersimpan
  Future<String> _getStoredStressLevel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("selected_stress_level") ?? "";
  }

  Future _displayStressLevelBottomSheet(
      BuildContext context, String currentUser) async {
    String selectedStressLevel = "";
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        barrierColor: const Color(0xFF999999),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
        builder: (context) => SizedBox(
              height: 680.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dear $currentUser!',
                        style: TextStyles.h4SemiBoldBlack),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "How was your day today?",
                      style: TextStyles.b1MediumBlack,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            selectedStressLevel = "1";
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/1.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedStressLevel = "2";
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/2.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedStressLevel = "3";
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/3.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/4.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/5.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/6.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/7.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/8.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _saveStressLevel(selectedStressLevel);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/stress/9.png',
                            width: 119.w,
                            height: 116.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          _saveStressLevel(selectedStressLevel);
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/stress/10.png',
                          width: 119.w,
                          height: 116.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<void> _displayStressLevelBottomSheetIfNeeded() async {
    String storedStressLevel = await _getStoredStressLevel();
    if (storedStressLevel.isEmpty) {
      _displayStressLevelBottomSheet(context, _currentUser!.displayName ?? '');
    }
  }

  Future<void> getCholesterolHistory() async {
    try {
      final cholesterolRepo = FirebaseCholesterolRepository();

      final cholesterolData = await cholesterolRepo.getCholesterolHistory();

      setState(() {
        cholesterolModel = cholesterolData;
      });
    } catch (e) {
      print("Error fetching cholesterol history: $e");
    }
  }
}
