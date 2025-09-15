import 'dart:convert';

import 'package:compareapp/modules/screens/dashboard/bottom_nav_bar.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:bottom_loader/bottom_loader.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViaPhone extends StatefulWidget {
  const LoginViaPhone({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginViaPhoneState();
  }
}

class LoginViaPhoneState extends State<LoginViaPhone> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  bool boxValue = true;
  late BottomLoader bl;

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
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarImage(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'Login With Your Phone Number',
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      const SizeBoxHeight16(),
                      const SizeBoxHeight8(),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.containerBgColor,
                                    width: 0.5)),
                          ),
                          AppIconField(
                              controller: phoneController,
                              hint: 'Enter Phone Number with country code',
                              prefixIcon: Constants.phone,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return "Phone is Required";
                                } else if (val.trim().length < 11) {
                                  return "Valid Phone Required";
                                }
                                return null;
                              }
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                const SizeBoxHeight16(),
                const SizeBoxHeight16(),

                const SizeBoxHeight32(),

                AppSimpleButton(
                  onTap: () async{
                    final form = loginFormKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      bl.display();

                      try{
                        login();
                      }catch (e){
                        bl.close();
                        confirmationPopup(context, "An error Occurred.Try again later!");
                      }

                    }

                  },
                  width:MediaQuery.of(context).size.width,
                  height: 60,
                  btnText: "Proceed",
                  btnColor: AppColors.appBlueColor,
                  btnTextColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,



                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<dynamic> login() async {
    var url = Uri.parse('${Constants.baseUrl}loginWithPhone');
    var response = await http
        .post(
      url,
      body: {
        "phone": phoneController.text.toString(),


      },

    )
        .timeout(const Duration(seconds: 10),onTimeout: (){
      bl.close();
      return confirmationPopup(context, "Check your Internet Connection!");
    });
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      print(body);
      dynamic status=body['message'];


      setState(() {
      Constants.tempPhone=phoneController.text.toString();
      Constants.verifiedViaPhone=true;
      });




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


      Navigator.pushNamed(context,'/OtpScreen');
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
