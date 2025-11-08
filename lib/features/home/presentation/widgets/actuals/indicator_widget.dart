import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() =>
          AnimatedSmoothIndicator(
            activeIndex: controller.currentPoster.value,
            count:
            controller.bannerData.banners!.length,
            effect: WormEffect(
              dotColor: AppColors.primary,
              activeDotColor: Colors.green,
              dotHeight: 6.0,
              dotWidth: 6.0,
              spacing: 8.0,
              radius: 8.0,
            ),
          )
      ),
    );
  }
}