import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:chatsapp/presentation/widgets/chats/tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/appbar.dart';
import '../widgets/home/bottom_nav_bar.dart';
import '../widgets/home/conversations_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: PageView(
        onPageChanged: (index) {
          Get.find<HomeController>().updateBnbIndex(index);
        },
        children: [
          const ConversationList(),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                ),
                title: Text('User Name'),
                subtitle: Text('Last message'),
                trailing: Text('12:00'),
              );
            },
          ),
          Text(' '),
          Text(' '),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}


