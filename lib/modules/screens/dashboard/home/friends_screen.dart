
import 'package:compareapp/Models/live_user_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FriendsState();
  }
}

class FriendsState extends State<FriendsScreen> {
  TextEditingController searchController = TextEditingController();
  List<LiveUserModel> userList = [
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Alice Johnson", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Auron Gestro", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Charlie Brown", userEmail: "charlie@example.com", userPhone: '0900786-3'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "David Smith", userEmail: "david@example.com", userPhone: '0900786-4'),
  ];
bool active=false;
bool all=true;
bool veteran=false;
  List<LiveUserModel> searchableList = [];

  @override
  void initState() {
    super.initState();
    // Initialize searchableList with the full userList
    searchableList = userList;
    searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterUsers);
    searchController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    final query = searchController.text.toLowerCase();
    setState(() {
      searchableList = userList.where((user) {
        return user.userName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sort the searchableList alphabetically by name
    searchableList.sort((a, b) => a.userName.compareTo(b.userName));

    // Group users by the first letter of their names
    Map<String, List<LiveUserModel>> groupedUsers = {};
    for (var user in searchableList) {
      String firstLetter = user.userName[0].toUpperCase();
      if (!groupedUsers.containsKey(firstLetter)) {
        groupedUsers[firstLetter] = [];
      }
      groupedUsers[firstLetter]!.add(user);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: AppColors.greyBgColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Search Friends',
                          hintStyle: TextStyle(
                            color: AppColors.greyHintColor,
                            fontSize: 14,
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: InkWell(
                              child: ImageIcon(
                                AssetImage(Constants.search),
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizeBoxWidth8(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBorderButton(
                    onTap: () {
                      setState(() {
                        all=true;
                        veteran=false;
                        active=false;

                      });
                      // Navigator.pushNamed(context, '/Login');
                    },
                    btnColor: all?AppColors.buttonBlueColor:AppColors.noColor,
                    borderColor: AppColors.greyColor,
                    width: 80,
                    height: 35,
                    btnText: "ALL",
                    btnTextColor:all? AppColors.primaryColor:AppColors.black,
                    btnTextSize: 15,
                  ),
                  const SizeBoxWidth8(),
                  AppBorderButton(
                    onTap: () {
                      setState(() {
                        all=false;
                        veteran=false;
                        active=true;
                      });
                      // Navigator.pushNamed(context, '/');
                    },
                    btnColor: active?AppColors.buttonBlueColor:AppColors.noColor,
                    borderColor: AppColors.greyColor,
                    width: 80,
                    height: 35,
                    btnText: "ACTIVE",
                    btnTextColor:active? AppColors.primaryColor:AppColors.black,
                    btnTextSize: 15,
                  ),
                  const SizeBoxWidth8(),
                  AppBorderButton(
                    onTap: () {
                      setState(() {
                        veteran=true;
                        active=false;
                        all=false;

                      });
                      // Navigator.pushNamed(context, '/');
                    },
                    btnColor: veteran?AppColors.buttonBlueColor:AppColors.noColor,
                    borderColor: AppColors.greyColor,
                    width: 85,
                    height: 35,
                    btnText: "VETERAN",
                    btnTextColor: veteran?AppColors.primaryColor:AppColors.black,
                    btnTextSize: 15,
                  ),
                ],
              ),
            ),
          ),
          const SizeBoxHeight8(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: groupedUsers.entries.map((entry) {
                String letter = entry.key;
                List<LiveUserModel> users = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: AppText(
                        letter,
                        size: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    ...users.map((user) {
                      return GestureDetector(
                        onTap: () {
                          // Handle tap
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.noColor,
                              border: Border.all(
                                width: 1,
                                color: AppColors.greyBgColor,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
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
                        ),
                      );
                    }),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
