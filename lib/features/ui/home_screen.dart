import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/task_info.dart';
import '../widgets/home_header.dart';
import '../widgets/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void completeTask(int index) {
    setState(() {
      tasks[index].isCompleted = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Tasks',
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            HomeHeader(
              taskCount: tasks.length,
            ),

            SizedBox(height: 24.h),
            Expanded(
              child: TasksList(
                onTaskCompleted: completeTask,
              ),
            ),


          ],
        ),
      ),
    );
  }
}