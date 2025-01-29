class LikesModel{
  String userImg;
  String userName;
  LikesModel({
    required this.userName,
   required this.userImg,
});
  factory LikesModel.fromJson(Map<String, dynamic> json){
    return LikesModel(userName: json[''].toString(), userImg: json[''].toString());
  }
}