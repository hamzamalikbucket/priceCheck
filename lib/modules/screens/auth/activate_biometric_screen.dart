import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class ActivateBiometricScreen extends StatefulWidget {
  const ActivateBiometricScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingTwoState();
  }
}

class OnBoardingTwoState extends State<ActivateBiometricScreen> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
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
              Center(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/bioMatric.png',),
                      const SizeBoxHeight16(),
                     const AppHeadings(
                        'Successfully',
                        size: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      const SizeBoxHeight8(),
                     const AppText(
                       'Verified Your Email',
                       size: 24,
                       fontWeight: FontWeight.w500,
                       color: AppColors.black,

                       alignText:true,
                       justifyText:false,

                      ),


                    ],
                  ),
                ),
              ),

              SizedBox(
                child: Column(
                  children: [
                    AppBorderButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/CreateProfileScreen');
                        // if (loginFormKey.currentState!.validate()) {
                        //   String s = emailController.text;
                        // }
                      },
                      width:MediaQuery.of(context).size.width,
                      height: 60,
                      btnText: "Continue",


                    ),
                    const SizeBoxHeight16(),
                    const SizeBoxHeight16(),

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
