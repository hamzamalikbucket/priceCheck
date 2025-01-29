
import 'package:compareapp/Models/post_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class HostPost extends StatefulWidget{
  const HostPost({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostState();
  }


}
class PostState extends State<HostPost>{
  List<PostModel> postList = [

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:AppColors.primaryColor,
      body: SafeArea(
        child:ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: postList.length,
          addRepaintBoundaries: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            PostModel pM = postList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, '/HostProfile');
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                        const SizeBoxWidth12(),

                      ],
                    ),
                  ),
                ),
               /* Image.asset(
                  pM.postImage,
                  height: 299,
                  fit: BoxFit.cover,
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizeBoxWidth12(),
                        SvgPicture.asset(
                          Constants.favouriteIcon,
                        ),
                        const SizeBoxWidth12(),
                        SvgPicture.asset(
                          Constants.commentIcon,
                        ),
                        const SizeBoxWidth12(),
                        SvgPicture.asset(
                          Constants.viewIcon,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Constants.shareBtnBlue,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      AppText(
                        "${pM.likeCounts} Likes",
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),


                const SizeBoxHeight12(),
              ],
            );
          },
        ),
      ),
    );
  }

}