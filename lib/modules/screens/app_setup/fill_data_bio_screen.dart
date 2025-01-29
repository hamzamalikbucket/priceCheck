import 'package:flutter/material.dart';

import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';


class FillDataBioScreen extends StatefulWidget {
  const FillDataBioScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FillDataState();
  }
}

class FillDataState extends State<FillDataBioScreen> {
  final GlobalKey<FormState> bioFormKey = GlobalKey<FormState>();
  TextEditingController bioController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0), // Set the height of the app bar
        child: AppBar(
          backgroundColor: AppColors.noColor, // Make the AppBar background transparent
          elevation: 0,

          flexibleSpace: Container(
            decoration: const BoxDecoration(

              image: DecorationImage(
                image: AssetImage( 'assets/images/bGUser.png',), // Replace with your image

              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: bioFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizeBoxHeight4(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                    ],
                  ),
                  const SizeBoxHeight16(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        'Write a bio',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      const SizeBoxHeight8(),
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color:AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColors.greyHintColor,width: 0.5)

                            ),
                          ),

                          AppIconField(
                            controller: bioController,
                            hint: 'write your bio here',
                            maxLength: 500,

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

                      const SizeBoxHeight32(),
                      const SizeBoxHeight32(),
                      const SizeBoxHeight32(),
                      const SizeBoxHeight32(),
                      AppBorderButton(
                        onTap: () {
                          Navigator.pushNamed(context, '/BottomNavigationBarScreen');
                          // if (loginFormKey.currentState!.validate()) {
                          //   String s = emailController.text;
                          // }
                        },
                        width:MediaQuery.of(context).size.width,
                        height: 60,
                        btnText: "Submit",


                      ),
                      const SizeBoxHeight16(),
                      const SizeBoxHeight16(),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/BottomNavigationBarScreen');
                          },
                          child: const AppText(
                            'Skip for later',

                            size: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
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
}
