import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';


class NavBarButton extends StatelessWidget {
  const NavBarButton({
    super.key,
    required this.controller,
    required this.buttonNumber,
    required this.icon,
  });

  final HomeController controller;
  final int buttonNumber;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.currentIndex.value = buttonNumber;
      },
      child: Icon(icon, color: controller.currentIndex.value == buttonNumber ? AppColors.success : buttonNumber == 2 ? AppColors.textWhite : AppColors.blueGrey, size: 28,),
    );
  }
}