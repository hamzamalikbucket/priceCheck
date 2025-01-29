class CelebModel {
  String postImage;
  String postDescription;

  String userImg;
  String userName;
  String userLocation;
  String postTime;
  int? hostId;

  CelebModel({
    required this.postImage,
    required this.postDescription,

    required this.userImg,
    required this.userName,
    required this.userLocation,
    required this.postTime,
    this.hostId
  });
}
