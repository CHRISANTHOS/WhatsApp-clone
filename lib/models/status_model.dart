class StatusModel{

  String user;
  bool isViewed;
  StatusModel({required this.user, required this.isViewed });

  factory StatusModel.fromJson(Map<String, dynamic> json){
    return StatusModel(user: json['user'] ?? '', isViewed: json['isViewed'] ?? false);
  }

}