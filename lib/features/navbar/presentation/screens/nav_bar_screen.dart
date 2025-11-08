import 'package:flutter/material.dart';
import 'package:foodie/features/navbar/controllers/nav_bar_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/actuals/nav_bar_button.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({super.key});

  final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final width = constrains.maxWidth;
        return SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: AppColors.textWhite,
            extendBody: true,
            body: Obx(
              () => controller.listOfScreens[controller.currentIndex.value],
            ),
            bottomNavigationBar: width > 600 ?
            SizedBox() : SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blueGrey.withAlpha(
                            100,
                          ), // shadow color
                          blurRadius: 4,
                          offset: const Offset(4, 4), // position of the shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NavBarButton(
                          controller: controller,
                          buttonNumber: 0,
                          icon: Icons.home_filled,
                        ),
                        NavBarButton(
                          controller: controller,
                          buttonNumber: 1,
                          icon: Icons.favorite_border_rounded,
                        ),
                        NavBarButton(
                          controller: controller,
                          buttonNumber: 2,
                          icon: Icons.shopping_cart_rounded,
                        ),
                        NavBarButton(
                          controller: controller,
                          buttonNumber: 3,
                          icon: Icons.edit_note_outlined,
                        ),
                        NavBarButton(
                          controller: controller,
                          buttonNumber: 4,
                          icon: Icons.menu,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: (){
                        controller.currentIndex.value = 2;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.success,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: AppColors.textWhite,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
