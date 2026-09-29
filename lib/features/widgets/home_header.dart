import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  final int taskCount;

  const HomeHeader({
    super.key,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All Tasks',
          style: AppTextStyles.screenTitle,
        ),
        SizedBox(height: 4.h),
        Text(
          '$taskCount tasks',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}