import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodie/features/navbar/controllers/nav_bar_controller.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';


class NavBarButton extends StatelessWidget {
  const NavBarButton({
    super.key,
    required this.controller,
    required this.buttonNumber,
    required this.icon,
  });

  final NavBarController controller;
  final int buttonNumber;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.currentIndex.value = buttonNumber;
      },
      child: Obx(() =>
      controller.currentIndex.value == 2 ?
          Icon(icon, color: AppColors.textWhite, size: 28,) :
          Icon(icon, color: controller.currentIndex.value == buttonNumber ? AppColors.success : buttonNumber == 2 ? AppColors.textWhite : AppColors.blueGrey, size: 28,)
      ),
    );
  }
}