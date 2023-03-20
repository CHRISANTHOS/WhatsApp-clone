
class ChatModel{

  String user;
  String message;
  String time;
  String picture;

  ChatModel({required this.user, required this.message, required this.time, required this.picture});

  factory ChatModel.fromJson(Map<String, dynamic> json){
    return ChatModel(user: json['user'] ?? 'unknown', message: json['message'] ?? '', time: json['time'], picture: json['picture']);
  }

}