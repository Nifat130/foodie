import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/food_picture.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';

class CampaignWidget extends StatelessWidget {
  const CampaignWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
        controller.campaignFoodData.length >= 5
            ? 5
            : controller.campaignFoodData.length,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        itemBuilder: (context, index) {
          final campaignFood =
          controller.campaignFoodData[index];
          final discountPrice = controller
              .calculateDiscount(
            type: campaignFood.discountType,
            actualPrice: campaignFood.price
                .toString(),
            discount: campaignFood.discount
                .toString(),
          );
          final rating = controller.starCount(
            star: campaignFood.avgRating,
          );
          return Container(
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
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 4,
                      ),
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(
                          8,
                        ),
                        child: FoodPicture(
                          imageLink: campaignFood
                              .imageFullUrl!,
                          width: 80,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                          AppColors.lightGreen,
                          borderRadius:
                          BorderRadius.only(
                            topRight:
                            Radius.circular(
                              8,
                            ),
                            bottomRight:
                            Radius.circular(
                              8,
                            ),
                          ),
                        ),
                        padding:
                        EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        child: CustomText(
                          text:
                          "${campaignFood.discount}${campaignFood.discountType == "percent" ? "%" : "\$"} off",
                          color:
                          AppColors.textWhite,
                          fontWeight:
                          FontWeight.w500,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      CustomText(
                        text:
                        campaignFood.name ??
                            "Unknown",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textOverflow:
                        TextOverflow.ellipsis,
                      ),
                      CustomText(
                        text:
                        campaignFood
                            .restaurantName ??
                            "Unknown",
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color:
                        AppColors.textSecondary,
                        textOverflow:
                        TextOverflow.ellipsis,
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
                              color:
                              AppColors.success,
                              size: 12,
                            ),
                          if (rating == 0)
                            CustomText(
                              text: "No ratings",
                              fontSize: 8,
                              fontWeight:
                              FontWeight.w700,
                              color:
                              AppColors.success,
                              textOverflow:
                              TextOverflow
                                  .ellipsis,
                              maxLines: 1,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisSize:
                        MainAxisSize.min,
                        children: [
                          CustomText(
                            text:
                            "\$${discountPrice.toStringAsFixed(2)}",
                            fontSize: 10,
                            fontWeight:
                            FontWeight.w600,
                            color:
                            AppColors.textBlue,
                          ),
                          SizedBox(width: 4),
                          CustomText(
                            text:
                            "\$${campaignFood.price}",
                            fontSize: 8,
                            fontWeight:
                            FontWeight.w600,
                            color: AppColors
                                .textSecondary,
                            decoration:
                            TextDecoration
                                .lineThrough,
                          ),
                          SizedBox(width: 24),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add,
                              color: AppColors
                                  .textPrimary,
                              size: 24,
                            ),
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