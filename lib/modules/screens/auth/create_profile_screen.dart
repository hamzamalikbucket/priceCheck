import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateProfileState();
  }
}

class CreateProfileState extends State<CreateProfileScreen> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController rpcController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool boxVal = true;
  bool isBarbadosSelected = false; // State to track if "Barbados" is selected
  String? selectedParish; // Selected parish from the dropdown

  final List<String> barbadosParishes = [
    "Christ Church",
    "Saint Andrew",
    "Saint George",
    "Saint James",
    "Saint Johns",
    "Saint Joseph",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(
        appBar: AppBar(), title: 'Create Profile',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizeBoxHeight4(),

                  const AppText(
                    'Full Name',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
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
                        controller: firstNameController,
                        hint: 'Enter your name',
                        prefixIcon: Constants.person,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Name required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),

                  const SizeBoxHeight16(),
                  const AppText(
                    'Phone number',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
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
                        controller: phoneNumberController,
                        hint: 'Enter your number',
                        prefixIcon: Constants.phone,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Number required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight16(),
                  const AppText(
                    'Set a username',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
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
                        controller: phoneNumberController,
                        hint: 'Enter your username',
                        prefixIcon: Constants.userNameIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Username required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'Your location',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
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
                        controller: phoneNumberController,
                        hint: 'Enter your location',
                        prefixIcon: Constants.locationFieldIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Location required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'Bio',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color:AppColors.blueLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                        ),
                      ),
                      AppIconField(
                        controller: bioController,
                        hint: 'Write a bio',
                        prefixIcon: Constants.bioIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,

                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Bio required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'Gender',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
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
                        controller: genderController,
                        hint: 'Enter your gender',
                        prefixIcon: Constants.genderIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Gender required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'DOB',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
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
                        controller: dobController,
                        hint: 'Enter your date of birth',
                        prefixIcon: Constants.calendarIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "DOB required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'Upload a picture',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                            color:AppColors.blueLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15,right: 15,bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Constants.openCamICon,
                                ),
                                SvgPicture.asset(
                                  Constants.chooseGalleryIcon,
                                ),
                              ],
                            ),


                          ),
                          SvgPicture.asset(
                            Constants.uploadButton,
                          ),
                        ],
                      ),


                    ],
                  ),
                  const SizeBoxHeight8(),



                  const SizeBoxHeight16(),
                  AppBorderButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/BottomNavigationBarScreen');
                      // if (loginFormKey.currentState!.validate()) {
                      //   String s = emailController.text;
                      // }
                    },
                    width:MediaQuery.of(context).size.width,
                    height: 60,
                    btnText: "Save",




                  ),
                  const SizeBoxHeight8(),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
