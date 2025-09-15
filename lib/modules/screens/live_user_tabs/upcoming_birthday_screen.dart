
import 'package:compareapp/Models/birthday_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class UpcomingScreen extends StatefulWidget{
  const UpcomingScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BirthState();
  }

}
class _BirthState extends State<UpcomingScreen>{
  TextEditingController searchController = TextEditingController();

  List <BirtdhayModel> userList=[
    BirtdhayModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1',userDob:"15 September 2023 "),
    BirtdhayModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1',userDob:"15 September 2023 "),
    BirtdhayModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1',userDob:"15 September 2023 "),
    BirtdhayModel(userImg: "assets/images/profile.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1',userDob:"15 September 2023 "),
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
                          hintText: 'Search Contacts',
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
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Upcoming Birthday",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,

                  ),
                  AppText(
                    "See All",
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,

                  ),

                ],
              ),
            ),
            Expanded(
                flex: 3,
                child:
            ListView.builder(
                itemCount: userList.length,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  BirtdhayModel users = userList[index];

                  return GestureDetector(
                    onTap: (){



                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: AppColors.primaryColor,
                          border: Border.all(
                            width: 1,
                            color: AppColors.greyBgColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  "assets/images/profile.png",
                                ),
                              ),
                            ),

                            const SizeBoxHeight16(),

                            AppText(
                              users.userName,
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,

                            ),
                            AppText(
                              users.userDob,
                              size: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,

                            ),




                          ],
                        ),
                      ),
                    ),
                  );

                },
               )),
            const Padding(
              padding: EdgeInsets.only(left:12.0,right:12,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    " Upcoming Anniversary",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,

                  ),
                  AppText(
                    "See All",
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,

                  ),

                ],
              ),
            ),
            Expanded(
                flex: 2,

                child: ListView.builder(
                itemCount: userList.length,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  BirtdhayModel users = userList[index];

                  return GestureDetector(
                    onTap: (){



                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: AppColors.primaryColor,
                          border: Border.all(
                            width: 1,
                            color: AppColors.greyBgColor,
                          ),
                        ),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Center(
                              child: CircleAvatar(
                                radius: 30,
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
               )),

          ],
        ),
      ),
    );
  }


}

