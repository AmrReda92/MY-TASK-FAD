import 'package:fad_task_app/features/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FadTaskApp extends StatelessWidget {
  const FadTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'My Tasks',
      debugShowCheckedModeBanner: false,
        home: HomeScreen(),

      ),
    );
  }
}
