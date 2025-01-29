import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotPassScreenState();
  }
}

class ForgotPassScreenState extends State<ForgotPassScreen> {
  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool boxValue = false;

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
            key: forgotFormKey,
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
                        'Forgot Password',
                        size: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                      const SizeBoxHeight8(),
                      const SizeBoxHeight16(),
                      const AppText(
                        'Please enter your email ',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColor,
                      ),
                      const AppText(
                        'so we will send a passcode reset',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColor,
                      ),
                      const SizeBoxHeight8(),
                      const SizeBoxHeight16(),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizeBoxHeight8(),
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
                                const SizeBoxHeight8(),
                                AppIconField(
                                  controller: emailController,
                                  hint: 'Enter your Registered Email',
                                  prefixIcon: Constants.emailIcon,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (val) {
                                    if (val == null || val.trim().isEmpty) {
                                      return "Email required";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizeBoxHeight16(),
                             Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const AppText(
                                  'Back to login',
                                  underline: true,
                                  size: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appBlueColor,
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                const SizeBoxHeight16(),
                AppSimpleButton(
                  onTap: () {
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, '/SetNewPassword');
                    // if (loginFormKey.currentState!.validate()) {
                    //   String s = emailController.text;
                    // }
                  },
                  width:MediaQuery.of(context).size.width,
                  height: 60,
                  btnText: "Reset Password",
                  btnColor: AppColors.appBlueColor,
                  btnTextColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,



                ),
                const SizeBoxHeight8(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
