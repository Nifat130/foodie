import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/common/widgets/custom_text.dart';
import 'package:foodie/core/common/widgets/custom_textformfield.dart';
import 'package:foodie/core/common/widgets/food_picture.dart';
import 'package:foodie/core/utils/app_colors.dart';
import 'package:foodie/core/utils/app_images.dart';
import 'package:foodie/features/home/controllers/home_controller.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/app_header_shimmer.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/actuals/app_header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      extendBody: true,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() =>
                controller.isConfigurationLoading.value ?
                    AppHeaderShimmer(controller: controller) :
                    AppHeaderWidget(controller: controller)
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        Obx(() =>
                          controller.isBannerLoading.value ?
                              SizedBox() :
                          CarouselSlider(
                            options: CarouselOptions(
                                height: 120,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                viewportFraction: 0.8,
                                initialPage: 1,
                                autoPlayInterval: const Duration(seconds: 5),
                                autoPlayAnimationDuration: const Duration(milliseconds: 300),
                                onPageChanged: (i, reason){
                                  controller.currentPoster.value = i;
                                }
                            ),
                            items: controller.bannerData.banners!.map((banner) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: AppImages.dummyFoodPicture,
                                        image: banner.restaurant!.foods![0].imageFullUrl!,
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width,
                                        fadeInDuration: const Duration(milliseconds: 300),
                                        fadeOutDuration: const Duration(milliseconds: 200),
                                        imageErrorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            AppImages.dummyFoodPicture, // fallback asset image
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context).size.width,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          )
                        ),
                        SizedBox(height: 8,),
                        Obx(() =>
                            controller.isBannerLoading.value ?
                                SizedBox() :
                            Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.currentPoster.value,
                                count: controller.bannerData.banners!.length,
                                effect: WormEffect(
                                  dotColor: AppColors.primary,
                                  activeDotColor: Colors.green,
                                  dotHeight: 6.0,
                                  dotWidth: 6.0,
                                  spacing: 8.0,
                                  radius: 8.0,
                                ),
                              ),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Categories", fontSize: 16, fontWeight: FontWeight.w700,),
                              GestureDetector(onTap: (){}, child: CustomText(text: "View All", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success, decoration: TextDecoration.underline, decorationColor: AppColors.success, decorationThickness: 1,)),
                            ],
                          ),
                        ),
                        Obx(() =>
                          controller.isCategoriesLoading.value ?
                              SizedBox() :
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(right: 16),
                              itemCount: 7,
                              itemBuilder: (context, index){
                                final category = controller.categoriesData[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    spacing: 4,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: AppColors.textWhite,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(50), // shadow color
                                              blurRadius: 4,
                                              offset: const Offset(2, 2),           // position of the shadow
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: AppImages.dummyFoodPicture,
                                            image: category.imageFullUrl!,
                                            fit: BoxFit.cover,
                                            width: 40,
                                            height: 40,
                                            fadeInDuration: const Duration(milliseconds: 300),
                                            fadeOutDuration: const Duration(milliseconds: 200),
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                AppImages.dummyFoodPicture, // fallback asset image
                                                fit: BoxFit.fill,
                                                width: 40,
                                                height: 40,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      CustomText(text: category.name ?? "None", fontSize: 12, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Popular Food Nearby", fontSize: 16, fontWeight: FontWeight.w700,),
                              GestureDetector(onTap: (){}, child: CustomText(text: "View All", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success, decoration: TextDecoration.underline, decorationColor: AppColors.success, decorationThickness: 1,)),
                            ],
                          ),
                        ),
                        Obx(() =>
                          controller.isPopularFoodLoading.value ?
                              SizedBox() :
                          SizedBox(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                              itemBuilder: (context, index){
                                final food = controller.popularFoodData.products![index];
                                return Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.textWhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50), // shadow color
                                        blurRadius: 4,
                                        offset: const Offset(2, 2),           // position of the shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(right: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: AppImages.dummyFoodPicture,
                                            image: food.imageFullUrl!,
                                            fit: BoxFit.cover,
                                            height: 90,
                                            width: MediaQuery.of(context).size.width,
                                            fadeInDuration: const Duration(milliseconds: 300),
                                            fadeOutDuration: const Duration(milliseconds: 200),
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                AppImages.dummyFoodPicture, // fallback asset image
                                                fit: BoxFit.fill,
                                                height: 90,
                                                width: MediaQuery.of(context).size.width,
                                              );
                                            },
                                          )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 4,
                                          children: [
                                            CustomText(text: food.name ?? "Unknown", fontSize: 12, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
                                            CustomText(text: food.restaurantName ?? "Unknown", fontSize: 8, fontWeight: FontWeight.w600, color: AppColors.textSecondary,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(child: CustomText(text: food.price!.toStringAsFixed(2), fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary,)),
                                                Icon(Icons.star, color: AppColors.success, size: 12,),
                                                CustomText(text: food.avgRating!.toStringAsFixed(1), fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success,)
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Food Campaign", fontSize: 16, fontWeight: FontWeight.w700,),
                              GestureDetector(onTap: (){}, child: CustomText(text: "View All", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success, decoration: TextDecoration.underline, decorationColor: AppColors.success, decorationThickness: 1,)),
                            ],
                          ),
                        ),
                        Obx(() =>
                          controller.isCampaignFoodLoading.value ?
                              SizedBox() :
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.campaignFoodData.length >= 5 ? 5 : controller.campaignFoodData.length,
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              itemBuilder: (context, index){
                                final campaignFood = controller.campaignFoodData[index];
                                final discountPrice = controller.calculateDiscount(type: campaignFood.discountType, actualPrice: campaignFood.price.toString(), discount: campaignFood.discount.toString());
                                final rating = controller.starCount(star: campaignFood.avgRating);
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.textWhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50), // shadow color
                                        blurRadius: 4,
                                        offset: const Offset(2, 2),           // position of the shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: ClipRRect(borderRadius: BorderRadius.circular(8), 
                                                child: FoodPicture(imageLink: campaignFood.imageFullUrl!, width: 80,)
                                            ),
                                          ),
                                          Positioned(
                                            top: 16,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.lightGreen,
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                              child: CustomText(text: "${campaignFood.discount}${campaignFood.discountType == "percent" ? "%" : "\$"} off", color: AppColors.textWhite, fontWeight: FontWeight.w500, fontSize: 8,),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 2,
                                          children: [
                                            CustomText(text: campaignFood.name ?? "Unknown", fontSize: 12, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
                                            CustomText(text: campaignFood.restaurantName ?? "Unknown" , fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.textSecondary, textOverflow: TextOverflow.ellipsis,),
                                            Row(
                                              children: [
                                                for(int i = 0; i < rating; i++)
                                                  Icon(Icons.star, color: AppColors.success, size: 12,),
                                                if(rating == 0)
                                                  CustomText(text: "No ratings", fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.success, textOverflow: TextOverflow.ellipsis, maxLines: 1,)
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomText(text: "\$${discountPrice.toStringAsFixed(2)}", fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textBlue,),
                                                SizedBox(width: 4,),
                                                CustomText(text: "\$${campaignFood.price}", fontSize: 8, fontWeight: FontWeight.w600, color: AppColors.textSecondary, decoration: TextDecoration.lineThrough,),
                                                SizedBox(width: 24,),
                                                GestureDetector(
                                                  onTap: (){},
                                                  child: Icon(Icons.add, color: AppColors.textPrimary, size: 24,),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Restaurants", fontSize: 16, fontWeight: FontWeight.w700,),
                              GestureDetector(onTap: (){}, child: CustomText(text: "View All", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success, decoration: TextDecoration.underline, decorationColor: AppColors.success, decorationThickness: 1,)),
                            ],
                          ),
                        ),
                        /// GPT here this part I wanna convert into a ListView.builder
                        Obx(() =>
                          controller.isRestaurantLoading.value ?
                              SizedBox() :
                          ListView.builder(
                            itemCount: controller.restaurantData.restaurants!.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final restaurant = controller.restaurantData.restaurants![index];
                              final rating = controller.starCount(star: restaurant.avgRating);
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.textWhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50), // shadow color
                                        blurRadius: 4,
                                        offset: const Offset(2, 2),           // position of the shadow
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          spacing: 8,
                                          children: [
                                            ClipRRect(borderRadius: BorderRadius.circular(8), child: FoodPicture(imageLink: restaurant.logoFullUrl!, width: 90,)),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                spacing: 4,
                                                children: [
                                                  CustomText(text: restaurant.name ?? "Unknown", fontSize: 12, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
                                                  CustomText(text: restaurant.address ?? "Unknown", fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.textSecondary, textOverflow: TextOverflow.ellipsis, maxLines: 2,),
                                                  Row(
                                                    children: [
                                                      for(int i = 0; i < rating; i++)
                                                      Icon(Icons.star, color: AppColors.success, size: 12,),
                                                      if(rating == 0)
                                                        CustomText(text: "No ratings", fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.success, textOverflow: TextOverflow.ellipsis, maxLines: 1,)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        spacing: 30,
                                        children: [
                                          GestureDetector(
                                            onTap: (){},
                                            child: Icon(Icons.favorite_border_rounded, color: AppColors.textSecondary,),
                                          ),
                                          GestureDetector(
                                              onTap: (){},
                                              child: Icon(Icons.add)),
                                        ],
                                      )
                                    ],
                                  )
                              );
                            },
                          )
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



