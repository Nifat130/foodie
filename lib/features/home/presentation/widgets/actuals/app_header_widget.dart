import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';

class AppHeaderWidget extends StatelessWidget {
  const AppHeaderWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.home_rounded,
                color: AppColors.textSecondary,
                size: 18,
              ),
              SizedBox(width: 4),
              Expanded(
                child: CustomText(
                  text: controller.configurationData.address ?? "Not specified",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              InkResponse(
                onTap: () {},
                radius: 10,
                splashColor: AppColors.primary.withAlpha(50),
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    Icon(Icons.notifications, size: 18),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Icon(Icons.circle, color: AppColors.textWhite, size: 8,),
                    ),
                    Positioned(
                      right: 2,
                      top: 2,
                      child: Icon(Icons.circle, color: AppColors.error, size: 6,),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: TextEditingController(),
            hintText: "Search food or restaurant here...",
            suffixIcon: InkResponse(
              onTap: () {
                log("clicked");
              },
              radius: 15,
              splashColor: AppColors.primary.withAlpha(50),
              child: Icon(
                Icons.search,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          SizedBox(height: 8,)
        ],
      ),
    );
  }
}