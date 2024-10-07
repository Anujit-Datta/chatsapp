import 'package:chatsapp/data/models/participant.dart';

class Conversation {
  String? id;
  List<String>? participants;
  bool? isGroup;
  String? chatId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic lastMessages;
  List<Participants>? participantsInfo;

  Conversation(
      {this.id,
        this.participants,
        this.isGroup,
        this.chatId,
        this.createdAt,
        this.updatedAt,
        this.lastMessages,
        this.participantsInfo});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    participants = json['participants'].cast<String>();
    isGroup = json['isGroup'];
    chatId = json['chatId'];
    createdAt = DateTime.tryParse(json['createdAt']);
    updatedAt = DateTime.tryParse(json['updatedAt']);
    lastMessages = json['LastMessages'];
    if (json['Participants'] != null) {
      participantsInfo = <Participants>[];
      json['Participants'].forEach((participant) {
        participantsInfo!.add(Participants.fromJson(participant));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['_id'] = id;
  //   data['participants'] = participants;
  //   data['isGroup'] = isGroup;
  //   data['chatId'] = chatId;
  //   data['createdAt'] = createdAt;
  //   data['updatedAt'] = updatedAt;
  //   data['LastMessages'] = lastMessages;
  //   if (participantsInfo != null) {
  //     data['Participants'] = participantsInfo!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

