
import 'package:compareapp/Models/comments_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:flutter/material.dart';


class SendChatScreen extends StatefulWidget {
  const SendChatScreen({super.key});

  @override
  _SendChatScreenState createState() => _SendChatScreenState();
}

class _SendChatScreenState extends State<SendChatScreen> {
  final List<CommentModel> comments = [
    CommentModel(
      userName: "User1",
      userImage: "assets/images/profile.png",
      commentText: "Hey There",
      isCurrentUser: false,
    ),
    CommentModel(
      userName: "User2",
      userImage: "assets/images/profile.png",
      commentText: "Hi How are you? "
          "It was popularised in the 1960s with the release of Letraset sheets "
          "containing Lorem Ipsum passages, and more recently with desktop publishing.",
      isCurrentUser: true,
    ),
    CommentModel(
      userName: "User2",
      userImage: "assets/images/profile.png",
      commentText: "Hi How are you? "
          "It was popularised in the 1960s with the release of Letraset sheets "
          "containing Lorem Ipsum passages, and more recently with desktop publishing.",
      isCurrentUser: true,
    ),
    // Add more comments here
  ];

  final TextEditingController _commentController = TextEditingController();

  void _showOptionsBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.noColor,

      context: context,
      builder: (context) {
        return Container(


          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.greyTextColor),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.close, color: AppColors.black,size: 18,),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 22),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.noColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyBgColor,
                  ),
                ),
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.report_outlined, color: AppColors.black,size: 25,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: const AppText(
                    'Report',
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  onTap: () {
                    // Handle Report action
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 22),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.noColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyBgColor,
                  ),
                ),
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.cancel_outlined, color: AppColors.black,size: 25,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: const AppText(
                    'End Conversation',
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  onTap: () {
                    // Handle Report action
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 22),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primaryColor,
        centerTitle: false,
        title: const Row(

          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                "assets/images/men_pp.png",

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Cameron Willson',
                    size: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  AppText(
                    ' online',
                    size: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.greyTextColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.black,
              ),
              onPressed: _showOptionsBottomSheet,
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // Scrolls to the bottom first
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: comment.isCurrentUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!comment.isCurrentUser) ...[
                          const SizedBox(width: 10),
                        ],
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: comment.isCurrentUser
                                  ? AppColors.appGreenColor
                                  : AppColors.greyBgColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: comment.isCurrentUser
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                if (!comment.isCurrentUser) const SizedBox(height: 4),
                                Text(
                                  comment.commentText,
                                  style: TextStyle(
                                    color: comment.isCurrentUser
                                        ? Colors.white
                                        : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (comment.isCurrentUser) ...[
                          const SizedBox(width: 10),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Type Something',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonBlueColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.buttonBlueColor),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: AppColors.primaryColor),
                      onPressed: () {
                        setState(() {
                          if (_commentController.text.isNotEmpty) {
                            comments.insert(
                              0,
                              CommentModel(
                                userName: "You",
                                userImage:
                                    "assets/images/profile.png", // Use the current user's image
                                commentText: _commentController.text,
                                isCurrentUser: true,
                              ),
                            );
                            _commentController.clear();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
