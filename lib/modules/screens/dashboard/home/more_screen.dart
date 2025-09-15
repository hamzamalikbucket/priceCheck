import 'package:compareapp/Models/live_user_model.dart';

import 'package:compareapp/modules/screens/auth/login_screen.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../resources/utils/cart_manager.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MoreState();
  }
}

class MoreState extends State<MoreScreen> {
  bool unKnown = false;
  bool all = true;
  bool unRead = false;
  List<LiveUserModel> searchableList = [];

/*  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }*/

  Future<void> _launchAsInAppWebViewWithCustomHeaders(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize searchableList with the full userList
  }

  @override
  Widget build(BuildContext context) {
    // Sort the searchableList alphabetically by name

    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.primaryColor,
        elevation: 1,
        title: const AppText(
          "More",
          size: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.black,

        ),
        centerTitle: true,
        automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal list for stories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.appBlueColor,
                  backgroundImage:
                      AssetImage('assets/images/profilecircle.png'),

                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:5.0,right:5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          Constants.userName,
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          justifyText: true,
                        ),
                        AppText(
                          Constants.userEmail,
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          justifyText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                AppGradiantButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/EditProfile');
                  },
                  height: 35,
                  width: 83,
                  btnTextSize: 16,
                  btnText: "Edit",

                ),
              ],
            ),
            const SizeBoxHeight32(),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                side: const BorderSide(
                  color: AppColors.primaryColor, // Border color
                  width: 1, // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      "Resources",
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      justifyText: true,
                    ),
                    const SizeBoxHeight12(),
                    GestureDetector(
                      onTap: () => _launchAsInAppWebViewWithCustomHeaders(
                          Uri.parse(Constants.smallBusinessUrl)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.docIcon,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: AppText(
                                    "Small Businesses",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTextColor,
                                    justifyText: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColors.greyTextColor,
                          ),
                        ],
                      ),
                    ),
                    const SizeBoxHeight12(),
                    GestureDetector(
                      onTap: () => _launchAsInAppWebViewWithCustomHeaders(
                          Uri.parse(Constants.aboutUrl)),

                      //_launchUrl(Constants.aboutUrl),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.docIcon,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: AppText(
                                    "About Us",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTextColor,
                                    justifyText: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColors.greyTextColor,
                          ),
                        ],
                      ),
                    ),
                    const SizeBoxHeight12(),
                    GestureDetector(
                      onTap: () => _launchAsInAppWebViewWithCustomHeaders(
                          Uri.parse(Constants.helpUrl)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.docIcon,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: AppText(
                                    "Help Us Improve",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTextColor,
                                    justifyText: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.greyTextColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizeBoxHeight32(),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                side: const BorderSide(
                  color: AppColors.primaryColor, // Border color
                  width: 1, // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      "Other",
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      justifyText: true,
                    ),
                    const SizeBoxHeight12(),
                    GestureDetector(
                      onTap: () => _launchAsInAppWebViewWithCustomHeaders(
                          Uri.parse(Constants.termUrl)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.otherIcon,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: AppText(
                                    "Terms & Conditions",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTextColor,
                                    justifyText: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColors.greyTextColor,
                          ),
                        ],
                      ),
                    ),
                    const SizeBoxHeight12(),
                    GestureDetector(
                      onTap: () => _launchAsInAppWebViewWithCustomHeaders(
                          Uri.parse(Constants.privacyUrl)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Constants.otherIcon,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: AppText(
                                    "Privacy Policy",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTextColor,
                                    justifyText: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColors.greyTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizeBoxHeight32(),

            GestureDetector(
              onTap: () {
                setState(() {
                  Constants.verifiedViaPhone=false;
                });
                clearLoginState();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: SvgPicture.asset(
                Constants.logOutBtn,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> clearLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    CartManager().cartList.clear();
  }
}
/*   Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                              color: AppColors.noColor, width: 0.5)),
                                      child: Image.network(
                                        tM.productImg,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/dummy_store.png",
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizeBoxHeight8(),
                                  Padding(
                                    padding: const EdgeInsets.all(7.7),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizeBoxHeight8(),
                                        AppText(
                                          tM.productName,
                                          size: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                        const SizeBoxHeight8(),


                                        Row(
                                          children: [
                                           Container(

                                             height: 31,
                                             width: 84,
                                             decoration: BoxDecoration(
                                               color: AppColors.appBlueColor,
                                               border: Border.all(width: 1, color:  AppColors.appBlueColor),
                                               borderRadius: BorderRadius.circular(7.7),
                                             ),
                                             child :Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                               children: [
                                                tM.quantity==1?SizedBox():GestureDetector(
                                                  onTap:(){
                                                    setState(() {
                                                      tM.quantity -= 1;
                                                    });

                                                  },

                                                  child: AppText("-",color: AppColors.primaryColor,
                                                    size: 20, fontWeight: FontWeight.w500,),
                                                ),
                                                 Container(

                                                     height: 40,
                                                     width: 29,
                                                     decoration: BoxDecoration(
                                                       color: AppColors.primaryColor,
                                                       border: Border.all(width: 1, color:  AppColors.appBlueColor),
                                                       borderRadius: BorderRadius.circular(7.7),
                                                     ),
                                                     child :Column(
                                                       crossAxisAlignment: CrossAxisAlignment.center,

                                                       children: [
                                                         AppText(tM.quantity.toString(),color: AppColors.appBlueColor,
                                                           size: 18, fontWeight: FontWeight.w500,),

                                                       ],


                                                     )


                                                 ),
                                                 GestureDetector(
                                                   onTap:(){
                                                     setState(() {
                                                       tM.quantity += 1;
                                                     });

                                                   },

                                                   child: AppText("+",color: AppColors.primaryColor,
                                                   size: 20, fontWeight: FontWeight.w500,),
                                                 ),
                                               ],


                                             )


                                           ),

                                            IconButton(
                                              icon: SvgPicture.asset(
                                                Constants.deleteButton,
                                              ),
                                              onPressed: () {
                                                if (mounted) {
                                                  setState(() {
                                                    // Remove product if quantity is 1
                                                    CartManager().cartList.removeAt(index);
                                                    groceryList = cartManager.getCartItems();
                                                  });
                                                }
                                              },
                                            ),

                                            const SizeBoxWidth8(),
                                            Column(
                                              children: [
                                                AppText(
                                                  "\$ ${tM.productPrice}",
                                                  size: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.appBlueColor,
                                                ),
                                                AppText(
                                                  tM.martName,
                                                  size: 10,
                                                  underline: true,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.appBlueColor,
                                                ),
                                              ],
                                            ),

                                            const SizeBoxHeight8(),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),*/
