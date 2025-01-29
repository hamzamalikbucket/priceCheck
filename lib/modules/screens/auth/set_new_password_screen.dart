import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SetNewPasswordScreenState();
  }
}

class SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final GlobalKey<FormState> setPassFormKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarImage(
        appBar: AppBar(),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: setPassFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  child: Column(

                    children: [
                      const AppText(
                        'Hey there,',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      const SizeBoxHeight4(),
                      const AppHeadings(
                        'Change password',
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      const SizeBoxHeight16(),
                      const AppText(
                        'Set a new password so you can ',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColor,
                      ),
                      const AppText(
                        'login with it',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColor,
                      ),


                      const SizeBoxHeight16(),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),
                          AppPasswordField(
                            controller: newPasswordController,
                            hint: 'New Password',
                            prefixIcon: Constants.lock,
                            suffixIcon: Constants.eye,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Password is required";
                              } else if (val.trim().length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      const SizeBoxHeight16(),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),
                          AppPasswordField(
                            controller: passwordController,
                            hint: 'Confirm New Password',
                            prefixIcon: Constants.lock,
                            suffixIcon: Constants.eye,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Password is required";
                              } else if (val.trim().length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),



                AppSimpleButton(
                  onTap: () {

                    Navigator.pushNamed(context, '/Login');
                    // if (loginFormKey.currentState!.validate()) {
                    //   String s = emailController.text;
                    // }
                  },
                  width:MediaQuery.of(context).size.width,
                  height: 60,
                  btnColor: AppColors.appBlueColor,
                  btnTextColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  btnText: "Done",


                ),
                const SizeBoxHeight16(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
