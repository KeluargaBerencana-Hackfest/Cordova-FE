import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import '../styles/text_styles.dart';

class OutlinedLargeButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const OutlinedLargeButton({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => Center(
          child: ElevatedButton(
        style: ButtonStyle(
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
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyles.b1MediumPrimary,
        ),
      ));
}
