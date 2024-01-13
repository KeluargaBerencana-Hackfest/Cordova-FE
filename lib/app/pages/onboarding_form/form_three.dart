import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/text_styles.dart';

class FormThree extends StatelessWidget {
  const FormThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 94.h),
          RadioButtonGroup(
            title: 'Smoking',
          ),
          RadioButtonGroup(
            title: 'Alcohol Consumption',
          ),
          RadioButtonGroup(
            title: 'Family History',
            hint: 'Family history of heart-related problems',
          ),
          RadioButtonGroup(
            title: 'Previous Heart Problem',
          ),
          RadioButtonGroup(
            title: 'Medication Use',
            hint: 'Heart-related medication usage',
          ),
        ],
      ),
    );
  }
}

class RadioButtonGroup extends StatefulWidget {
  final String title;
  final String? hint;

  RadioButtonGroup({
    required this.title,
    this.hint,
  });

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyles.b2MediumBlack,
        ),
        if (widget.hint != null) ...[
          Row(
            children: [
              Image.asset('assets/icons/error-warning-line.png'),
              SizedBox(
                width: 4.w,
              ),
              Text(
                widget.hint!,
                style: TextStyles.c2RegularGrey500,
              )
            ],
          ),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRadioButton('Yes'),
            SizedBox(width: 80.w),
            _buildRadioButton('No'),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioButton(String option) {
    return Column(
      children: [
        Radio(
          value: option,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        Text(
          option,
          style: TextStyles.c1Medium,
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}
