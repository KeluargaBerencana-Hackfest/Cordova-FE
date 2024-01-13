import 'package:cordova/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // This TextStyles naming convention were made by me to have an easiest describe of the TextStyle what to used

  static TextStyle h5MediumBlack = GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle b2RegularBlack = GoogleFonts.poppins(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle b1RegularBlack = GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle b1SemiBoldBlack = GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle b2MediumBlack = GoogleFonts.poppins(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle b1MediumWhite = GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white);
  static TextStyle b1MediumPrimary = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ColorStyles.textPrimary);
  static TextStyle h3SemiBoldBlack = GoogleFonts.poppins(
      fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle b2RegularTextfieldDefault = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFD0D5DD));
  static TextStyle b2RegularTextfieldSecondary = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorStyles.textSecondary);
  static TextStyle b2RegularTextfieldFilled = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF101828));
  static TextStyle b2MediumInfo600Underline = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ColorStyles.info600,
      decoration: TextDecoration.underline);
  static TextStyle c2RegularGrey500 = GoogleFonts.poppins(
      fontSize: 10.sp, fontWeight: FontWeight.w400, color: ColorStyles.grey500);
  static TextStyle c2MediumBlack = GoogleFonts.poppins(
      fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle c1RegularGrey500 = GoogleFonts.poppins(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorStyles.grey500);
  static TextStyle c1Medium = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF101828));
  static TextStyle h5SemiBoldBlack = GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black);
}
