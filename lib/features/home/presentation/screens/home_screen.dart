import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/common/widgets/custom_submit_button.dart';
import 'package:foodie/core/common/widgets/custom_text.dart';
import 'package:foodie/core/common/widgets/custom_textformfield.dart';
import 'package:foodie/core/utils/app_colors.dart';
import 'package:foodie/core/utils/app_images.dart';
import 'package:foodie/features/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              Padding(
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
                            text: "76A eighth evenue, New York, US",
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
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 90,
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
                          items: controller.posterImageList.map((path) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      path,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 8,),
                        Obx(() =>
                            Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.currentPoster.value,
                                count: controller.posterImageList.length,
                                effect: WormEffect(
                                  dotColor: AppColors.primary,
                                  activeDotColor: Colors.green,
                                  dotHeight: 6.0,
                                  dotWidth: 6.0,
                                  spacing: 8.0,
                                  radius: 8.0,
                                ),
                              ),
                            ),
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
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index){
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
                                      child: Image.asset(
                                        AppImages.dummyFoodPicture,
                                        fit: BoxFit.fill,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    CustomText(text: "All", fontSize: 12, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)
                                  ],
                                ),
                              );
                            },
                          ),
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
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                            itemBuilder: (context, index){
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
                                    ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), child: Image.asset(AppImages.dummyFoodPicture, width: double.infinity,height: 90, fit: BoxFit.fill,)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 4,
                                        children: [
                                          CustomText(text: "Friend Noodles", fontSize: 12, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
                                          CustomText(text: "Mc Donald", fontSize: 8, fontWeight: FontWeight.w600, color: AppColors.textSecondary,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomText(text: "\$7.55", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary,)),
                                              Icon(Icons.star, color: AppColors.success, size: 12,),
                                              CustomText(text: "4.99", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success,)
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
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                            itemBuilder: (context, index){
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
                                          child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(AppImages.dummyFoodPicture, width: 80, height: double.infinity, fit: BoxFit.fill,)),
                                        ),
                                        Positioned(
                                          top: 16,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.lightGreen,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                            child: CustomText(text: "20% off", color: AppColors.textWhite, fontWeight: FontWeight.w500, fontSize: 8,),
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
                                          CustomText(text: "Burger", fontSize: 12, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
                                          CustomText(text: "Mc Donald", fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.textSecondary, textOverflow: TextOverflow.ellipsis,),
                                          Row(
                                            children: [
                                              Icon(Icons.star, color: AppColors.success, size: 12,),
                                              Icon(Icons.star, color: AppColors.success, size: 12,),
                                              Icon(Icons.star, color: AppColors.success, size: 12,),
                                              Icon(Icons.star, color: AppColors.success, size: 12,),
                                              Icon(Icons.star, color: AppColors.success, size: 12,),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomText(text: "\$5", fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textBlue,),
                                              SizedBox(width: 4,),
                                              CustomText(text: "\$10", fontSize: 8, fontWeight: FontWeight.w600, color: AppColors.textSecondary, decoration: TextDecoration.lineThrough,),
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
      bottomNavigationBar: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.textWhite
              ),
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.home_filled, color: AppColors.success, size: 28,),
                  Icon(Icons.favorite_border_rounded, color: AppColors.success, size: 28,),
                  Icon(Icons.favorite_border_rounded, color: AppColors.textWhite, size: 28,),
                  Icon(Icons.edit_note_outlined, color: AppColors.success, size: 32,),
                  Icon(Icons.menu, color: AppColors.success, size: 28,),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Icon(Icons.shopping_cart_rounded, color: AppColors.textWhite, size: 28,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
