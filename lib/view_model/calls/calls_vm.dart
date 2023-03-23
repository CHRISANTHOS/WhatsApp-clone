import 'package:whatsapp_clone/models/calls_model.dart';

class CallsViewModel{

  CallsModel callsModel;

  CallsViewModel({required this.callsModel});

  String get caller{
    return callsModel.caller;
  }

  bool get audio{
    return callsModel.audio;
  }

  bool get received{
    return callsModel.received;
  }

}