import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tags extends StatelessWidget {
  const Tags({super.key,});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Row(
          children: List.generate(4, (index) {
            return GestureDetector(
              onTap: () {
                ctrl.updateTagIndex(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ctrl.tagIndex==index?AppColors.accent:Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                child: Text(
                  ctrl.tags[index],
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: ctrl.tagIndex==index?AppColors.primary:Colors.white24,
                  ),
                ),
              ),
            );
          }),
        );
      }
    );
  }
}


