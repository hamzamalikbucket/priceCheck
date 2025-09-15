import 'package:compareapp/Models/post_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/api_service.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class TodayDealScreen extends StatefulWidget {
  const TodayDealScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DealState();
  }
}

class DealState extends State<TodayDealScreen> {
  late ApiService apiService;
  List<PostModel> postList = [];
  bool isLoading = true;
  VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(
    'https://stagging.infolytics.tech/public/deal_img/1734413415.mp4',
  ));

  final PageController _pageController = PageController();
  Future<void> fetchDeals() async {
    setState(() {
      isLoading = true;
    });
    List<PostModel> data = await apiService.getDeals();


    setState(() {
      postList.addAll(data);

      isLoading = false;
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
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor:AppColors.primaryColor,
        elevation: 1,
        title: const AppText(
          "Today's Deal",
          size: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.black,

        ),
        centerTitle: true,
        automaticallyImplyLeading: false,),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.appBlueColor,
                ),
              )
            : postList.isEmpty
                ? const Center(
                    child: AppText(
                      "No Products Found",
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyTextColor,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: postList.length,
                    addRepaintBoundaries: true,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      PostModel pM = postList[index];
                      if (defaultTargetPlatform == TargetPlatform.android) {
                        controller = VideoPlayerController.contentUri(
                            Uri.parse(pM.postImage));

                      } else {
                        controller = VideoPlayerController.networkUrl(Uri.parse(
                            pM.postImage)); // Use a fallback for other platforms
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
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
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AppColors.noColor,
                                          width: 0.5)),
                                  child: pM.type == "image"
                                      ? Image.network(
                                          pM.postImage,
                                          fit: BoxFit.fitHeight,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/dummy_store.png",
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                      :FutureBuilder(
                                    future: controller.initialize(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                controller.play();
                                return AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text(
                                    'Error loading video',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
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
