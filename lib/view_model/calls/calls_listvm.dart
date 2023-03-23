import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view_model/calls/calls_vm.dart';
import 'package:whatsapp_clone/services/data_service.dart';
import 'package:whatsapp_clone/models/calls_model.dart';

class CallsListViewModel extends ChangeNotifier{

  List<CallsViewModel> calls = [];

  Future<void> getCalls()async{
    List<CallsModel> callsModel = await DataServices().readCallsJson();
    calls = callsModel.map((call) => CallsViewModel(callsModel: call)).toList();
    notifyListeners();
  }

}