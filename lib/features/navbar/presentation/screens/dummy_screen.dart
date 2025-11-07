import 'package:flutter/material.dart';
import 'package:foodie/core/common/widgets/custom_text.dart';


class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key, required this.statusText});

  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: statusText),
      ),
    );
  }
}
