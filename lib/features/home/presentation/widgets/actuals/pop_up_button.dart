import 'package:flutter/material.dart';
import 'package:foodie/features/home/presentation/widgets/actuals/pop_item_child.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../navbar/controllers/nav_bar_controller.dart';

class PopUpButton extends StatelessWidget {
  PopUpButton({
    super.key,
  });

  final navBarController = Get.find<NavBarController>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50), // shadow color
              blurRadius: 4,
              offset: const Offset(2, 2),           // position of the shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Icon(Icons.more_vert_rounded, color: AppColors.textWhite,),
      ),
      color: AppColors.textWhite,
      onSelected: (int value) {
        navBarController.currentIndex.value = value;
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
            value: 0,
            child: PopItemChild(controller: navBarController, value: 0, icon: Icons.home_filled, label: "Home")
        ),
        PopupMenuItem(
            value: 1,
            child: PopItemChild(controller: navBarController, value: 1, icon: Icons.favorite_border_rounded, label: "Favorites")
        ),
        PopupMenuItem(
            value: 2,
            child: PopItemChild(controller: navBarController, value: 2, icon: Icons.shopping_cart_outlined, label: "Wishlist")
        ),
        PopupMenuItem(
            value: 3,
            child: PopItemChild(controller: navBarController, value: 3, icon: Icons.edit_note_outlined, label: "Notes")
        ),
        PopupMenuItem(
            value: 4,
            child: PopItemChild(controller: navBarController, value: 4, icon: Icons.menu, label: "More")
        ),
      ],
    );
  }
}