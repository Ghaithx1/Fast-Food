import 'package:fast_food/core/routing/app_route.dart';
import 'package:fast_food/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FastFoodApp extends StatelessWidget {
  AppRouting appRouting;
  FastFoodApp(this.appRouting,{super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390,850),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.manage_orders_screen,
        onGenerateRoute:appRouting.onGenerateRoutes,
        color: Colors.white,
      ),
    );
  }
}