class SnipsModel{

  String userName;
  String userEmail;
  String userPhone;
  String userImg;
  String? userDob;

  SnipsModel({
    required this.userImg,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    this.userDob,

  });
}