

import 'dart:developer';

import 'package:foodie/core/common/widgets/app_snack_bar.dart';
import 'package:foodie/core/services/network_caller.dart';
import 'package:foodie/core/utils/app_urls.dart';
import 'package:foodie/features/home/data/models/get_banners_model.dart';
import 'package:foodie/features/home/data/models/get_categories_model.dart';
import 'package:foodie/features/home/data/models/get_configuration_model.dart';
import 'package:foodie/features/home/data/models/get_food_campaign_model.dart';
import 'package:foodie/features/home/data/models/get_popular_foods_model.dart';
import 'package:foodie/features/home/data/models/get_rastaurants_model.dart';
import 'package:fpdart/fpdart.dart';

class ApiCallers{

  /// Get the Configuration
  Future<Either<String, GetConfigurationModel>> getConfigurations() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.configuration);

      if(response.isSuccess){
        final data = response.responseData;
        return Right(GetConfigurationModel.fromJson(data));
      }
      else{
        AppSnackBar.showError(response.errorMessage);
        log("The status code is: ${response.statusCode}");
        return Left(response.errorMessage.toString());
      }
    }catch(error){
      log("The error is: $error");
      return Left(error.toString());
    }
  }

  /// Get the Banners
  Future<Either<String, GetBannersModel>> getBanners() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.banners);

      if(response.isSuccess){
        final data = response.responseData;
        return Right(GetBannersModel.fromJson(data));
      }
      else{
        AppSnackBar.showError(response.errorMessage);
        log("The status code is: ${response.statusCode}");
        return Left(response.errorMessage.toString());
      }
    }catch(error){
      log("The error is: $error");
      return Left(error.toString());
    }
  }

  /// Get the Categories
  Future<Either<String, List<GetCategoriesModel>>> getCategories() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.categories);

      if(response.isSuccess){
        final data = response.responseData;
        if (data is List) {
          final list = data.map((e) => GetCategoriesModel.fromJson(e)).toList();
          return Right(list);
        } else {
          return Left("Invalid categories response format.");
        }
      }
      else{
        AppSnackBar.showError(response.errorMessage);
        log("The status code is: ${response.statusCode}");
        return Left(response.errorMessage.toString());
      }
    }catch(error){
      log("The error is: $error");
      return Left(error.toString());
    }
  }

  /// Get the Popular Foods
  Future<Either<String, GetPopularFoodsModel>> getPopularFoods() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.popularFoods);

      if(response.isSuccess){
        final data = response.responseData;
        return Right(GetPopularFoodsModel.fromJson(data));
      }
      else{
        AppSnackBar.showError(response.errorMessage);
        log("The status code is: ${response.statusCode}");
        return Left(response.errorMessage.toString());
      }
    }catch(error){
      log("The error is: $error");
      return Left(error.toString());
    }
  }

  /// Get the Campaigns
  Future<Either<String, List<GetFoodCampaignModel>>> getCampaigns() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.campaign);

      if(response.isSuccess){
        final data = response.responseData;
        if (data is List) {
          final list = data.map((e) => GetFoodCampaignModel.fromJson(e)).toList();
          return Right(list);
        } else {
          return Left("Invalid campaign food response format.");
        }
        return Right(data.map((element) => GetFoodCampaignModel.fromJson(element)));
      }
      else{
        AppSnackBar.showError(response.errorMessage);
        log("The status code is: ${response.statusCode}");
        return Left(response.errorMessage.toString());
      }
    }catch(error){
      log("The error is: $error");
      return Left(error.toString());
    }
  }

  /// Get the Campaigns
  Future<Either<String, GetRestaurantsModel>> getRestaurants() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.restaurants);

      if(response.isSuccess){
        final data = response.responseData;
        return Right(GetRestaurantsModel.fromJson(data));
      }
      else{
        AppSnackBar.showError(response.errorMessage);
        log("The status code is: ${response.statusCode}");
        return Left(response.errorMessage.toString());
      }
    }catch(error){
      log("The error is: $error");
      return Left(error.toString());
    }
  }

}