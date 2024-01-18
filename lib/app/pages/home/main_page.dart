import 'package:cordova/app/pages/activity/activity_page.dart';
import 'package:cordova/app/pages/clinic/clinic_page.dart';
import 'package:cordova/app/pages/profile/profile_page.dart';
import 'package:cordova/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<String> _activeIcons = [
    'assets/icons/home-active.png',
    'assets/icons/activity-active.png',
    'assets/icons/hospital-active.png',
    'assets/icons/profile-active.png',
  ];

  final List<String> _inactiveIcons = [
    'assets/icons/home-inactive.png',
    'assets/icons/activity-inactive.png',
    'assets/icons/hospital-inactive.png',
    'assets/icons/profile-inactive.png',
  ];

  final List<Widget> _pages = const [
    HomePage(),
    ActivityPage(),
    ClinicPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipPath(
        clipper: BottomAppBarClipper(),
        child: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildBottomNavBarItem(0),
                  buildBottomNavBarItem(1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildBottomNavBarItem(2),
                  buildBottomNavBarItem(3),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 76.w,
        height: 76.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFF2D87),
              const Color(0xFFFF2D87).withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            context.goNamed(RouteName.cholesterolFormPage);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Image.asset(
            'assets/icons/heart-add.png',
            width: 42.w,
            height: 42.h,
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBarItem(int index) {
    return IconButton(
      icon: Image.asset(
        _currentIndex == index ? _activeIcons[index] : _inactiveIcons[index],
        width: _currentIndex == 1 ? 47.w : 45.w,
        height: 45.h,
      ),
      onPressed: () {
        _onTabTapped(index);
      },
      color: _currentIndex == index
          ? ColorStyles.primary600
          : ColorStyles.textSecondary,
    );
  }
}

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(8, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(
      size.width / 2,
      20,
      size.width * 0.65,
      0,
    );
    path.lineTo(size.width - 8, 0);
    path.lineTo(size.width, 8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 8);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
