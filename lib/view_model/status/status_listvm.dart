import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view_model/status/status_vm.dart';
import 'package:whatsapp_clone/services/data_service.dart';
import 'package:whatsapp_clone/models/status_model.dart';

class StatusListViewModel extends ChangeNotifier{

  List<StatusViewModel> viewedStatuses = [];
  List<StatusViewModel> unViewedStatuses = [];

  Future<void> getStatusUpload()async{
    List<StatusModel> statusModels = await DataServices().readStatusJson();
    for(StatusModel status in statusModels){
      if(status.isViewed == false){
        unViewedStatuses.add(StatusViewModel(statusModel: status));
      }else{
        viewedStatuses.add(StatusViewModel(statusModel: status));
      }
    }
    notifyListeners();
  }

  void justViewed(int index){
    unViewedStatuses[index].isViewed == true;
    StatusViewModel viewed = unViewedStatuses.removeAt(index);
    viewedStatuses.add(viewed);
    notifyListeners();
  }

}