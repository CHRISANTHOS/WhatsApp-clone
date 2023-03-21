import 'package:whatsapp_clone/models/status_model.dart';

class StatusViewModel{

  StatusModel statusModel;

  StatusViewModel({required this.statusModel});

  String get user{
    return statusModel.user;
  }

  bool get isViewed{
    return statusModel.isViewed;
  }

}