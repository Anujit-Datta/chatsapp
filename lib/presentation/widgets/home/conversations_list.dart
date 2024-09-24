import 'package:chatsapp/presentation/controllers/home_controller.dart';
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
      builder: (ctrl) {
        return ListView.builder(
          itemCount: ctrl.conversations[ctrl.tagIndex].length+1,
          itemBuilder: (context, index) {
            if(index==0){
              return const Tags();
            }{
              return InkWell(
                onTap: () {

                },
                child: ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundImage:
                    NetworkImage(ctrl.conversations[ctrl.tagIndex][index-1]['image']),
                  ),
                  title: Text(
                    ctrl.conversations[ctrl.tagIndex][index-1]['name'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    ctrl.conversations[ctrl.tagIndex][index-1]['lastMsg'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    ctrl.conversations[ctrl.tagIndex][index-1]['lastMsgAt'],
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
}
