class PostModel {
  String  postImage;
  String postDescription;
  String? likeCounts;
  String? userImg;
  String? userName;
  String? userLocation;
  String? postTime;
  String? fbLink;
  String? googleLink;
  String? twitterLink;
  String? webLink;
  int? hostId;
  bool isPopular;
  String type;

  PostModel({
    required this.postImage,
    required this.postDescription,
    this.likeCounts,
     this.userImg,
   this.userName,
     this.userLocation,
   this.postTime,
    this.hostId,
    this.webLink,
    this.fbLink,
    this.googleLink,
    this.twitterLink,
    this.isPopular=false,
    required this.type,

  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel


      (

        postImage: json["image_url"],
        postDescription:json["description"],
        fbLink:json["fb_link"]??'',
        webLink:json["web_link"]??'',
        googleLink:json["google_link"]??'',
        twitterLink:json["twitter_link"]??'',
        type:json["type"],




    );
  }
}
