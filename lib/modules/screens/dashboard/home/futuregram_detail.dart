import 'package:compareapp/Models/live_user_model.dart';
import 'package:compareapp/Models/post_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FutureGramDetail extends StatefulWidget {
  const FutureGramDetail({super.key});

  @override
  State<FutureGramDetail> createState() => _FutureGramDetailState();
}

class _FutureGramDetailState extends State<FutureGramDetail> {
  TextEditingController searchController = TextEditingController();
  // Define a PageController
  final PageController _pageController = PageController();

// Use a variable to keep track of the current page index
  final int _currentPageIndex = 0;
  List<PostModel> postList = [


  ];
  List<LiveUserModel> userList = [
    LiveUserModel(userImg: "assets/images/bluemne_pp.png", userName: "Buland Khan", userEmail: "johndoes@gmai.com", userPhone: '0900786-1'),
    LiveUserModel(userImg: "assets/images/frameDp.png", userName: "Alice Johnson", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/female_pp.png", userName: "Auron Gestro", userEmail: "alice@example.com", userPhone: '0900786-2'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "Charlie Brown", userEmail: "charlie@example.com", userPhone: '0900786-3'),
    LiveUserModel(userImg: "assets/images/profile.png", userName: "David Smith", userEmail: "david@example.com", userPhone: '0900786-4'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(
        appBar: AppBar(), title: 'Futuregram Details',
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizeBoxHeight16(),
            SizedBox(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: postList.length,
                addRepaintBoundaries: true,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  PostModel pM = postList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, '/HostDetailTabScreen');
                            },
                            child: Row(
                              mainAxisAlignment: pM.isPopular? MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
                              children: [


                                const SizedBox(width: 12),
                                (pM.isPopular)?SvgPicture.asset(
                                  Constants.popularBtn,
                                ):const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            pM.postDescription,
                            size: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyHintColor,
                            justifyText: true,
                          ),
                        ),
                        SvgPicture.asset(
                          Constants.viewMapImg,
                        ),
                        SizedBox(
                          height: 250, // Adjust height as needed
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:pM.postImage.length,
                            addRepaintBoundaries: true,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,

                              itemBuilder: (context, imageIndex) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.containerBg.withOpacity(0.8),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.noColor,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Image.asset(
                                            pM.postImage[imageIndex],
                                          height: 120,
                                            width: 220,
                                            fit: BoxFit.fitWidth,



                                          ),
                                        ),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left:8.0),
                                                  child: CircleAvatar(
                                                    radius: 13,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/profile.png"
                                                    ),
                                                  ),
                                                ),
                                                AppText(
                                                  "  Futuregram ",
                                                  size: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.black,
                                                ),
                                                AppText(
                                                  "Image 1",
                                                  size: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.black,
                                                ),


                                              ],
                                            ),
                                            SizeBoxWidth32(),

                                            AppText(
                                              "       2h Ago",
                                              size: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.greyTextColor,
                                            ),

                                          ],
                                        ),
                                       const Padding(
                                         padding: EdgeInsets.all(8.0),
                                         child: AppText(
                                            " Beautiful  sunset over the mountains",
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                       ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                          ),
                        ),
                        const SizeBoxHeight8(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.redFavourite,
                                  height: 16,
                                  width: 16,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left:5),
                                  child: AppText(
                                    "Dwayne,Ayana & 171 more",
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const AppText(
                              "45 Comments",
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyTextColor,
                            ),
                          ],
                        ),
                        const SizeBoxHeight8(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  child: SvgPicture.asset(
                                    Constants.favouriteIcon,
                                  ),
                                  onTap: () {
                                    // Navigator.pushNamed(context, "/LikeScreen");
                                  },
                                ),
                                const AppText(
                                  "Like",
                                  size: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.pushNamed(context, "/CommentScreen");
                                  },
                                  child: SvgPicture.asset(
                                    Constants.commentIcon,
                                  ),
                                ),
                                const AppText(
                                  "Comment",
                                  size: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.shareAsset,
                                ),
                                const AppText(
                                  "Share",
                                  size: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyTextColor,
                                ),
                              ],
                            ),

                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Comments",
                    size: 17,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  Icon(
                    Icons.arrow_drop_down

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: userList.map((user) {
                  return GestureDetector(
                    onTap: () {
                      // Handle tap


                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.containerBg.withOpacity(0.4),
                          border: Border.all(
                            width: 1,
                            color: AppColors.noColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                child: Row(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(user.userImg),
                                        ),
                                      ),
                                    ),

                                    const SizeBoxWidth8(),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            AppText(
                                              "${user.userName}  ",
                                              size: 14,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.black,
                                            ),

                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top:12),
                                          child: AppText(
                                            'Great Post!',
                                            size: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.greyTextColor,
                                          ),
                                        ),
                                      ],
                                    ),



                                  ],
                                ),

                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Constants.redFavourite,
                                        height: 16,
                                        width: 16,
                                      ),
                                     const Padding(
                                       padding: EdgeInsets.only(left:8),
                                       child: AppText(
                                         "18",
                                          size: 15,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTextColor,
                                        ),
                                     ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top:10),
                                    child: AppText(
                                      'Reply',
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.appGreenColor,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
