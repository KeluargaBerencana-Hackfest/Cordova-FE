import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import '../styles/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => Center(
          child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorStyles.primary600),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(120.sp, 40.sp)),
        ),
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyles.b1MediumWhite,
        ),
      ));
}
