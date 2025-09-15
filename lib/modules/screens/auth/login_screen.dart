import 'dart:convert';

import 'package:compareapp/modules/screens/dashboard/bottom_nav_bar.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:bottom_loader/bottom_loader.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                        'Welcome to Price Check',
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
                            controller: emailController,
                            hint: 'Enter email',
                            prefixIcon: Constants.emailIcon,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return 'Required ';
                                }else if(val.trim().isNotEmpty){
                                  return EmailValidator.validate(val) ? null : 'Please enter valid email';

                                }
                                return null;
                              }
                          ),
                        ],
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
                          AppPasswordField(
                            controller: passwordController,
                            hint: 'Password',
                            prefixIcon: Constants.lock,
                            suffixIcon: Constants.eye,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Password Required";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizeBoxHeight16(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/PhoneLoginScreen');
                            },
                            child: const AppText(
                              underline: true,
                              'Log in with phone number',
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.appBlueColor,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizeBoxHeight16(),
                const SizeBoxHeight16(),
                GestureDetector(
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
                  child: SvgPicture.asset(
                    Constants.loginBTn,
                  ),
                ),

                const SizeBoxHeight32(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/ForgotPassword');
                      },
                      child: const AppText(
                        underline: true,
                        'Forgot your password?',
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appBlueColor,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/RegisterScreen');
                  },
                  child: const AppText(
                    'Don\'t have an account? Sign Up',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.appBlueColor,
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<dynamic> login() async {
    var url = Uri.parse('${Constants.baseUrl}login');
    var response = await http
        .post(
      url,
      body: {
        "email": emailController.text.toString(),
        "password": passwordController.text.toString(),

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
      dynamic id=body['user_id'];
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
