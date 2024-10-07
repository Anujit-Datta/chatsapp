import 'package:chatsapp/presentation/controllers/chats_list_controller.dart';
import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:chatsapp/presentation/widgets/chats/tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/appbar.dart';
import '../widgets/home/bottom_nav_bar.dart';
import '../widgets/home/conversations_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<ChatsListController>().loadConversationList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: PageView(
          onPageChanged: (index) {
            Get.find<HomeController>().updateBnbIndex(index);
          },
          children: const [
            ConversationList(),
            Center(
              child: Text('Updates'),
            ),
            Center(
              child: Text('Communities'),
            ),
            Center(
              child: Text('Calls'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}


