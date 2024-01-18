import 'package:flutter/material.dart';

class ClinicPage extends StatefulWidget {
  const ClinicPage({super.key});

  @override
  State<ClinicPage> createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'under development. . .',
                style: TextStyle(decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
