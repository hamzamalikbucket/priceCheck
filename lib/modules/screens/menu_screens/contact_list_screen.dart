
import 'package:compareapp/Models/live_user_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';

import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactState();
  }
}

class ContactState extends State<ContactListScreen> with SingleTickerProviderStateMixin {

  List<LiveUserModel> userList = [
    LiveUserModel(userImg: "assets/images/bluemne_pp.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Alice Johnson", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/female_pp.png", userName: "Auron Gestro", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Charlie Brown", userEmail: "charlie@example.com", userPhone: '0900786-3'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "David Smith", userEmail: "david@example.com", userPhone: '0900786-4'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolbarBack(
        appBar: AppBar(), title: 'Block List',
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
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.containerBg.withOpacity(0.4),
                            border: Border.all(
                              width: 1,
                              color: AppColors.noColor,
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
                                            radius: 35,
                                            backgroundImage: AssetImage(user.userImg),
                                          ),
                                        ),
                                      ),

                                      const SizeBoxWidth8(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              AppText(
                                                "${user.userName}  ",
                                                size: 14,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black,
                                              ),
                                              const ImageIcon(
                                                AssetImage(Constants.blockIcon),
                                                color: AppColors.redColor,

                                                size:15,

                                              ),
                                            ],
                                          ),
                                          const AppText(
                                            'Blocked 1 month ago',
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
                                  child: AppGradiantButton(
                                    onTap: () {

                                      // if (loginFormKey.currentState!.validate()) {
                                      //   String s = emailController.text;
                                      // }
                                    },

                                    width:80,
                                    height: 40,
                                    btnText: "UnBlock",
                                    btnTextSize: 15,

                                    btnTextColor: AppColors.primaryColor,



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
