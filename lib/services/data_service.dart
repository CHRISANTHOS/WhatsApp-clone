import 'dart:convert';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import 'package:whatsapp_clone/models/calls_model.dart';
import 'package:flutter/services.dart';

class DataServices{

  Future<String> loadChatJson()async{
    final jsonString = await rootBundle.loadString('assets/data.json');
    return jsonString;
  }

  Future<List<ChatModel>> readChatJson()async{
    final response = await loadChatJson();
    Iterable result = jsonDecode(response);
    return result.map((chat) => ChatModel.fromJson(chat)).toList();
  }

  Future<String> loadStatusJson()async{
    final jsonString = await rootBundle.loadString('assets/status_data.json');
    return jsonString;
  }

  Future<List<StatusModel>> readStatusJson()async{
    final response = await loadStatusJson();
    Iterable result = jsonDecode(response);
    return result.map((chat) => StatusModel.fromJson(chat)).toList();
  }

  Future<String> loadCallsJson()async{
    final jsonString = await rootBundle.loadString('assets/calls_data.json');
    return jsonString;
  }

  Future<List<CallsModel>> readCallsJson()async{
    final response = await loadCallsJson();
    Iterable result = jsonDecode(response);
    return result.map((call) => CallsModel.fromJson(call)).toList();
  }

}