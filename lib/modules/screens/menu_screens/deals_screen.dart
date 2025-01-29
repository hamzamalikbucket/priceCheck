
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/Toolbar.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DealsScreenState();
  }
}

class DealsScreenState extends State<DealsScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool boxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(title: 'Deals', appBar: AppBar(),

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
                  const SizeBoxHeight16(),
                  Center(
                    child: Image.asset(
                      'assets/images/dealpic.png',
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
