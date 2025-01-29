
import 'package:compareapp/Models/event_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class HostEventsDetails extends StatefulWidget {
  const HostEventsDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailState();
  }
}

class DetailState extends State<HostEventsDetails> {
  late EventModel eventsModel;
  final List<String> dressImages = [
    'assets/images/product_dummy_img.png',
    'assets/images/product_dummy_img.png',
    'assets/images/product_dummy_img.png',
    'assets/images/dummy_dress_code.png',

  ];
  @override
  Widget build(BuildContext context) {
    eventsModel = ModalRoute.of(context)!.settings.arguments as EventModel;
    print(eventsModel.eventName);
    // TODO: implement build
    return Scaffold(
      appBar: ToolbarBack(appBar: AppBar(), title: "Details"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      eventsModel.eventName,
                      size: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    (eventsModel.eventPriceStatus)
                        ? SvgPicture.asset(
                            Constants.paidIcon,
                          )
                        : SvgPicture.asset(
                            Constants.freeIcon,
                          ),
                  ],
                ),
                const SizeBoxHeight12(),
                Image.asset(eventsModel.eventImg),
                const SizeBoxHeight16(),
                const AppText(
                  "Event Owner Name",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  eventsModel.eventHostName,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Nature",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  eventsModel.eventNature,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Event Start Date",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  "${eventsModel.eventStartDate}/${eventsModel.eventStartTime}",
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Event end Date",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  "${eventsModel.eventEndDate}/${eventsModel.eventEndTime}",
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Event TimeZone",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  eventsModel.eventTimeZone,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Event Price",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  eventsModel.eventPrice,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Event Location",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                AppText(
                  eventsModel.eventLocation,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const SizeBoxHeight8(),
                const AppText(
                  "Event Dress Code",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyHintColor,
                ),
                const SizeBoxHeight4(),
                const AppText(
                  "All Types",
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 50.0,
                          height: 50,// Adjust the width as needed
                          child: Image.asset(
                            dressImages[index],
                            fit: BoxFit
                                .cover, // You can use other BoxFit values as needed
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
