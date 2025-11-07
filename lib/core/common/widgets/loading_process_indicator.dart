import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:foodie/core/common/widgets/custom_text.dart';

import '../../utils/app_colors.dart';

Future<void> loadingProgressIndicator({String? title}) async {

  if (!(Get.isDialogOpen ?? false)) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.primary,
        insetPadding: EdgeInsets.symmetric(horizontal: 140),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SpinKitWave(
                  color: AppColors.textWhite,
                  size: 24,
                ),
              ),
              SizedBox(height: 16,),
              CustomText(text: title ?? "Processing...", color: AppColors.textWhite, fontWeight: FontWeight.w600,)
            ],
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
  await Future.delayed(Duration(milliseconds: 1500)); //
}

Future<void> hideProgressIndicator() async {
  await Future.delayed(Duration(milliseconds: 100));
  if (Get.isDialogOpen ?? false) {
    try {
      Get.back();
    } catch (e) {
      // Already closed or error while closing
    }
  }
}

