import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/food_picture.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller
          .restaurantData
          .restaurants!
          .length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final restaurant = controller
            .restaurantData
            .restaurants![index];
        final rating = controller.starCount(
          star: restaurant.avgRating,
        );
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.textWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(
                  50,
                ), // shadow color
                blurRadius: 4,
                offset: const Offset(
                  2,
                  2,
                ), // position of the shadow
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          margin: EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  spacing: 8,
                  children: [
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(8),
                      child: FoodPicture(
                        imageLink:
                        restaurant.logoFullUrl!,
                        width: 90,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize:
                        MainAxisSize.min,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        spacing: 4,
                        children: [
                          CustomText(
                            text:
                            restaurant.name ??
                                "Unknown",
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,
                            textOverflow:
                            TextOverflow
                                .ellipsis,
                          ),
                          CustomText(
                            text:
                            restaurant
                                .address ??
                                "Unknown",
                            fontSize: 8,
                            fontWeight:
                            FontWeight.w700,
                            color: AppColors
                                .textSecondary,
                            textOverflow:
                            TextOverflow
                                .ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              for (
                              int i = 0;
                              i < rating;
                              i++
                              )
                                Icon(
                                  Icons.star,
                                  color: AppColors
                                      .success,
                                  size: 12,
                                ),
                              if (rating == 0)
                                CustomText(
                                  text:
                                  "No ratings",
                                  fontSize: 8,
                                  fontWeight:
                                  FontWeight
                                      .w700,
                                  color: AppColors
                                      .success,
                                  textOverflow:
                                  TextOverflow
                                      .ellipsis,
                                  maxLines: 1,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                spacing: 30,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color:
                      AppColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}