
class CommentModel {
  final String userName;
  final String userImage;
  final String commentText;
  bool  isCurrentUser;

  CommentModel({required this.userName, required this.userImage, required this.commentText,this.isCurrentUser=false});
}