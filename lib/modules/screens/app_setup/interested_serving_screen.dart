import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

class InterestedServingScreen extends StatefulWidget {
  const InterestedServingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InterestedServingScreenState();
  }
}

class InterestedServingScreenState extends State<InterestedServingScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool boxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(
        title: '',
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizeBoxHeight4(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppHeadings(
                            'Interested in Serving',
                            size: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          AppText(
                            'Please write down the description with \nmaximum 2 line',
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizeBoxHeight16(),
                  Center(
                    child: Image.asset(
                      'assets/images/frm_list.png',
                    ),
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
