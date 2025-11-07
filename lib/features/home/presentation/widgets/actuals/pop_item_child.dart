import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../navbar/controllers/nav_bar_controller.dart';


class PopItemChild extends StatelessWidget {
  const PopItemChild({
    super.key,
    required this.controller,
    required this.value,
    required this.icon,
    required this.label,
  });

  final NavBarController controller;
  final int value;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: controller.currentIndex.value == value ? AppColors.success : AppColors.blueGrey, size: 28,),
        SizedBox(width: 8),
        CustomText(text: label, color: controller.currentIndex.value == value ? AppColors.success : AppColors.blueGrey),
      ],
    );
  }
}