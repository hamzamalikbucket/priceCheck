
import 'package:compareapp/Models/event_model.dart';
import 'package:compareapp/modules/screens/HostDetails/Events/host_event_details.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';


class HostEvents extends StatefulWidget{
  const HostEvents({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HostEventState();
  }


}
class HostEventState extends State<HostEvents>{
  List<EventModel> eventList = [
    EventModel(
        eventImg: "assets/images/eventImg.png",
        eventStatus: "Live",
        eventDescription: "In publishing and graphic designing lorem ipsum ",
        eventStartTime: "12:30 pm - 04:00 pm",
        eventEndTime: "04:00 pm",
        eventStartDate: "16-12-2023",
        eventEndDate: "16-12-2023",
        eventLocation: "The University of World, USA",
        eventHostImg: "assets/images/profile.png",
        eventHostName: "Buland Khan",
        eventHostLocation: "Lahore,Pakistan",
        eventInvitationStatus: "Not responded",
        eventPriceStatus: true, eventName: 'esm Workshop', eventTimeZone: 'USA', eventNature: 'Corporate',eventPrice: "50"),
    EventModel(
      eventImg: "assets/images/eventExmp.png",
      eventStatus: "Live",
      eventDescription: "In publishing and graphic designing lorem ipsum ",
      eventStartTime: "12:30 pm - 04:00 pm",
      eventEndTime: "04:00 pm",
      eventStartDate: "16-12-2023",
      eventEndDate: "16-12-2023",
      eventLocation: "The University of World, USA",
      eventHostImg: "assets/images/profile.png",
      eventHostName: "Buland Khan",
      eventHostLocation: "Lahore,Pakistan",
      eventInvitationStatus: "Not responded",
      eventPriceStatus: false, eventName: 'esm Workshop', eventTimeZone: 'USA', eventNature: 'Corporate',eventPrice: "50",
    ),


  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: SafeArea(
       child:ListView.builder(
         padding: EdgeInsets.zero,
         itemCount: eventList.length,
         addRepaintBoundaries: true,
         scrollDirection: Axis.vertical,
         shrinkWrap: true,
         physics: const AlwaysScrollableScrollPhysics(),
         itemBuilder: (context, index) {
           EventModel eVents = eventList[index];
           return GestureDetector(
             onTap:(){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => const HostEventsDetails(),
                   settings: RouteSettings(
                     arguments: eVents,
                   ),
                 ),
               );

             },
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(
                     8.0,
                   ),
                   child: Row(
                     children: [
                       CircleAvatar(
                         radius: 30,
                         backgroundImage: AssetImage(
                           eVents.eventHostImg,
                         ),
                       ),
                       const SizedBox(
                         width: 8,
                       ),
                       Column(
                         children: [
                           const SizedBox(
                             height: 5,
                           ),
                           AppText(
                             eVents.eventHostName,
                             size: 16,
                             fontWeight: FontWeight.w700,
                             color: AppColors.black,
                           ),
                           AppText(
                             eVents.eventHostLocation,
                             size: 12,
                             fontWeight: FontWeight.w500,
                             color: AppColors.greyHintColor,
                           ),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 12, left: 10),
                         child: (eVents.eventPriceStatus)
                             ? SvgPicture.asset(
                           Constants.paidIcon,
                         )
                             : SvgPicture.asset(
                           Constants.freeIcon,
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 299,
                   width: MediaQuery.of(context).size.width,
                   child: Stack(
                     children: [
                       Image.asset(
                         eVents.eventImg,
                         fit: BoxFit.fitHeight,
                         height: 299,

                       ),
                       Align(
                         alignment: Alignment.bottomCenter,
                         child: Padding(
                           padding: const EdgeInsets.only(
                               left: 10, bottom: 46, right: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                                 children: [
                                   SvgPicture.asset(
                                     Constants.calendarImg,
                                     height: 20,
                                   ),
                                   const SizedBox(width: 10),
                                   AppText(
                                     eVents.eventStartDate,
                                     size: 10,
                                     fontWeight: FontWeight.w400,
                                     color: AppColors.primaryColor,
                                   ),
                                   const SizedBox(width: 20),
                                   SvgPicture.asset(
                                     Constants.clockImg,
                                     height: 20,
                                   ),
                                   const SizedBox(width: 10),
                                   AppText(
                                     eVents.eventStartTime,
                                     size: 10,
                                     fontWeight: FontWeight.w400,
                                     color: AppColors.primaryColor,
                                   ),
                                 ],
                               ),
                               SvgPicture.asset(
                                 Constants.shareBtnBlue,
                               ),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 const SizeBoxHeight8(),
                 Padding(
                   padding: const EdgeInsets.only(left: 15),
                   child: Row(
                     children: [
                       const AppText(
                         "Invitation Status:",
                         size: 14,
                         fontWeight: FontWeight.w400,
                         color: AppColors.black,
                       ),
                       AppText(
                         eVents.eventInvitationStatus,
                         size: 16,
                         fontWeight: FontWeight.w400,
                         color: AppColors.redColor,
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 15, top: 4),
                   child: Row(
                     children: [
                       SvgPicture.asset(
                         Constants.locationImg,
                       ),
                       AppText(
                         eVents.eventLocation,
                         size: 14,
                         fontWeight: FontWeight.w400,
                         color: AppColors.appGreenColor,
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(
                       left: 15.0, right: 8, bottom: 8, top: 8),
                   child: AppText(
                     eVents.eventDescription,
                     size: 14,
                     fontWeight: FontWeight.w400,
                     color: AppColors.black,
                   ),
                 ),
               ],
             ),
           );
         },
       ),

     ),
   );
  }


}