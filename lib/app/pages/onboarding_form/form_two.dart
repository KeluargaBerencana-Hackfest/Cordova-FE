import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/text_styles.dart';
import '../../widgets/text_fields.dart';

class FormTwo extends StatelessWidget {
  const FormTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController exerciseController = TextEditingController();
    TextEditingController physicalActivityController = TextEditingController();
    TextEditingController sleepHoursController = TextEditingController();
    TextEditingController sedentaryHoursController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 94.h,
          ),
          Text(
            'Exercise',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: exerciseController,
            type: CustomTextFieldType.inputWithSuffixAndHint,
            hintText: 'Ex: 12',
            suffixText: 'hours/week',
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
                'Number of exercise hours per week',
                style: TextStyles.c2RegularGrey500,
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Physical Activity',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: physicalActivityController,
            type: CustomTextFieldType.inputWithSuffixAndHint,
            hintText: 'Ex: 3',
            suffixText: "activities/week",
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
                'Days of physical activity per week',
                style: TextStyles.c2RegularGrey500,
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Sleep Hours',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: sleepHoursController,
            type: CustomTextFieldType.inputWithSuffixAndHint,
            hintText: 'Ex : 7',
            suffixText: 'hours/day',
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
                'Hours of sleep per day',
                style: TextStyles.c2RegularGrey500,
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Sedentary Hours',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: sedentaryHoursController,
            type: CustomTextFieldType.inputWithSuffixAndHint,
            hintText: 'Ex : 7',
            suffixText: 'hours/day',
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
                'Activity hours outside of sleeping hours per day',
                style: TextStyles.c2RegularGrey500,
              )
            ],
          ),
        ],
      ),
    );
  }
}
