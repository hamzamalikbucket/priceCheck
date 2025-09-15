import 'package:compareapp/Models/comparison_list_model.dart';
import 'package:compareapp/Models/featured_produtcs_model.dart';
import 'package:compareapp/Models/grocery_products_model.dart';
import 'package:compareapp/Models/products_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/api_service.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/cart_manager.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailState();
  }
}

class DetailState extends State<ShopDetailScreen> {
  late dynamic shopmodel;
  bool hasFetchedData = false;
  bool isLoading = true;
  late ApiService apiService;




  List<ComparisonListModel> suggestedList = [];
  void initState() {
    super.initState();
    // TODO: implement initState
    apiService = ApiService(context);
    setState(() {
      isLoading = true;
    });

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!hasFetchedData) {

      final arguments =ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (arguments != null) {
        final id = arguments['id'] ?? '';
        fetchSuggestedComparison(id);


      } else {
        setState(() {
          isLoading = false; // No API call required
        });
      }
    }
  }
  Future<void> fetchSuggestedComparison(String productId) async {
    try {

      dynamic data = await apiService.getSuggestedProductList(productId);

      setState(() {
        suggestedList.clear();
        isLoading = false;
        suggestedList.addAll(data);

      });

    } catch (e) {
      isLoading = false;
      print("Error fetching products: $e");
    }
  }
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
  Widget build(BuildContext context) {
    final arguments =ModalRoute.of(context)?.settings.arguments as dynamic?;
    final id = arguments['id'] ?? '';
    final image = arguments['image'] ?? '';
    final price = arguments['price'] ?? '';
    final name = arguments['name'] ?? '';

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            automaticallyImplyLeading: true,
            centerTitle: true,
            elevation: 1,
            iconTheme: const IconThemeData(
              color: AppColors.black,

              //change your color here
            ),
            title: const AppText(
              "Product Details",
              size: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  Constants.flagIcon, // Path to your SVG file
                  height: 32, // You can adjust the size
                  width: 32,
                  // Adjust color as needed
                ),
                onPressed: () {
                  _launchAsInAppWebViewWithCustomHeaders(
                      Uri.parse(Constants.helpUrl));


                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  Constants.shareDetail, // Path to your SVG file
                  height: 32, // You can adjust the size
                  width: 32,
                  // Adjust color as needed
                ),
                onPressed: () {
                  // Define the content to be shared
                  String content = "Check out this amazing product${Constants.stagingUrl}"+id;

                  // Trigger the share functionality
                  Share.share(content, subject: "Amazing Product");

                },
              ),
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 307,
                  height: 269,
                  child: Image.network(
                   image,
                    fit: BoxFit.fill,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/dummy_store.png",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizeBoxHeight4(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(65),
                      topRight: Radius.circular(65),
                    ),
                    border:
                        Border.all(color: AppColors.greyBgColor, width: 0.3),
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppText(
                                  name,
                                  size: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizeBoxHeight4(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                "\$$price",
                                size: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.appBlueColor,
                              ),
                              GestureDetector(

                                onTap:(){

                                  // Manually map the fields
                                  final groceryProduct = GroceryProductsModel(
                                    productId: id,
                                    productName: name,
                                    productImg: image,
                                    productPrice:price,
                                    productBrand: "",
                                    martName: "",


                                  );
                                  CartManager().addToCart(groceryProduct);
                                  Navigator.pushNamed(
                                    context,
                                    '/GroceryList',
                                  );
                                },
                                child: SvgPicture.asset(
                                  Constants.cartButton,
                                ),
                              ),
                            ],
                          ),
                          const SizeBoxHeight8(),
                          const Divider(),
                          const SizeBoxHeight8(),
                          const AppText(
                            "Price Comparison",
                            size: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          const SizeBoxHeight8(),
                          isLoading
                              ? const Center(child: CircularProgressIndicator(
                            color: AppColors.appBlueColor,
                          ),)
                              : suggestedList.isEmpty
                              ? const Center(
                            child: AppText(
                              "No Vendor Found For This Product",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyTextColor,
                            ),
                          )
                              : ListView.builder(
                        itemCount: suggestedList.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ComparisonListModel cM = suggestedList[index];
                        return  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.noColor, width: 0.5)),
                              child: Image.network(
                                cM.vendorImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/dummy_store.png",
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            const SizeBoxHeight8(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   AppText(
                                    cM.vendorName,
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                  const SizeBoxHeight12(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "\$ ${cM.vendorPrice}",
                                        size: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.appBlueColor,
                                      ),
                                      const SizeBoxWidth32(),
                                      const SizeBoxWidth32(),
                                      const SizeBoxWidth32(),
                                       AppText(
                                        cM.priceDate,
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.greyTextColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                        }


                      ),

                          const Divider(),
                          const SizeBoxHeight4(),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
