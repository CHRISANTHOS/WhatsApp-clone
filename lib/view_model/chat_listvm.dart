import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/view_model/chat_vm.dart';
import 'package:whatsapp_clone/services/data_service.dart';

class ChatListViewModel extends ChangeNotifier{

  List<ChatViewModel> chats = [];

  Future<void> getChats()async{
    List<ChatModel> chatModels = await DataServices().readJson();
    chats = chatModels.map((chat) => ChatViewModel(chat: chat)).toList();
    notifyListeners();
  }

}