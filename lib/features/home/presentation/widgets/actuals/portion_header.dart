import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/app_colors.dart';

class PortionHeaderWidget extends StatelessWidget {
  const PortionHeaderWidget({
    super.key,
    required this.name,
    this.route,
  });

  final String name;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: name,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          GestureDetector(
            onTap: () {
              // Using 'route' navigation can be done
            },
            child: CustomText(
              text: "View All",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.success,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.success,
              decorationThickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}