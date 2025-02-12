import 'dart:convert';

import 'package:bottom_loader/bottom_loader.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegState();
  }
}

class RegState extends State<RegisterScreen> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController rpcController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController marriageDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  late BottomLoader bl;
  bool isBarbadosSelected = false; // State to track if "Barbados" is selected
  String? selectedParish; // Selected parish from the dropdown


  final List<String> barbadosParishes = [
    "Christ Church",
    "Saint Andrew",
    "Saint George",
    "Saint James",
    "Saint John",
    "Saint Joseph",
    "Saint Lucy",
    "Saint Michael",
    "Saint Peter",
    "Saint Philip",
    "Saint Thomas",
  ];

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
        message:'Creating Account...',
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
          child: SingleChildScrollView(
            child: Form(
              key: registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizeBoxHeight4(),
                  const AppText(
                    'Hey there,',
                    size: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight4(),
                  const AppHeadings(
                    'Create an Account',
                    size: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight16(),
                  Column(
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

                          AppIconField(
                            controller: firstNameController,
                            hint: 'First Name',
                            prefixIcon: Constants.person,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),

                          AppIconField(
                            controller: lastNameController,
                            hint: 'Last Name',
                            prefixIcon: Constants.person,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1800), // Set your minimum date here
                                lastDate: DateTime(2500), // Set your maximum date here
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: AppColors.bluecolor, // Selected date background color
                                        onSurface: AppColors.black,     // Selected date text color
                                        onPrimary:AppColors.yellowColor,  // Default text color
                                      ),
                                      primaryColor: AppColors.bluecolor,
                                      hintColor: AppColors.bluecolor,


                                      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                                    ),
                                    child: child ?? const SizedBox.shrink(),
                                  );
                                },
                              );

                              if (selectedDate != null) {
                                // Format the date as needed, e.g., "dd/MM/yyyy"
                                String formattedDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                                dobController.text = formattedDate;
                              }
                            },
                            child: AbsorbPointer(
                              child:  AppIconField(
                                readOnly: true,
                                controller:dobController,
                                hint: 'Date of Birth',
                                prefixIcon: Constants.calendarIcon,

                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.next,
                                validator: (val) {
                                  if (val == null || val.trim().isEmpty) {
                                    return "DOB required";
                                  }
                                  return null;
                                },
                              ),
                            ),
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),







                          AppIconField(
                            readOnly: true,
                            controller:countryController ,
                            hint: 'Choose Country',
                            prefixIcon: Constants.countryPickerIcon,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            onTap: (){

                              showCountryPicker(

                                context: context,

                                showPhoneCode: true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  print('Select country: ${country.displayName}');
                                  countryController.text=country.displayNameNoCountryCode ;
                                  print(countryController.toString());
                                  setState(() {
                                    isBarbadosSelected =
                                        country.displayNameNoCountryCode ==
                                            "Barbados (BB)";
                                    if (!isBarbadosSelected) {
                                      selectedParish =
                                      null; // Reset dropdown selection
                                    }
                                  });
                                },
                              );
                            },
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),

                          isBarbadosSelected
                              ? DropdownButtonFormField<String>(
                            value: selectedParish,
                            hint:  Text("Select Parish"),


                            decoration: InputDecoration(

                              prefixIcon:Padding(
                                padding:  const EdgeInsets.all(12.0), // Adjust padding as needed
                                child: Image.asset(
                                  Constants.locationFieldIcon, // Use the asset path
                                  height: 20,
                                  width: 20,
                                ),
                              ),

                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),

                            ),
                            items: barbadosParishes
                                .map((parish) => DropdownMenuItem<String>(
                              value: parish,
                              child: Text(parish),
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedParish = value;
                              });
                            },
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                          )
                              :
                          AppIconField(
                            controller:locationController ,
                            hint: 'State',
                            prefixIcon: Constants.locationFieldIcon,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),

                          AppIconField(
                            controller: emailController,
                            hint: 'Email',
                            prefixIcon: Constants.emailIcon,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return 'Required ';
                              }else if(val.trim().isNotEmpty){
                                return EmailValidator.validate(val) ? null : 'Please enter valid email';

                              }
                              return null;

                            },
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
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
                                return "Password is Required";
                              } else if (val.trim().length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
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
                                color:AppColors.containerBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.containerBgColor,width: 0.5)

                            ),
                          ),
                          AppPasswordField(
                            controller: confirmController,
                            hint: 'Confirm Password',
                            prefixIcon: Constants.lock,
                            suffixIcon: Constants.eye,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Password is Required";
                              } else if (val.trim().length < 8 ) {
                                return "Password must be at least 8 characters";
                              }else if (val!=passwordController.text.toString() ) {
                                return "Password Does not Match";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizeBoxHeight2(),


                      const SizeBoxHeight16(),
                      AppSimpleButton(
                        onTap: () async{
                          final form = registerFormKey.currentState;
                          form!.save();
                          if (form.validate()) {

                            bl.display();
                            try{
                              signup();
                            }catch (e){
                              bl.close();
                              confirmationPopup(context, "An error Occurred.Try again later!");
                            }

                          }
                        },
                        width:MediaQuery.of(context).size.width,
                        btnColor: AppColors.appBlueColor,
                        btnTextColor: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        height: 60,
                        btnText: "Register",




                      ),

                      const SizeBoxHeight8(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText(
                            'Already have an account?',
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyTextColor,
                          ),
                          GestureDetector(
                            onTap: () {
                             Navigator.pop(context);
                            },
                            child: const AppText(
                              'Login',

                              size: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.appBlueColor,
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
  Future<dynamic> signup() async {
    var url = Uri.parse('${Constants.baseUrl}signUp');
    var response = await http
        .post(
      url,
      body: {
        "email": emailController.text.toString(),
        "password": passwordController.text.toString(),
        "name":firstNameController.text.toString(),
        "last_name":lastNameController.text.toString(),
        "dob":dobController.text.toString(),
        "state":locationController.text.toString(),
        "country":countryController.text.toString()
      },

    )
        .timeout(const Duration(seconds: 10),onTimeout: (){
      bl.close();
      return confirmationPopup(context, "Check your Internet Connection!");
    });

    if (response.statusCode == 201) {
      print(response.body);
      dynamic body = jsonDecode(response.body);
      dynamic status=body['message'];
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
       Navigator.pop(context);
    } else {

      dynamic body = jsonDecode(response.body);
      String error = body['error'];
      bl.close();
      confirmationPopup(context, error);
    }
    ;
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
