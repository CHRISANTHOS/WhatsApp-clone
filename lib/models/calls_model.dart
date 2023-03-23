
class CallsModel{

  String caller;
  bool audio;
  bool received;

  CallsModel({required this.caller,required this.audio, required this.received});

  factory CallsModel.fromJson(Map<String, dynamic> json){
    return CallsModel(caller: json['caller'], audio: json['audio'], received: json['received']);
  }

}