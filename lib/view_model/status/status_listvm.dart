import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view_model/status/status_vm.dart';
import 'package:whatsapp_clone/services/data_service.dart';
import 'package:whatsapp_clone/models/status_model.dart';

class StatusListViewModel extends ChangeNotifier{

  List<StatusViewModel> viewedStatuses = [];
  List<StatusViewModel> unViewedStatuses = [];

  void getStatusUpload()async{
    List<StatusModel> statusModels = await DataServices().readStatusJson();
    statusModels.map((status) {
      if(status.isViewed == false){
        unViewedStatuses.add(StatusViewModel(statusModel: status));
      }else{
        viewedStatuses.add(StatusViewModel(statusModel: status));
      }
    });
  }

}