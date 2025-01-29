import 'package:compareapp/Models/live_user_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FriendsState();
  }
}

class FriendsState extends State<FindFriendsScreen> with SingleTickerProviderStateMixin {

  List<LiveUserModel> userList = [
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Alice Johnson", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Auron Gestro", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Charlie Brown", userEmail: "charlie@example.com", userPhone: '0900786-3'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "David Smith", userEmail: "david@example.com", userPhone: '0900786-4'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.noColor, // Make the AppBar background transparent
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.black,

          //change your color here
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

                const SizeBoxHeight16(),
                const AppText(
                  'Find Friends',
                  size: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                Container(
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
                    padding:const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/frameDp.png"),
                            ),
                          ),
                        ),

                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "From Contact List",
                              size: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),

                          ],
                        ),
                        const SizeBoxWidth8(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: AppBorderButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/ContactList');
                              // if (loginFormKey.currentState!.validate()) {
                              //   String s = emailController.text;
                              // }
                            },
                            btnColor: AppColors.buttonBlueColor,
                            borderColor: AppColors.buttonBlueColor,
                            width:60,
                            height: 40,
                            btnText: "Find",
                            btnTextSize: 15,

                            btnTextColor: AppColors.primaryColor,



                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizeBoxHeight8(),
                Container(
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
                    padding:const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/frameDp.png"),
                            ),
                          ),
                        ),

                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "Invite Friends",
                              size: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),

                          ],
                        ),
                        const SizeBoxWidth8(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: AppBorderButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/InviteList');
                              // if (loginFormKey.currentState!.validate()) {
                              //   String s = emailController.text;
                              // }
                            },
                            btnColor: AppColors.buttonBlueColor,
                            borderColor: AppColors.buttonBlueColor,
                            width:60,
                            height: 40,
                            btnText: "Invite",
                            btnTextSize: 15,

                            btnTextColor: AppColors.primaryColor,



                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizeBoxHeight16(),
                const AppText(
                  'Suggested Friends',
                  size: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                const SizeBoxHeight16(),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: userList.map((user) {
                    return GestureDetector(
                      onTap: () {
                        // Handle tap

                     
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
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

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

}
