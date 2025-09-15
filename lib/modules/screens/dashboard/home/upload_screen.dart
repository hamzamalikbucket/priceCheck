import 'package:compareapp/Models/featured_produtcs_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/app_field.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UploadState();
  }
}

class UploadState extends State<UploadScreen> {
  final GlobalKey<FormState> uploadFormKey = GlobalKey<FormState>();


  TextEditingController captionController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool switchBtn = true;

  List<FeaturedProductsModel> trendList = [

  ];
  List<FeaturedProductsModel> contentList = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(
        appBar: AppBar(), title: 'Upload Content',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: uploadFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizeBoxHeight4(),

                  const AppText(
                    'Upload',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                            color:AppColors.blueLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15,right: 15,bottom: 15),
                            child: SvgPicture.asset(
                              Constants.uploadBlueButton,
                            ),


                          ),

                        ],
                      ),


                    ],
                  ),

                  const SizeBoxHeight16(),
                  const AppText(
                    'Add a caption',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
                  Stack(
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color:AppColors.blueLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                        ),
                      ),
                      AppIconField(
                        controller: captionController,
                        hint: 'Add a caption',
                        prefixIcon: Constants.bioIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Tag required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight16(),
                  const AppText(
                    'Add hashtags(e.g., #fun,#explore)',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
                  Stack(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color:AppColors.blueLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                        ),
                      ),
                      AppIconField(
                        controller: tagController,
                        hint: 'Your Hashtags',
                        prefixIcon: Constants.hashTag,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Tags required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'Tag location',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const SizeBoxHeight8(),
                  Stack(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color:AppColors.blueLightColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appGreenColor,width: 0.5)

                        ),
                      ),
                      AppIconField(
                        controller: locationController,
                        hint: 'Tag location',
                        prefixIcon: Constants.locationFieldIcon,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return "Location required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Constants.mapIcon,
                          ),
                          const AppText(
                            '  Make map available with  ',
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          const AppText(
                            'Futuregrams',
                            underline: true,
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.appGreenColor,
                          ),
                        ],
                      ),
                      Switch(
                        value: switchBtn,
                        onChanged: (bool newValue) {
                          setState(() {
                            switchBtn=newValue;
                          });
                        },
                        activeColor: AppColors.buttonBlueColor,
                      ),
                    ],
                  ),
                  const SizeBoxHeight32(),


                  AppBorderButton(
                    onTap: () {

                     return  showDialog(
                       context: context, builder: (BuildContext context) {
                      return Dialog(
                         shape: RoundedRectangleBorder(
                           borderRadius:
                           BorderRadius.circular(20.0), // Adjust the radius as needed
                         ),
                         elevation: 0,
                         backgroundColor: Colors.transparent,
                         child: Container(
                           width: MediaQuery.sizeOf(context).width,
                           decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             color: Colors.white,

                             borderRadius: BorderRadius.circular(10.0),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.black.withOpacity(0.3),
                                 blurRadius: 10.0,
                                 offset: const Offset(0, 10),
                               ),
                             ],
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: <Widget>[
                                 Image.asset('assets/images/bioMatric.png',),
                                 const SizeBoxHeight16(),
                                 const AppHeadings(
                                   'Successfully',
                                   size: 24,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.black,
                                 ),
                                 const SizeBoxHeight8(),
                                 const AppText(
                                   'Uploaded your content',
                                   size: 24,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.black,

                                   alignText:true,
                                   justifyText:false,

                                 ),
                                 const SizeBoxHeight16(),
                                 AppBorderButton(
                                   onTap: () {
                                   Navigator.pop(context);
                                     // if (loginFormKey.currentState!.validate()) {
                                     //   String s = emailController.text;
                                     // }
                                   },
                                   width:MediaQuery.of(context).size.width,
                                   height: 60,
                                   btnText: "Ok",



                                 ),
                               ],
                             ),
                           ),
                         ),
                       );


                     },
                     );

                    },
                    width:MediaQuery.of(context).size.width,
                    height: 60,
                    btnText: "Create",




                  ),
                  const SizeBoxHeight16(),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "Content around you",
                          size: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        AppText(
                          "View All",
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyTextColor,
                        ),
                      ],
                    ),
                  ),
                  const SizeBoxHeight16(),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: contentList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        FeaturedProductsModel tM = contentList[index];
                        return Card(
                          color: AppColors.lightgreybgColor,
                          elevation: 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                 width: 150,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AppColors.noColor, width: 0.5)),
                                  child: Image.asset(
                                    tM.productImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizeBoxHeight8(),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Constants.locationFieldIcon,
                                          height: 12,
                                          width: 12,
                                        ),
                                        AppText(
                                          tM.productName,
                                          size: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTextColor,
                                        ),
                                      ],
                                    ),
                                    const SizeBoxWidth16(),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Constants.redFavourite,
                                          height: 12,
                                          width: 12,
                                        ),
                                        AppText(
                                          tM.productPrice,
                                          size: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTextColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizeBoxHeight8(),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AppText(
                                      "Uploaded by:          ",
                                      size: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyTextColor,
                                    ),
                                    Row(
                                      children: [
                                        AppText(
                                          "rani123  ",
                                          size: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTextColor,
                                        ),
                                        CircleAvatar(
                                          radius: 7,
                                          backgroundImage: AssetImage(
                                              "assets/images/profile.png"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizeBoxHeight16(),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "Trending Location",
                          size: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        AppText(
                          "View All",
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyTextColor,
                        ),
                      ],
                    ),
                  ),
                  const SizeBoxHeight16(),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: trendList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        FeaturedProductsModel tM = trendList[index];
                        return Card(
                          color: AppColors.primaryColor,
                          elevation: 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 114,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AppColors.noColor, width: 0.5)),
                                  child: Image.asset(
                                    tM.productImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizeBoxHeight8(),
                                Row(
                                  children: [
                                    Image.asset(
                                      Constants.locationFieldIcon,
                                      height: 16,
                                      width: 16,
                                    ),
                                    AppText(
                                      tM.productName,
                                      size: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyTextColor,
                                    ),
                                  ],
                                ),
                                const SizeBoxHeight8(),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Constants.redFavourite,
                                      height: 16,
                                      width: 16,
                                    ),
                                    AppText(
                                      tM.productPrice,
                                      size: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyTextColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
