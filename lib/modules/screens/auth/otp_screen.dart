import 'dart:convert';

import 'package:bottom_loader/bottom_loader.dart';
import 'package:compareapp/modules/screens/auth/login_screen.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:compareapp/modules/screens/dashboard/bottom_nav_bar.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:pinput/pinput.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VerifyState();
  }
}

class VerifyState extends State<OtpScreen> {
  late BottomLoader bl;
   var otp="-1";
  void initState() {
    super.initState();
    // TODO: implement initState
    bl = BottomLoader(context,
        isDismissible: true,
        showLogs: true,
        loader: const CircularProgressIndicator(
          color: AppColors.appBlueColor,
        ));
    bl.style(
        message: 'Please Wait...',
        backgroundColor: AppColors.primaryColor,
        messageTextStyle: const TextStyle(
            color: AppColors.appBlueColor,
            fontSize: 19.0,
            fontWeight: FontWeight.w600));
  }
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  child: Column(
                    children: [
                      Image.asset('assets/images/bioMatric.png',

                      ),
                      const Padding(
                        padding: EdgeInsets.only(top:18.0),
                        child: AppHeadings(
                          'Verify It\'s You',
                          size: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                        ),
                      ),
                      const AppText(
                        'Enter OTP sent to your Email/Phone Number',
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
                                  border: Border.all(
                                      color: AppColors.appGreenColor, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 64,
                                height: 64,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  color: AppColors.appBlueColor,
                                  border: Border.all(
                                      color: AppColors.appGreenColor, width: 0.5),
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
                                  border: Border.all(
                                      color: AppColors.appGreenColor, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (s) {
                                if (s!.length < 4) {
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
                              onCompleted: (pin) {
                                print(pin);
                                setState(() {
                                  otp=pin;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizeBoxHeight16(),
                AppBorderButton(
                  onTap: () {
                    if(otp!="-1"){

                      bl.display();

                      try{

                        Constants.verifiedViaPhone?verifyPhoneOtp():verifyOtp();
                      }catch (e){
                        bl.close();
                        confirmationPopup(context, "An error Occurred.Try again later!");
                      }
                    }


                  },
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  btnColor: AppColors.appBlueColor,
                  btnText: "Verify OTP",
                ),
              ],
            ),
          ),
        ));
  }
  Future<dynamic> verifyOtp() async {
    print("verify otp chal gaya");
    var url = Uri.parse('${Constants.baseUrl}verifyOtp');
    var response = await http
        .post(
      url,
      body: {
        "phone":Constants.tempPhone,
        "otp_code": otp,

      },

    )
        .timeout(const Duration(seconds: 10),onTimeout: (){

      return confirmationPopup(context, "Check your Internet Connection!");
    });
    if (response.statusCode == 201) {
      dynamic body = jsonDecode(response.body);
      print(body);
      dynamic status=body['message'];
     /* dynamic id=body['user_id'];
      dynamic user=body["user"];
      dynamic name=user["name"];
      dynamic email=user["email"];
      dynamic dob=user["dob"];
      dynamic lastName=user["last_name"];
      dynamic country=user["country"];
      dynamic state=user["state"];
      setState(() {
        Constants.userName=name;
        Constants.userEmail=email;
        Constants.userDob=dob;
        Constants.userLastName=lastName;
        Constants.userCountry=country;
        Constants.userId=id.toString();
        Constants.state=state;
      });
*/

      bl.close();
      Fluttertoast.showToast(
          msg: status,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor:AppColors.appBlueColor,
          textColor: Colors.white,
          fontSize: 16.0
      );


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false,
      );





    } else {
      bl.close();
      dynamic body = jsonDecode(response.body);
      dynamic error=body['message'];
      print(response.body);
      print(error);

      confirmationPopup(context, error);
    }
    ;
  }
  Future<dynamic> verifyPhoneOtp() async {
    var url = Uri.parse('${Constants.baseUrl}verifyLoginOtp');
    var response = await http
        .post(
      url,
      body: {
        "phone":Constants.tempPhone,
        "otp": otp,

      },

    )
        .timeout(const Duration(seconds: 10),onTimeout: (){

      return confirmationPopup(context, "Check your Internet Connection!");
    });
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      print(body);
      dynamic status=body['message'];
      dynamic user=body["user"];
      dynamic name=user["name"];
      dynamic id=user['id'];
      dynamic email=user["email"];
      dynamic dob=user["dob"];
      dynamic lastName=user["last_name"];
      dynamic country=user["country"];
      dynamic state=user["state"];
      dynamic phoneNumber=user["phone"];
      setState(() {
        Constants.userName=name;
        Constants.userEmail=email;
        Constants.userDob=dob;
        Constants.userLastName=lastName;
        Constants.userCountry=country;
        Constants.userId=id.toString();
        Constants.state=state;
        Constants.phoneNumber=phoneNumber;
      });
      await saveLoginState(true);
      bl.close();
      Fluttertoast.showToast(
          msg: status,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor:AppColors.appBlueColor,
          textColor: Colors.white,
          fontSize: 16.0
      );


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigationBarScreen()),
            (Route<dynamic> route) => false,
      );

    /*  larry ada bilal travel
      kfc
      hot cake
      bramadi moor
      pakka garah
      china chowk roras road
      uggo ki
      sambrial moor  */







    } else {
      bl.close();
      dynamic body = jsonDecode(response.body);
      dynamic error=body['message'];
      print(response.body);
      print(error);

      confirmationPopup(context, error);
    }
    ;
  }

  Future<void> saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("shared preference chal gai ");
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }
  confirmationPopup(BuildContext dialogContext, String? error) {

    var alertStyle = const AlertStyle(
      animationType: AnimationType.grow,
      overlayColor: Colors.black87,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
      descStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
      animationDuration: Duration(milliseconds: 400),
    );

    Alert(context: dialogContext, style: alertStyle, title: error, buttons: [
      DialogButton(
        onPressed: () {
          bl.close();
          Navigator.pop(dialogContext);
        },
        color: AppColors.redColor,
        child: const Text(
          "Try Again",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
    ]).show();
  }
}
