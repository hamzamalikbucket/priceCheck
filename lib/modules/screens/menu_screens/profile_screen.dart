import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool switchBtn = false;
  bool public = true;
  bool post = true;
  bool request = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolbarBack(
        appBar: AppBar(), title: 'My Profile',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
        
                child: Stack(
                  children:[
                    Image.asset(
                      "assets/images/main_profile.png",
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: SvgPicture.asset(
                        Constants.changePicIcon,
                      ),
                    ),
                  ]
        
        
        
                ),
              ),
        
              const SizeBoxHeight16(),
        
              const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Personal Information",
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    AppText(
                      "Edit",
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appGreenColor,
                    ),
                  ],
                ),
              ),
        
            Padding(
                padding: const EdgeInsets.only(left:15,right: 15),
                child: Card(
                  color: AppColors.primaryColor,
        
                  elevation: 0.2,
        
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
        
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                                  Row(
                                    children: [
                                      ImageIcon(
                            AssetImage(Constants.person),
                            color: AppColors.appGreenColor,
                                       size: 20,
        
                                      ),
                                AppText(
                                  "  Personal Information",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                                    ],
                                  ),
                            AppText(
                              "Jessica Renn",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Constants.blueMsg,
                                      ),
                                const AppText(
                                  "  Email",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                                    ],
                                  ),
                            const AppText(
                              "johndoe@email.com",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.userNameIcon),
                                  color: AppColors.appGreenColor,
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Username",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            AppText(
                              "@johnrees",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.locationFieldIcon),
                                  color: AppColors.appGreenColor,
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Location",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            AppText(
                              "Portland",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.genderIcon),
                                  color: AppColors.appGreenColor,
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Gender",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            AppText(
                              "Female",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.calendarIcon),
                                  color: AppColors.appGreenColor,
                                  size: 20,
        
                                ),
                                AppText(
                                  "  DOB",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            AppText(
                              "12/01/1990",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.bioIcon),
                                  color: AppColors.appGreenColor,
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Bio",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            AppText(
                              "🎨📚🎶🌿😊 I love music, nature and food.",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                      ],
                    ),
                  ),
                ),
              ),
        
          const SizeBoxHeight16(),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Privacy Settings",
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    AppText(
                      "Edit",
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appGreenColor,
                    ),
                  ],
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.only(left:15,right: 15),
                child: Card(
                  color: AppColors.primaryColor,
        
                  elevation: 0.2,
        
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
        
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.lock),
                                  color: AppColors.black,
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Password",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                            AppText(
                              "123********",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.saveIcon),
        
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Saved Items",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                             Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.termIcon,
                                ),
                                const AppText(
                                  "  Terms & Conditions",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const SizeBoxHeight16(),
                        GestureDetector(
                          onTap: (){

                            Navigator.pushNamed(
                                context, '/ContactList');
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(Constants.blockIcon),

                                    size: 20,

                                  ),
                                  AppText(
                                    "  Block list",
                                    size: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTextColor,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
        
                        const Row(
                          children: [
                            ImageIcon(
                              AssetImage(Constants.lock),
                              color: AppColors.black,
                              size: 20,
        
                            ),
                            AppText(
                              "  Set Account Privacy",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(Constants.peopleIcon),
                                  color: AppColors.greyTextColor,
                                  size: 20,
        
                                ),
                                const AppText(
                                  "  Private",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
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
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(Constants.publicBlueIcon),
                                  color: AppColors.appGreenColor,
                                  size: 20,
        
                                ),
                                const AppText(
                                  "Public",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                Switch(
                                  value: public,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      public=newValue;
                                    });
                                  },
                                  activeColor: AppColors.buttonBlueColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            const Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.circleTick),
        
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Allow others to see my posts",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            Switch(
                              value: post,
                              onChanged: (bool newValue) {
                                setState(() {
                                  post=newValue;
                                });
                              },
                              activeColor: AppColors.buttonBlueColor,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
        
                            const Row(
                              children: [
                                ImageIcon(
                                  AssetImage(Constants.circleTick),
        
                                  size: 20,
        
                                ),
                                AppText(
                                  "  Approve Requests from public",
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),
                            Switch(
                              value: request,
                              onChanged: (bool newValue) {
                                setState(() {
                                  request=newValue;
                                });
                              },
                              activeColor: AppColors.buttonBlueColor,
                            ),
                          ],
                        ),
                        const SizeBoxHeight16(),
                        const Divider(
                          thickness: 0.1,
                          color: AppColors.appGreenColor,
        
                        ),
                        const Row(
                          children: [
                            ImageIcon(
                              AssetImage(Constants.logOutIcon),
                              color: AppColors.black,
                              size: 20,
        
                            ),
                            AppText(
                              "  Logout",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),

    );
  }
}
