import 'package:chatsapp/presentation/controllers/login_controller.dart';
import 'package:chatsapp/presentation/widgets/login/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            welcomeNote(context),
            const SizedBox(height: 30),
            GetBuilder<LoginController>(builder: (ctrl) {
              return Form(
                key: ctrl.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      emailField(ctrl, context),
                      const SizedBox(height: 10),
                      passwordField(ctrl, context),
                      const SizedBox(height: 20),
                      loginButton(ctrl),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Column welcomeNote(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Welcome back to ChatsApp',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Text(
          'Enter your email and password',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }

  ElevatedButton loginButton(LoginController ctrl) {
    return ElevatedButton(
      onPressed: () {
        ctrl.emailIconActive(false);
        ctrl.passIconActive(false);
        ctrl.login();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white70,
      ),
      child: const Text('Login'),
    );
  }

  TextFormField passwordField(LoginController ctrl, BuildContext context) {
    return TextFormField(
      controller: ctrl.passwordController,
      onTap: () {
        ctrl.passIconActive(true);
        ctrl.emailIconActive(false);
      },
      onFieldSubmitted: (_) {
        ctrl.passIconActive(false);
      },
      onTapOutside: (_) {
        ctrl.passIconActive(false);
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Password',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        icon: Icon(
          Icons.key,
          color: ctrl.passFocus ? AppColors.primary : AppColors.accent,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            ctrl.toggleObscureness();
          },
          child: Icon(
            ctrl.passObscure ? Icons.visibility_off : Icons.visibility,
            color: ctrl.passObscure ? AppColors.accent : AppColors.primary,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white70,
      ),
      obscureText: ctrl.passObscure,
    );
  }

  TextFormField emailField(LoginController ctrl, BuildContext context) {
    return TextFormField(
      controller: ctrl.emailController,
      onTap: () {
        ctrl.emailIconActive(true);
        ctrl.passIconActive(false);
      },
      onFieldSubmitted: (_) {
        ctrl.emailIconActive(false);
      },
      onTapOutside: (_) {
        ctrl.emailIconActive(false);
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        color: Colors.white70,
      ),
      decoration: InputDecoration(
        hintText: 'Email',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        icon: Icon(
          Icons.email,
          color: ctrl.emailFocus ? AppColors.primary : AppColors.accent,
        ),
      ),
    );
  }
}
