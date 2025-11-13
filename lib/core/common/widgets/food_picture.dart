import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_images.dart';

// class FoodPicture extends StatelessWidget {
//   const FoodPicture({super.key, required this.imageLink, this.height, this.width});
//
//   final String imageLink;
//   final double? height;
//   final double? width;
//   @override
//   Widget build(BuildContext context) {
//     return FadeInImage.assetNetwork(
//       placeholder: AppImages.dummyFoodPicture,
//       image: imageLink,
//       fit: BoxFit.cover,
//       height: height,
//       width: width ?? MediaQuery.of(context).size.width,
//       fadeInDuration: const Duration(milliseconds: 300),
//       fadeOutDuration: const Duration(milliseconds: 200),
//       imageErrorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           AppImages.dummyFoodPicture, // fallback asset image
//           fit: BoxFit.fill,
//           height: height ?? MediaQuery.of(context).size.height,
//           width: width ?? MediaQuery.of(context).size.width,
//         );
//       },
//     );
//   }
// }

class FoodPicture extends StatelessWidget {
  const FoodPicture({super.key, required this.imageLink, this.height, this.width});

  final String imageLink;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink,
      fit: BoxFit.cover,
      height: height,
      width: width ?? MediaQuery.of(context).size.width,

      // 👇 Fade animation similar to FadeInImage
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 200),

      // 👇 Placeholder while image is loading
      placeholder: (context, url) => Image.asset(
        AppImages.dummyFoodPicture,
        fit: BoxFit.cover,
        height: height ?? MediaQuery.of(context).size.height,
        width: width ?? MediaQuery.of(context).size.width,
      ),

      // 👇 Fallback if image fails to load
      errorWidget: (context, url, error) => Image.asset(
        AppImages.dummyFoodPicture,
        fit: BoxFit.fill,
        height: height ?? MediaQuery.of(context).size.height,
        width: width ?? MediaQuery.of(context).size.width,
      ),
    );
  }
}
