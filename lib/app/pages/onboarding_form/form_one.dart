import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/text_styles.dart';
import '../../widgets/text_fields.dart';

class FormOne extends StatelessWidget {
  const FormOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FormOneContent();
  }
}

class _FormOneContent extends StatefulWidget {
  const _FormOneContent({Key? key}) : super(key: key);

  @override
  _FormOneContentState createState() => _FormOneContentState();
}

class _FormOneContentState extends State<_FormOneContent> {
  String? selectedSex;

  @override
  Widget build(BuildContext context) {
    TextEditingController birthdayController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 94.h,
          ),
          Text(
            'Birthday',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: birthdayController,
            type: CustomTextFieldType.inputAndIcon,
            hintText: 'dd/mm/yyyy',
            suffixIcon: 'assets/icons/event.png',
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Sex',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedSex = 'male';
                  });
                },
                child: Image.asset(
                  selectedSex == 'male'
                      ? 'assets/male.png'
                      : 'assets/inactive-male.png',
                  width: 92.w,
                  height: 91.h,
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedSex = 'female';
                  });
                },
                child: Image.asset(
                  selectedSex == 'female'
                      ? 'assets/female.png'
                      : 'assets/inactive-female.png',
                  width: 92.w,
                  height: 91.h,
                ),
              ),
            ],
          ),
          Text(
            'Weight',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: weightController,
            type: CustomTextFieldType.inputAndSuffix,
            hintText: 'Ex 83',
            suffixText: "Kg",
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Height',
            style: TextStyles.b2MediumBlack,
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextField(
            controller: heightController,
            type: CustomTextFieldType.inputAndSuffix,
            hintText: 'Ex: 180',
            suffixText: 'Cm',
          ),
        ],
      ),
    );
  }
}
