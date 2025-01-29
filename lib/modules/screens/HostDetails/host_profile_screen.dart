
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class HostProfile extends StatefulWidget{
  const HostProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }


}
class ProfileState extends State<HostProfile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizeBoxHeight32(),
              const Center(
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: AssetImage(
                   "assets/images/profile.png",
                  ),
                ),
              ),
              const SizeBoxHeight64(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Constants.shareIcon,
                  ),
                ],
              ),

              const AppText(
                "Name",
                size: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.greyHintColor,
              ),
              const AppText(
                "Fisayo Olamigoke",
                size: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              const SizeBoxHeight16(),
              const AppText(
                "Email",
                size: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.greyHintColor,
              ),
              const AppText(
                "info@careermega.com",
                size: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              const SizeBoxHeight16(),
              const AppText(
                "Contact Number",
                size: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.greyHintColor,
              ),
              const AppText(
                "+17139093171",
                size: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              const SizeBoxHeight16(),
              const AppText(
                "About Me",
                size: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.greyHintColor,
              ),
              const AppText(
                "Good Cook and Escort",
                size: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),




            ],
          ),
        ),
      ),


    );
  }

}