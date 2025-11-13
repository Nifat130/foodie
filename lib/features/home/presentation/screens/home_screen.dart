import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/common/widgets/custom_text.dart';
import 'package:foodie/core/common/widgets/food_picture.dart';
import 'package:foodie/core/utils/app_colors.dart';
import 'package:foodie/core/utils/app_images.dart';
import 'package:foodie/features/home/controllers/home_controller.dart';
import 'package:foodie/features/home/presentation/widgets/actuals/campaign_widget.dart';
import 'package:foodie/features/home/presentation/widgets/actuals/restaurant_widget.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/app_header_shimmer.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/banner_shimmer.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/campaign_shimmer.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/category_shimmer.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/popular_food_shimmer.dart';
import 'package:foodie/features/home/presentation/widgets/shimmers/restaurant_shimmer.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/actuals/app_header_widget.dart';
import '../widgets/actuals/banner_widget.dart';
import '../widgets/actuals/category_widget.dart';
import '../widgets/actuals/indicator_widget.dart';
import '../widgets/actuals/no_data_found_widget.dart';
import '../widgets/actuals/popular_food_widget.dart';
import '../widgets/actuals/portion_header.dart';

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

              /// Header Part
              Obx(() {
                if (controller.isConfigurationLoading.value) {
                  return AppHeaderShimmer(controller: controller);
                } else {
                  return AppHeaderWidget(controller: controller);
                }
              }),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),

                        // Banner Part
                        Obx((){
                          if(controller.isBannerLoading.value){
                            return BannerShimmer();
                          }
                          else if(controller.bannerData == null || controller.bannerData.banners == null || controller.bannerData.banners!.isEmpty){
                            return NoDataFoundWidget();
                          }
                          else{
                            return BannerWidget(controller: controller);
                          }
                        }
                        ),
                        SizedBox(height: 8),

                        // Indicator Part
                        Obx((){
                          if(controller.isBannerLoading.value || controller.bannerData == null || controller.bannerData.banners == null){
                            return SizedBox();
                          }
                          else{
                            return IndicatorWidget(controller: controller);
                          }
                        }
                        ),

                        PortionHeaderWidget(name: "Categories"),

                        /// Categories Part
                        Obx((){
                          if(controller.isCategoriesLoading.value){
                            return CategoryShimmer();
                          }
                          else if(controller.categoriesData == null || controller.categoriesData.isEmpty){
                            return NoDataFoundWidget();
                          }
                          else{
                            return CategoryWidget(controller: controller);
                          }
                        }),
                        SizedBox(height: 8),
                        PortionHeaderWidget(name: "Popular Food Nearby"),

                        /// Popular Food Part
                        Obx((){
                          if(controller.isPopularFoodLoading.value){
                            return PopularFoodShimmer();
                          }
                          else if(controller.popularFoodData.products == null || controller.popularFoodData.products!.isEmpty){
                            return NoDataFoundWidget();
                          }
                          else {
                            return PopularFoodWidget(controller: controller);
                          }
                        }),
                        SizedBox(height: 8),
                        PortionHeaderWidget(name: "Food Campaign"),

                        // Campaign Part
                        Obx((){
                          if(controller.isCampaignFoodLoading.value){
                            return CampaignShimmer();
                          }
                          else if(controller.campaignFoodData == null || controller.campaignFoodData.isEmpty){
                            return NoDataFoundWidget();
                          }
                          else{
                            return CampaignWidget(controller: controller);
                          }
                        }),
                        SizedBox(height: 8),

                        PortionHeaderWidget(name: "Restaurants"),

                        /// Restaurant Part
                        Obx((){
                          if(controller.isRestaurantLoading.value){
                            return RestaurantShimmer();
                          }
                          else if(controller.restaurantData.restaurants == null || controller.restaurantData.restaurants!.isEmpty){
                            return NoDataFoundWidget();
                          }
                          else{
                            return RestaurantWidget(controller: controller);
                          }
                        }),
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











