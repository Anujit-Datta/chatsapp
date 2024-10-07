import 'package:chatsapp/presentation/controllers/chats_list_controller.dart';
import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:chatsapp/presentation/screens/messaging_screen.dart';
import 'package:chatsapp/presentation/widgets/chats/tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ConversationList extends StatelessWidget {
  const ConversationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return GetBuilder<ChatsListController>(
          builder: (ctrl) {
            return ListView.builder(
              itemCount: ctrl.conversationList[homeCtrl.tagIndex].length+1,
              itemBuilder: (context, index) {
                if(index==0){
                  return const Tags();
                }
                else{
                  return InkWell(
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 200), () {
                        Get.to(() => const MessagingScreen());
                      });
                    },
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8),
                      leading: const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                        NetworkImage('https://picsum.photos/200'),
                      ),
                      title: Text(
                        ctrl.conversationList[homeCtrl.tagIndex][index-1].participantsInfo?[0].name??'Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        ctrl.conversationList[homeCtrl.tagIndex][index-1].lastMessages??'Last Message',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: Text(
                        ctrl.conversationList[homeCtrl.tagIndex][index-1].updatedAt?.month.toString()??'12.00pm',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  );
                }
              },
            );
          }
        );
      }
    );
  }
}
