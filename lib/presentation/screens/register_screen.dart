import 'package:chatsapp/presentation/controllers/login_controller.dart';
import 'package:chatsapp/presentation/controllers/password_hint_controller.dart';
import 'package:chatsapp/presentation/controllers/register_controller.dart';
import 'package:chatsapp/presentation/utils/validations.dart';
import 'package:chatsapp/presentation/widgets/login/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            GetBuilder<RegisterController>(builder: (ctrl) {
              return Form(
                key: ctrl.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      nameField(ctrl, context),
                      const SizedBox(height: 10),
                      emailField(ctrl, context),
                      const SizedBox(height: 10),
                      passwordField(ctrl, context),
                      const SizedBox(height: 10),
                      confirmPasswordField(ctrl, context),
                      const SizedBox(height: 10),
                      hints(),
                      const SizedBox(height: 10),
                      registerButton(ctrl),
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

  GetBuilder<HintController> hints() {
    return GetBuilder<HintController>(builder: (hintCtrl) {
      return Visibility(
        //visible: passwordValidation(ctrl.passwordController.text.trim())=='weak password' || ctrl.passFocus,
        child: Column(
          children: [
            hintLine("Spacial characters", hintCtrl.hints[0]),
            hintLine("Uppercase letter", hintCtrl.hints[1]),
            hintLine("lower letter", hintCtrl.hints[2]),
            hintLine("Number", hintCtrl.hints[3]),
          ],
        ),
      );
    });
  }

  Row hintLine(String hint, bool conditionFilled) {
    return Row(
      children: [
        const SizedBox(width: 40),
        Icon(
          Icons.circle,
          size: 8,
          color:
              conditionFilled ? Colors.red.withOpacity(0.5) : AppColors.accent,
        ),
        const SizedBox(width: 5),
        Text(
          hint,
          style: TextStyle(
            color: conditionFilled
                ? Colors.red.withOpacity(0.5)
                : AppColors.accent,
            fontSize: 12,
          ),
        ),
      ],
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

  ElevatedButton registerButton(RegisterController ctrl) {
    return ElevatedButton(
      onPressed: () {
        ctrl.emailIconActive(false);
        ctrl.passIconActive(false);
        ctrl.passIconActive2(false);
        ctrl.nameIconActive(false);
        ctrl.register();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white70,
      ),
      child: const Text('Register'),
    );
  }

  TextFormField passwordField(RegisterController ctrl, BuildContext context) {
    return TextFormField(
      controller: ctrl.passwordController,
      onTap: () {
        ctrl.passIconActive2(false);
        ctrl.passIconActive(true);
        ctrl.emailIconActive(false);
        ctrl.nameIconActive(false);
      },
      onChanged: (value) {
        Get.find<HintController>().passwordHint(value);
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
      ),
      style: const TextStyle(
        color: Colors.white70,
      ),
      validator: (value) {
        return passwordValidation(value);
      },
    );
  }

  TextFormField confirmPasswordField(
      RegisterController ctrl, BuildContext context) {
    return TextFormField(
      controller: ctrl.confirmPasswordController,
      onTap: () {
        ctrl.passIconActive2(true);
        ctrl.passIconActive(false);
        ctrl.emailIconActive(false);
        ctrl.nameIconActive(false);
      },
      onFieldSubmitted: (_) {
        ctrl.passIconActive2(false);
      },
      onTapOutside: (_) {
        ctrl.passIconActive2(false);
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        icon: Icon(
          Icons.key,
          color: ctrl.passFocus2 ? AppColors.primary : AppColors.accent,
        ),
      ),
      style: const TextStyle(
        color: Colors.white70,
      ),
      validator: (value) {
        return ctrl.confirmPasswordValidation(value);
      },
    );
  }

  TextFormField emailField(RegisterController ctrl, BuildContext context) {
    return TextFormField(
        controller: ctrl.emailController,
        onTap: () {
          ctrl.passIconActive2(false);
          ctrl.passIconActive(false);
          ctrl.emailIconActive(true);
          ctrl.nameIconActive(false);
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
        validator: (value) {
          return emailValidation(value);
        });
  }

  TextFormField nameField(RegisterController ctrl, BuildContext context) {
    return TextFormField(
        controller: ctrl.nameController,
        onTap: () {
          ctrl.passIconActive2(false);
          ctrl.passIconActive(false);
          ctrl.emailIconActive(false);
          ctrl.nameIconActive(true);
        },
        onFieldSubmitted: (_) {
          ctrl.nameIconActive(false);
        },
        onTapOutside: (_) {
          ctrl.nameIconActive(false);
          FocusScope.of(context).unfocus();
        },
        style: const TextStyle(
          color: Colors.white70,
        ),
        decoration: InputDecoration(
          hintText: 'Name',
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.accent, width: 2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
          icon: Icon(
            Icons.person,
            color: ctrl.nameFocus ? AppColors.primary : AppColors.accent,
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Provide your full name';
          } else {
            return null;
          }
        });
  }
}
