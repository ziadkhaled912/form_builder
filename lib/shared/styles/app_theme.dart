import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 68.h,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Cairo',
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),

    ),
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: AppColors.primaryColor,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0x000517ab),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Color(0x000517ab),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: const Color(0x000517ab),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0x000517ab),
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );

}
