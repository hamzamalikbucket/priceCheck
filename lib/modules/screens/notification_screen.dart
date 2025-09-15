
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';

import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotiState();
  }
}

class NotiState extends State<NotificationScreen> {
  final GlobalKey<FormState> uploadFormKey = GlobalKey<FormState>();


  TextEditingController radiusController = TextEditingController();
  bool switchBtn = true;
  bool messagesBtn = true;
  bool likesBtn = true;
  bool commentsBtn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(
        appBar: AppBar(), title: 'Push Notifications',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizeBoxHeight4(),


                const SizeBoxHeight8(),

                const SizeBoxHeight8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Constants.blueMsg,
                        ),
                        const AppText(
                          ' New Messages  ',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),

                      ],
                    ),
                    Switch(
                      value: messagesBtn,
                      onChanged: (bool newValue) {
                        setState(() {
                          messagesBtn=newValue;
                        });
                      },
                      activeColor: AppColors.buttonBlueColor,
                    ),
                  ],
                ),
                const Divider(),
                const SizeBoxHeight8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Constants.likeBlue,
                        ),
                        const AppText(
                          '  Likes',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),

                      ],
                    ),
                    Switch(
                      value: likesBtn,
                      onChanged: (bool newValue) {
                        setState(() {
                          likesBtn=newValue;
                        });
                      },
                      activeColor: AppColors.buttonBlueColor,
                    ),
                  ],
                ),
                const Divider(),
                const SizeBoxHeight8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Constants.commentBlue,
                        ),
                        const AppText(
                          '  Comments',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),

                      ],
                    ),
                    Switch(
                      value: commentsBtn,
                      onChanged: (bool newValue) {
                        setState(() {
                          commentsBtn=newValue;
                        });
                      },
                      activeColor: AppColors.buttonBlueColor,
                    ),
                  ],
                ),
                const Divider(),
                const SizeBoxHeight8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Constants.starBlue,
                        ),
                        const AppText(
                          '  Trending Content',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),

                      ],
                    ),
                    Switch(
                      value: switchBtn,
                      onChanged: (bool newValue) {
                        setState(() {
                          switchBtn=newValue;
                        });
                      },
                      activeColor: AppColors.buttonBlueColor,
                    ),
                  ],
                ),
                const Divider(),
                const SizeBoxHeight32(),

                const AppText(
                  'Configure Trending Notifications',
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight16(),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color:AppColors.blueLightColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                      ),
                    ),

                    AppIconField(
                      controller: radiusController,
                      hint: 'Enter radius in miles',
                      prefixIcon: Constants.radiusFieldIcon,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizeBoxHeight32(),
                AppBorderButton(
                  onTap: () {


                  },
                  width:MediaQuery.of(context).size.width,
                  height: 60,
                  btnText: "Save Changes",




                ),
                const SizeBoxHeight16(),
                SvgPicture.asset(
                  Constants.notificationTag,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }


}
