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
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          shadowColor: Colors.transparent,
          indicatorColor: AppColors.accent,
          iconTheme: MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
          labelTextStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(5),
            ),
            minimumSize: MaterialStateProperty.all<Size>(const Size(0, 0)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
            overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
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
        ),
      ),
    );
  }
}
