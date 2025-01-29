
import 'package:compareapp/Models/post_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/api_service.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';



class SmallBusinessScreen extends StatefulWidget {
  const SmallBusinessScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SmallBusinessState();
  }
}

class SmallBusinessState extends State<SmallBusinessScreen> {
  late ApiService apiService;
  List<PostModel> postList = [


  ];
  bool isLoading = true;

  final PageController _pageController = PageController();
  Future<void> fetchDeals() async {
    setState(() {

      isLoading=true;
    });
    List<PostModel> data = await apiService.getSmallBusiness();

    setState(() {
      postList.addAll(data);
      isLoading=false;
    });
  }
  void initState() {
    super.initState();
    // TODO: implement initState
    apiService = ApiService(context);
    fetchDeals();

  }


  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarBack(
        appBar: AppBar(),
        title: "Small Business",
      ),
      body:SafeArea(
        child:   isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: AppColors.appBlueColor,
          ),
        ):postList.isEmpty
            ? const Center(child:   AppText(
          "No Products Found",
          size: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.greyTextColor,
        ),): ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: postList.length,
          addRepaintBoundaries: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            PostModel pM = postList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  side: const BorderSide(
                    color: AppColors.primaryColor, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 199, // Adjust height as needed
                      child:Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.noColor,
                                width: 0.5)),
                        child:pM.type=="image" ?Image.network(
                          pM.postImage,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/dummy_store.png",
                              fit: BoxFit.cover,
                            );
                          },
                        ):const SizedBox(),


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
                    const SizeBoxHeight8(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          pM.webLink!=''?
                          GestureDetector(
                            onTap: () => _launchUrl(pM.webLink ?? ''),
                            child: SvgPicture.asset(
                              Constants.openWebButton,
                            ),
                          ):const SizedBox(),
                          Row(
                            children: [
                              pM.fbLink!=''?
                              GestureDetector(
                                onTap: () =>
                                    _launchUrl(pM.fbLink ?? ''),
                                child: Image.asset(
                                  Constants.facebookIcon,
                                ),
                              ):const SizedBox(),
                              const SizeBoxWidth8(),
                              pM.googleLink==''?
                              const SizedBox():GestureDetector(
                                onTap: () =>
                                    _launchUrl(pM.googleLink ?? ''),
                                child: Image.asset(
                                  width: 25,
                                  height: 25,

                                  Constants.instaIcon,
                                ),
                              ),
                              const SizeBoxWidth8(),
                              pM.twitterLink!=''?
                              GestureDetector(
                                onTap: () =>
                                    _launchUrl(pM.twitterLink ?? ''),
                                child: Image.asset(
                                  Constants.twitterIcon,
                                ),
                              ):const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizeBoxHeight8(),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
