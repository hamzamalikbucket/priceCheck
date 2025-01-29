import 'package:compareapp/Models/live_user_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class InviteListScreen extends StatefulWidget {
  const InviteListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return InviteState();
  }
}

class InviteState extends State<InviteListScreen> with SingleTickerProviderStateMixin {
  List<LiveUserModel> userList = [
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Alice Johnson", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Auron Gestro", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Charlie Brown", userEmail: "charlie@example.com", userPhone: '0900786-3'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "David Smith", userEmail: "david@example.com", userPhone: '0900786-4'),
  ];

  Map<String, List<LiveUserModel>> groupedUserList = {};

  @override
  void initState() {
    super.initState();
    // Sort the user list alphabetically by userName
    userList.sort((a, b) => a.userName.compareTo(b.userName));
    // Group the users by the first letter of their name
    groupUsersByInitial();
  }

  void groupUsersByInitial() {
    for (var user in userList) {
      String initial = user.userName[0].toUpperCase();
      if (groupedUserList[initial] == null) {
        groupedUserList[initial] = [];
      }
      groupedUserList[initial]!.add(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.noColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizeBoxHeight4(),
                const AppText(
                  'Invite Friends',
                  size: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                const SizeBoxHeight16(),

                // Horizontal Scrollable List for Share Options
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ShareOption(iconPath: 'assets/images/wsp.png', label: 'WhatsApp'),
                      ShareOption(iconPath: 'assets/images/sms.png', label: 'SMS'),
                      ShareOption(iconPath: 'assets/images/redmsg.png', label: 'Messenger'),
                      ShareOption(iconPath: 'assets/images/wsS.png', label: 'Email'),
                      // Add more options as needed
                    ],
                  ),
                ),
                const SizeBoxHeight16(),

                // Display users grouped by initial letter
                ...groupedUserList.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        entry.key,
                        size: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greyTextColor,
                      ),
                      const SizeBoxHeight8(),
                      ...entry.value.map((user) {
                        return GestureDetector(
                          onTap: () {
                            // Handle tap
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.noColor,
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.greyBgColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundImage: AssetImage(user.userImg),
                                              ),
                                            ),
                                          ),
                                          const SizeBoxWidth8(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                user.userName,
                                                size: 14,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black,
                                              ),
                                              const AppText(
                                                'Active',
                                                size: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.greyTextColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: AppBorderButton(
                                        onTap: () {

                                        },
                                        btnColor: AppColors.noColor,
                                        borderColor: AppColors.black,
                                        width: 80,
                                        height: 40,
                                        btnText: "Invite",
                                        btnTextSize: 15,
                                        btnTextColor: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizeBoxHeight16(),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for Share Option
class ShareOption extends StatelessWidget {
  final String iconPath;
  final String label;

  const ShareOption({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.noColor,
            child: Image.asset(iconPath, width: 80, height: 80),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
