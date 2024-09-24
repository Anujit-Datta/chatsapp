import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (ctrl) {
          return NavigationBar(
            onDestinationSelected: (index) {
              ctrl.updateBnbIndex(index);
            },
            selectedIndex: ctrl.bnbIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  ctrl.bnbIndex == 0?Icons.chat:Icons.chat_outlined,
                  color: ctrl.bnbIndex == 0? AppColors.iconFill:null,
                ),
                label: 'Chats',
              ),
              NavigationDestination(
                icon: Icon(
                  ctrl.bnbIndex == 1?Icons.explore:Icons.explore_outlined,
                  color: ctrl.bnbIndex == 1? AppColors.iconFill:null,
                ),
                label: 'Updates',
              ),
              NavigationDestination(
                icon: Icon(
                  ctrl.bnbIndex == 2?Icons.groups:Icons.groups_outlined,
                  color: ctrl.bnbIndex == 2? AppColors.iconFill:null,
                ),
                label: 'Communities',
              ),
              NavigationDestination(
                icon: Icon(
                  ctrl.bnbIndex == 3?Icons.call:Icons.call_outlined,
                  color: ctrl.bnbIndex == 3? AppColors.iconFill:null,
                ),
                label: 'Calls',
              ),
            ],
          );
        }
    );
  }
}
