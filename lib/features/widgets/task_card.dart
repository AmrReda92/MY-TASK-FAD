import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onComplete,
  });

  final TaskModel task;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = task.isCompleted;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      shadowColor: AppColors.primary,
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: AppTextStyles.taskTitle,
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? AppColors.completed.withValues(alpha: 0.1)
                        : AppColors.pending.withValues(alpha: 0.1),
                  ),
                  child: Icon(
                    isCompleted
                        ? Icons.check
                        : Icons.access_time,
                    size: 18.sp,
                    color: isCompleted
                        ? AppColors.completed
                        : AppColors.pending,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Text(
              task.description,
              style: AppTextStyles.taskDescription,
            ),

            SizedBox(height: 18.h),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.completed.withValues(alpha: 0.1)
                        : AppColors.pending.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isCompleted
                            ? Icons.check_circle
                            : Icons.circle,
                        size: 13.sp,
                        color: isCompleted
                            ? AppColors.completed
                            : AppColors.pending,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        isCompleted ? 'Completed' : 'Pending',
                        style: AppTextStyles.status.copyWith(
                          color: isCompleted
                              ? AppColors.completed
                              : AppColors.pending,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                if (!isCompleted)
                  ElevatedButton(
                    onPressed: onComplete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Complete',
                      style: AppTextStyles.button.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}