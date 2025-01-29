
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/ToolbarImage.dart';

import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VerifyState();
  }
}

class VerifyState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: ToolbarImage(
          appBar: AppBar(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const SizeBoxHeight16(),
                SizedBox(
                  child: Column(

                    children: [
                      const AppHeadings(
                        'Verification Your Email',
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      const AppText(
                  'Enter OTP sent to your mail',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColor,
                      ),
                      const SizeBoxHeight16(),
                      Container(

                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Pinput(
                              length: 4,
                              defaultPinTheme: PinTheme(
                                width: 64,
                                height: 64,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  color: AppColors.blueLightColor,
                                  border:
                                  Border.all(color: AppColors.bluecolor,width: 0.5),

                                    borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 64,
                                height: 64,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  color: AppColors.blueLightColor,
                                  border:
                                  Border.all(color: AppColors.bluecolor,width: 0.5),

                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              submittedPinTheme: PinTheme(
                                width: 64,
                                height: 64,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  color: AppColors.blueLightColor,
                                  border:
                                  Border.all(color: AppColors.bluecolor,width: 0.5),

                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (s) {
                                if (s!.length < 5) {
                                  return 'Invalid OTP';
                                }
                                return null;
                              },
                              errorTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.redColor),
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) => print(pin),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText(
                            'Didn\'t receive code?',
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyTextColor,
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: const AppText(
                              'Resend',
                              underline: false,
                              size: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.bluecolor,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                const SizeBoxHeight16(),


                AppBorderButton(
                  onTap: () {

                    Navigator.pushNamed(context, '/activateBioScreen');
                  },
                  width:MediaQuery.of(context).size.width,
                  height: 60,
                  btnText: "Verify OTP",



                ),
              ],
            ),
          ),
        ));
  }
}
