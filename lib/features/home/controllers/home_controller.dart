import 'dart:developer';
import 'package:foodie/core/common/widgets/app_snack_bar.dart';
import 'package:foodie/core/utils/app_images.dart';
import 'package:foodie/features/home/data/models/get_banners_model.dart';
import 'package:foodie/features/home/data/models/get_categories_model.dart';
import 'package:foodie/features/home/data/models/get_configuration_model.dart';
import 'package:foodie/features/home/data/models/get_food_campaign_model.dart';
import 'package:foodie/features/home/data/models/get_popular_foods_model.dart';
import 'package:foodie/features/home/data/models/get_rastaurants_model.dart';
import 'package:foodie/features/home/data/network/api_callers.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;

  RxInt currentPoster = 1.obs;
  RxInt currentIndex = 0.obs;

  var posterImageList = [
    AppImages.dummyFoodPicture,
    AppImages.dummyFoodPicture,
    AppImages.dummyFoodPicture,
  ];

  final apiCaller = ApiCallers();

  var configurationData = GetConfigurationModel();
  var bannerData = GetBannersModel();
  var categoriesData = <GetCategoriesModel>[];
  var popularFoodData = GetPopularFoodsModel();
  var campaignFoodData = <GetFoodCampaignModel>[];
  var restaurantData = GetRestaurantsModel();

  var isConfigurationLoading = true.obs;
  var isBannerLoading = true.obs;
  var isCategoriesLoading = true.obs;
  var isPopularFoodLoading = true.obs;
  var isCampaignFoodLoading = true.obs;
  var isRestaurantLoading = true.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    log("===============1=================");
     requestToGetConfiguration();
    log("===============2=================");
     requestToGetBanners();
    log("===============3=================");
     requestToGetCategories();
    log("===============4=================");
     requestToGetPopularFoods();
    log("===============5=================");
     requestToGetCampaignFoods();
    log("===============6=================");
     requestToGetRestaurants();
  }

  // Call Configuration Api
  void requestToGetConfiguration() async {
    isConfigurationLoading.value = true;
    final result = await apiCaller.getConfigurations();

    result.fold(
      (error) => AppSnackBar.showError(error),
      (success) => configurationData = success,
    );
    isConfigurationLoading.value = false;
  }

  // Call Banner Api
  void requestToGetBanners() async {
    isBannerLoading.value = true;

    final result = await apiCaller.getBanners();

    result.fold(
      (error) => AppSnackBar.showError(error),
      (success) => bannerData = success,
    );

    isBannerLoading.value = false;
  }

  // Call Category Api
  void requestToGetCategories() async {
    isCategoriesLoading.value = true;

    final result = await apiCaller.getCategories();

    result.fold(
      (error) => AppSnackBar.showError(error),
      (success) => categoriesData.addAll(success),
    );

    isCategoriesLoading.value = false;
  }

  // Call Popular Food Api
  void requestToGetPopularFoods() async {
    isPopularFoodLoading.value = true;

    final result = await apiCaller.getPopularFoods();

    result.fold(
      (error) => AppSnackBar.showError(error),
      (success) => popularFoodData = success,
    );

    isPopularFoodLoading.value = false;
  }

  // Call Campaign Food Api
  void requestToGetCampaignFoods() async {
    isCampaignFoodLoading.value = true;

    final result = await apiCaller.getCampaigns();

    result.fold(
      (error) => AppSnackBar.showError(error),
      (success) => campaignFoodData.assignAll(success),
    );

    isCampaignFoodLoading.value = false;
  }

  // Call Restaurants Api
  void requestToGetRestaurants() async {
    isRestaurantLoading.value = true;

    final result = await apiCaller.getRestaurants();

    result.fold(
      (error) => AppSnackBar.showError(error),
      (success) => restaurantData = success,
    );

    isRestaurantLoading.value = false;
  }

  // Calculate Campaign Food Discount
  double calculateDiscount({required String? type, required String actualPrice, required String discount}){
    final ap = double.parse(actualPrice);
    final d = double.parse(discount);
    if(type == "percent"){
      return ap - (ap * (d / 100));
    }
    else{
      return ap - d;
    }
  }

  int starCount({dynamic star}){
    if(star.runtimeType == double){
      log((star as double).floor().toString());
      return (star as double).floor();
    }
    else{
      return star;
    }
  }
}
