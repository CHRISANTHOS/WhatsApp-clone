import 'dart:convert';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:flutter/services.dart';

class DataServices{

  Future<String> loadJson()async{
    final jsonString = await rootBundle.loadString('assets/data.json');
    return jsonString;
  }

  Future<List<ChatModel>> readJson()async{
    final response = await loadJson();
    Iterable result = jsonDecode(response);
    return result.map((chat) => ChatModel.fromJson(chat)).toList();
  }

}