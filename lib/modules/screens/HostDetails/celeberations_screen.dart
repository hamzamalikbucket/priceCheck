import 'package:compareapp/Models/post_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


class CelerbationsScreen extends StatefulWidget{
  const CelerbationsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CelebState();
  }


}
class CelebState extends State<CelerbationsScreen>{
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
               /* Image.asset(
                  pM.postImage,
                  height: 299,
                  fit: BoxFit.cover,
                ),*/

                const SizeBoxHeight12(),


                const SizeBoxHeight12(),
              ],
            );
          },
        ),
      ),
    );
  }

}