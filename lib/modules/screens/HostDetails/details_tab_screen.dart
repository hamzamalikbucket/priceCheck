import 'package:compareapp/modules/screens/HostDetails/Events/HostEvents.dart';
import 'package:compareapp/modules/screens/HostDetails/celeberations_screen.dart';
import 'package:compareapp/modules/screens/HostDetails/host_post_screen.dart';
import 'package:compareapp/modules/screens/HostDetails/host_profile_screen.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:flutter/material.dart';
class DetailTab extends StatefulWidget{
  const DetailTab({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabState();
  }


}
class TabState extends State <DetailTab>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return  DefaultTabController(
    length: 4,
    child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarImage(
        appBar: AppBar(),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: AppColors.primaryColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.appGreenColor,
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.gradiantStartColor, AppColors.gradiantEndColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),

                    borderRadius: BorderRadius.circular(70),
                  ),
                  isScrollable: true,
                  unselectedLabelColor: AppColors.secondaryColor,
                  labelColor: Colors.white,

                  tabs: const [
                    Tab(
                      text: "Details",
                    ),
                    Tab(
                      text: "Post",
                    ),
                    Tab(
                      text: "Events",
                    ),
                    Tab(
                      text: "Celebrations",
                    ),

                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  HostProfile(),
                  HostPost(),
                  HostEvents(),
                  CelerbationsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  }


}