import 'package:whatsapp_clone/models/chat_model.dart';

class ChatViewModel{

  ChatModel chat;
  ChatViewModel({required this.chat});

  String get user{
    return chat.user;
  }

  String get message{
    return chat.message;
  }

  String get time{
    return chat.time;
  }

  String get picture{
    return chat.picture;
  }

}