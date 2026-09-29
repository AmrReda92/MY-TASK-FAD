import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/task_info.dart';
import 'task_card.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.onTaskCompleted,
  });

  final ValueChanged<int> onTaskCompleted;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 16.h,
      ),
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onComplete: () => onTaskCompleted(index),
        );
      },
    );
  }
}