import 'message.dart';

class MessagesWrapper {
  int? totalCount;
  int? count;
  List<Message> messages=[];

  MessagesWrapper({this.totalCount, this.count, required this.messages});

  MessagesWrapper.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    count = json['count'];
    if (json['rows'] != null) {
      messages = <Message>[];
      json['rows'].forEach((v) {
        messages.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['count'] = count;
    data['rows'] = messages.map((v) => v.toJson()).toList();
    return data;
  }
}

