import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/food_picture.dart';
import '../../../controllers/home_controller.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return CarouselSlider(
          options: CarouselOptions(
            height: width * 0.25,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: width < 600
                ? 0.8
                : 0.6,
            initialPage: 1,
            autoPlayInterval: const Duration(
              seconds: 5,
            ),
            autoPlayAnimationDuration:
            const Duration(milliseconds: 300),
            onPageChanged: (i, reason) {
              controller.currentPoster.value = i;
            },
          ),
          items: controller.bannerData.banners!.map(
                (banner) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(16),
                  child: FoodPicture(
                    imageLink: banner
                        .restaurant!
                        .foods![0]
                        .imageFullUrl!,
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}