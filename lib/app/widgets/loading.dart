import 'package:flutter/material.dart';

import '../styles/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorStyles.primary500,
      ),
    );
  }
}
