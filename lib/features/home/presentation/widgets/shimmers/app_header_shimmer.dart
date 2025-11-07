import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';

class AppHeaderShimmer extends StatelessWidget {
  const AppHeaderShimmer({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  bool get isLoading => controller.configurationData.address == null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
              const SizedBox(width: 4),

              // 🔹 Address Text or Shimmer Placeholder
              Expanded(
                child: isLoading
                    ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                )
                    : CustomText(
                  text:
                  controller.configurationData.address ?? "Not specified",
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
                    const Icon(Icons.notifications, size: 18),
                    const Positioned(
                      right: 1,
                      top: 1,
                      child: Icon(Icons.circle,
                          color: Colors.white, size: 8),
                    ),
                    Positioned(
                      right: 2,
                      top: 2,
                      child: Icon(Icons.circle,
                          color: AppColors.error, size: 6),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 🔹 Search Field or Shimmer Placeholder
          isLoading
              ? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
              : CustomTextFormField(
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
        ],
      ),
    );
  }
}
