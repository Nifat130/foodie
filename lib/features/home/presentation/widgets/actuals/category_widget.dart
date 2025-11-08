import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/food_picture.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../controllers/home_controller.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: (80 * (width < 650 ? 1 : 2)),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 16),
            itemCount: 7,
            itemBuilder: (context, index) {
              final category =
              controller.categoriesData[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Column(
                  spacing: 4,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                          8,
                        ),
                        color: AppColors.textWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withAlpha(
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
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(
                          4,
                        ),
                        child: FoodPicture(
                          imageLink: category
                              .imageFullUrl!,
                          width:
                          (40 *
                              (width < 650
                                  ? 1
                                  : 2)),
                          height:
                          (40 *
                              (width < 650
                                  ? 1
                                  : 2)),
                        ),
                      ),
                    ),
                    CustomText(
                      text: category.name ?? "None",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}