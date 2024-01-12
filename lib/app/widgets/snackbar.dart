import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class SnackBarShared extends SnackBar {
  final VoidCallback onActionPressed;

  SnackBarShared({
    Key? key,
    required String text,
    required this.onActionPressed,
  }) : super(
          key: key,
          duration: const Duration(milliseconds: 500),
          content: Text(
            text,
            style: TextStyles.b2RegularTextfieldDefault,
          ),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: onActionPressed,
          ),
        );
}
