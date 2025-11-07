import 'package:flutter/material.dart';
import 'package:foodie/core/common/widgets/custom_text.dart';
import 'package:foodie/core/utils/app_colors.dart';
import 'package:foodie/features/home/controllers/home_controller.dart';
import 'package:foodie/features/home/presentation/widgets/actuals/app_header_widget.dart';
import 'package:get/get.dart';


class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key, required this.statusText});

  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: SafeArea(
        child: Column(
          children: [
            AppHeaderWidget(controller: Get.find<HomeController>()),
            Expanded(
              child: Center(
                child: CustomText(text: statusText, color: AppColors.textSecondary,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
