import 'package:compareapp/Models/live_user_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class GetInTouchScreen extends StatefulWidget{
  const GetInTouchScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetTouchState();
  }

}
class _GetTouchState extends State<GetInTouchScreen>{
  TextEditingController searchController = TextEditingController();

  List <LiveUserModel> userList=[
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body:SafeArea(
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
                          color: AppColors.appGreenColor,
                        ),
                      ),
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search Name',
                          hintStyle: const TextStyle(
                            color: AppColors.greyHintColor,
                            fontSize: 15,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.appGreenColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const ImageIcon(
                                  AssetImage(Constants.search),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const ImageIcon(
                              AssetImage(Constants.worldMap),
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

                const SizeBoxWidth8(),
              ],
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: userList.length,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    LiveUserModel users = userList[index];

                    return GestureDetector(
                      onTap: (){



                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.primaryColor,
                            border: Border.all(
                              width: 1,
                              color: AppColors.greyBgColor,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Center(
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    "assets/images/profile.png",
                                  ),
                                ),
                              ),

                              const SizeBoxHeight16(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    users.userName,
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,

                                  ),

                                ],
                              ),




                            ],
                          ),
                        ),
                      ),
                    );

                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  )),
            )),
            const SizeBoxWidth8(),
          ],
        ),
      ),
    );
  }


}

