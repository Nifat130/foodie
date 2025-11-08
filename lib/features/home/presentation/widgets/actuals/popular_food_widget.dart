import 'package:flutter/material.dart';
import 'package:foodie/core/common/widgets/food_picture.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../controllers/home_controller.dart';

class PopularFoodWidget extends StatelessWidget {
  const PopularFoodWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
        ),
        itemBuilder: (context, index) {
          final food = controller
              .popularFoodData
              .products![index];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
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
            margin: EdgeInsets.only(right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: FoodPicture(imageLink: food.imageFullUrl!, height: 90,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      CustomText(
                        text:
                        food.name ?? "Unknown",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textOverflow:
                        TextOverflow.ellipsis,
                      ),
                      CustomText(
                        text:
                        food.restaurantName ??
                            "Unknown",
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color:
                        AppColors.textSecondary,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: food.price!
                                  .toStringAsFixed(
                                2,
                              ),
                              fontSize: 12,
                              fontWeight:
                              FontWeight.w600,
                              color: AppColors
                                  .textSecondary,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color:
                            AppColors.success,
                            size: 12,
                          ),
                          CustomText(
                            text: food.avgRating!
                                .toStringAsFixed(1),
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,
                            color:
                            AppColors.success,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}