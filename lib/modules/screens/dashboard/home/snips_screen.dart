import 'dart:math';

import 'package:compareapp/Models/snips_model.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

class SnipsScreen extends StatefulWidget {
  const SnipsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SnipState();
  }
}

class SnipState extends State<SnipsScreen> {
  TextEditingController searchController = TextEditingController();
  final rnd = Random();
  late List<int> extents;

  List<SnipsModel> userList = [
    SnipsModel(userImg:  "assets/images/post.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/dummyPost2.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/redpost.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/post.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/dummyPost2.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/redpost.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/post.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/dummyPost2.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/redpost.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/post.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/dummyPost2.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
    SnipsModel(userImg:  "assets/images/redpost.png", userName: "Buland Khan", userEmail: "johndoes@gmail.com", userPhone: '0900786-1'),
      // Add more posts as needed
  ];
@override
  void initState() {
    // TODO: implement initState
  extents = List<int>.generate(10000, (int index) => rnd.nextInt(5) + 1);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyBgColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: TextFormField(
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: AppColors.greyHintColor,
                              fontSize: 14,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                child: ImageIcon(
                                  AssetImage(Constants.search),
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizeBoxWidth8(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
