

import 'package:flutter/cupertino.dart';
import 'package:foodie/core/utils/app_images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isLoading = true.obs;

  RxInt currentPoster = 1.obs;

  var posterImageList = [
    AppImages.dummyFoodPicture,
    AppImages.dummyFoodPicture,
    AppImages.dummyFoodPicture,
  ];

}
