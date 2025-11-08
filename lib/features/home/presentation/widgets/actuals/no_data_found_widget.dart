import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/app_colors.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: CustomText(text: "No data found", color: AppColors.textSecondary, fontSize: 12,),
      ),
    );
  }
}