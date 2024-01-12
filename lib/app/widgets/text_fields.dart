import 'package:cordova/app/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

enum CustomTextFieldType {
  inputPassword,
  inputAndHint,
  input,
  inputSearch,
  inputPasswordAndHint,
  inputAndIcon,
  inputWithIconAndHint,
  inputAndSuffix,
  inputWithSuffixAndHint
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final CustomTextFieldType type;
  final String hintText;
  final bool obscure;
  final TextInputType keyboardType;
  final String? suffixText;
  final String? suffixIcon;
  final String openedEyeIcon;
  final String closedEyeIcon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.type,
    required this.hintText,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.suffixText,
    this.suffixIcon,
    this.closedEyeIcon = 'assets/icons/eye-close-line.png',
    this.openedEyeIcon = 'assets/icons/eye-line.png',
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 382.w,
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure && isObscure,
        decoration: _getDecoration(),
        style: TextStyles.b2RegularTextfieldFilled,
      ),
    );
  }

  InputDecoration _getDecoration() {
    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: ColorStyles.primary800, width: 1.5),
    );
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: ColorStyles.grey400, width: 1.5),
    );
    final suffixIcon = widget.obscure
        ? InkWell(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Image.asset(
              isObscure ? widget.closedEyeIcon : widget.openedEyeIcon,
              height: 20,
              width: 20,
            ),
          )
        : (widget.suffixIcon != null
            ? InkWell(
                onTap: () {},
                child: Image.asset(
                  widget.suffixIcon!,
                  height: 20,
                  width: 20,
                ),
              )
            : null);
    switch (widget.type) {
      case CustomTextFieldType.inputPassword:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputAndHint:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.input:
        return InputDecoration(
          focusColor: ColorStyles.accent800,
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputSearch:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          prefixIcon: Image.asset('assets/search-2-line.png'),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputPasswordAndHint:
        return InputDecoration(
          fillColor: ColorStyles.accent800,
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputAndIcon:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputWithIconAndHint:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputAndSuffix:
        return InputDecoration(
          suffixText: widget.suffixText,
          suffixStyle: TextStyles.b2RegularTextfieldDefault,
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputWithSuffixAndHint:
        return InputDecoration(
          suffixText: widget.suffixText,
          suffixStyle: TextStyles.b2RegularTextfieldDefault,
          hintText: widget.hintText,
          hintStyle: TextStyles.b2RegularTextfieldDefault,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
    }
  }
}
