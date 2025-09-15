
import 'package:compareapp/modules/screens/dashboard/home/snips_screen.dart';
import 'package:compareapp/modules/screens/live_user_tabs/get_in_touch_screen.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:flutter/material.dart';

import 'upcoming_birthday_screen.dart';

class LiveUserTab extends StatefulWidget{
  const LiveUserTab({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabState();
  }


}
class TabState extends State <LiveUserTab>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,


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
                    labelStyle: const TextStyle(fontSize: 13),

                    tabs: const [
                      Tab(
                        text: "Live Users",

                      ),
                      Tab(
                        text: " Upcoming Birthdays \n     "
                            " &Anniversaries",

                      ),
                      Tab(
                        text: "Get in Touch",
                      ),


                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    SnipsScreen(),
                    UpcomingScreen(),
                    GetInTouchScreen(),

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