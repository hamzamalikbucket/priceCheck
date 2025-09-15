import 'package:flutter/material.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';


class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WelcomeState();
  }
}

class WelcomeState extends State<WelcomePageScreen> {
  bool active=false;
  bool vet=false;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const SizeBoxHeight16(),
                const SizeBoxHeight16(),
                const SizeBoxHeight16(),
                const SizeBoxHeight16(),

                const Center(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizeBoxHeight16(),
                        SizeBoxHeight16(),
                        SizeBoxHeight16(),
                        AppHeadings(
                          'Lets get started!',
                          size: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        SizeBoxHeight8(),
                        AppText(
                          'Start by choosing what is your military status',
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyTextColor,

                          alignText:true,
                          justifyText:false,

                        ),


                      ],
                    ),
                  ),
                ),

                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    boxShadow:  [
                      BoxShadow(
                        color: AppColors.buttonBlueColor.withOpacity(0.35),
                        spreadRadius: 0.2,
                        blurRadius: 5,
                        // blur radius
                        offset: const Offset(5, 5),
                      ),
                    ],
                    color: AppColors.primaryColor,
                    border: Border.all(
                      width: 0.5,
                      color: AppColors.appGreenColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppCircularButton(

                          onTap: () {
                            setState(() {
                              active=true;
                              vet=false;
                            });
                            //  Navigator.pushNamed(context, 'WelcomePageScreen');
                            // if (loginFormKey.currentState!.validate()) {
                            //   String s = emailController.text;
                            // }
                          },

                          btnColor: active?AppColors.buttonBlueColor:AppColors.lightgreybgColor,
                          assetUrl:'assets/images/active_icon.png',
                          assetColor:active?AppColors.primaryColor:AppColors.black,

                          width:100,
                          height: 100,
                          btnText: "Active",
                          btnTextColor:active?AppColors.primaryColor:AppColors.black,




                        ),
                        const VerticalDivider(
                            width: 6,
                          indent: 20,
                          endIndent: 20,

                        ),
                        AppCircularButton(

                          onTap: () {
                            setState(() {
                              active=false;
                              vet=true;
                            });
                            //  Navigator.pushNamed(context, 'WelcomePageScreen');
                            // if (loginFormKey.currentState!.validate()) {
                            //   String s = emailController.text;
                            // }
                          },

                          btnColor: vet?AppColors.buttonBlueColor:AppColors.lightgreybgColor,
                          assetUrl:"assets/images/veteran_icon.png",
                          assetColor:vet?AppColors.primaryColor:AppColors.black,

                          width:100,
                          height: 100,
                          btnText: "Veteran",
                          btnTextColor:vet?AppColors.primaryColor:AppColors.black,




                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                      'Learn about?',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyTextColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/InterestedServingScreen');

                      },
                      child: const AppText(
                        underline: true,
                        'Interested in serving',
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  child: Column(
                    children: [
                      AppBorderButton(
                        onTap: () {
                          Navigator.pushNamed(context, '/FillData1');
                          // if (loginFormKey.currentState!.validate()) {
                          //   String s = emailController.text;
                          // }
                        },
                        width:MediaQuery.of(context).size.width,
                        height: 60,
                        btnText: "Next",


                      ),
                      const SizeBoxHeight16(),
                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
