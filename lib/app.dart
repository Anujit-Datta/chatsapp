import 'package:chatsapp/controller_binder.dart';
import 'package:chatsapp/presentation/screens/home_screen.dart';
import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsApp extends StatelessWidget {
  const ChatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChatsApp',
      home: const HomeScreen(),
      initialBinding: ControllerBinders(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          shape: Border(bottom: BorderSide(color: Colors.white10.withOpacity(0.05))),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.background,
          surfaceTintColor: Colors.transparent,
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: Colors.transparent,
          indicatorColor: AppColors.accent,
          iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.white)),
          labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(5),
            ),
            minimumSize: WidgetStateProperty.all<Size>(const Size(0, 0)),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white70),
            overlayColor: WidgetStateProperty.all<Color>(Colors.white12),
          ),
        ),
        textTheme: textTheme(),
      ),
    );
  }

  TextTheme textTheme() {
    return const TextTheme(
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        //titleSmall: ,
        labelMedium: TextStyle(
          color: Colors.white24,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: Colors.white24,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.white24,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
      );
  }
}
