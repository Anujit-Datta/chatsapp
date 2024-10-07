import 'package:chatsapp/data/models/sender.dart';

class Message {
  String? sId;
  String? senderUserId;
  String? chatId;
  String? content;
  String? messageType;
  String? messageId;
  String? createdAt;
  String? updatedAt;
  Sender? sender;

  Message(
      {this.sId,
        this.senderUserId,
        this.chatId,
        this.content,
        this.messageType,
        this.messageId,
        this.createdAt,
        this.updatedAt,
        this.sender});

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderUserId = json['sender'];
    chatId = json['chatId'];
    content = json['content'];
    messageType = json['messageType'];
    messageId = json['messageId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sender =
    json['Sender'] != null ? Sender.fromJson(json['Sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sender'] = senderUserId;
    data['chatId'] = chatId;
    data['content'] = content;
    data['messageType'] = messageType;
    data['messageId'] = messageId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (sender != null) {
      data['Sender'] = sender!.toJson();
    }
    return data;
  }
}


