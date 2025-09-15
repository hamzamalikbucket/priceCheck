import 'dart:convert';
import 'dart:math';

import 'package:compareapp/Models/categroy_model.dart';
import 'package:compareapp/Models/featured_produtcs_model.dart';
import 'package:compareapp/Models/grocery_products_model.dart';


import 'package:compareapp/Models/super_market_products_model.dart';
import 'package:compareapp/Models/vendor_model.dart';
import 'package:compareapp/main.dart';

import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/api_service.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/cart_manager.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/buttons/app_drop_down_button.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';


import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  // Define a PageController
  final PageController _pageController = PageController();
  late String selectedMarketDropDownValueCode = "-1";
  String selectedMarket = "All Supermarkets";
  VendorModel? selectedVendor;
  late ApiService apiService;

// Use a variable to keep track of the current page index
  final int _currentPageIndex = 0;

  List<CategoryModel> categoriesList = [];
  List<VendorModel> vendorList = [];
  List<FeaturedProductsModel> featuredProductList = [];
  List<SuperMarketProductsModel> superMarkerProductList = [];
  Future<void> fetchVendors() async {
    List<VendorModel> data = await apiService.getVendors();
    setState(() {
      vendorList.clear();
      vendorList.add(
        VendorModel(vendorName: "All Supermarkets", vendorCode: "-1", vendorId: -1),
      );
      vendorList.addAll(data);
    });
  }

  Future<void> fetchCategories() async {
    setState(() {
      isLoading = true;
    });
    List<CategoryModel> data = await apiService.getCategories();

    setState(() {
      categoriesList.addAll(data);
      isLoading = false;
    });
  }

  Future<void> fetchAllProducts() async {
    setState(() {
      isProductLoading = true;
    });
    List<SuperMarketProductsModel> data = await apiService.getProducts();
    setState(() {
      superMarkerProductList.clear();
      superMarkerProductList.addAll(data);
      isProductLoading = false;
    });
  }

  Future<void> fetchFeaturedProducts() async {
    setState(() {
      isLoading = true;
    });
    List<FeaturedProductsModel> data = await apiService.getFeaturedProducts();
    setState(() {
      featuredProductList.clear();
      featuredProductList.addAll(data);
      isLoading = false;
    });
  }

  bool isLoading = true;
  bool isProductLoading = true;

  void initState() {
    super.initState();
    // TODO: implement initState
    apiService = ApiService(context);
    fetchCategories();
    fetchVendors();
    fetchFeaturedProducts();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:15.0),
                child: AppText(
                  'Welcome Back,',
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightgreyColor,
                ),
              ),
              const SizeBoxHeight4(),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: AppHeadings(
                  Constants.userName,
                  size: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const SizeBoxHeight8(),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  side: const BorderSide(
                    color: AppColors.primaryColor, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0), // Optional padding
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Search for product or brand',
                      hintStyle: const TextStyle(
                        color: AppColors.greyHintColor,
                        fontSize: 14,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/AllProductsScreen',
                            arguments: {
                              'type': "Search Products",
                              "text": searchController.text.toString(),
                              "is category": 'no',
                              'show filter': 'no',
                              'productList': superMarkerProductList,

                              /* 'type': pM.catName,
                              'show filter': 'yes',
                              'productList': superMarkerProductList,

                              "categoryId":pM.catCode.toString(),*/
                            },
                          );
                          searchController.clear();
                        },
                        child: const ImageIcon(
                          color: AppColors.appBlueColor,
                          AssetImage(Constants.search),
                        ),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizeBoxHeight16(),
              const AppText(
                " Product Categories",
                size: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              const SizeBoxHeight4(),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.appBlueColor,
                      ),
                    )
                  : SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: categoriesList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          CategoryModel pM = categoriesList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/AllProductsScreen',
                                arguments: {
                                  'type': pM.catName,
                                  'show filter': 'yes',
                                  'productList': superMarkerProductList,
                                  "is category": 'yes',
                                  "categoryCode": pM.catCode.toString(),
                                  "categoryId": pM.catId.toString(),
                                },
                              ).then((onValue) {
                                initState();
                              });
                            },
                            child: Card(
                              elevation: 5,
                              shadowColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // Rounded corners
                                side: const BorderSide(
                                  color: AppColors.greyBgColor, // Border color
                                  width: 0.2, // Border width
                                ),
                              ),
                              child: SizedBox(
                                width: 125,
                                child: Column(
                                  children: [
                                    const SizeBoxHeight8(),
                                    const SizeBoxHeight8(),
                                    const SizeBoxHeight8(),
                                    Container(
                                      height: 58,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightBgColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: AppColors.noColor,
                                              width: 0.5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                Constants.categoryImageBaseUrl +
                                                    pM.catIcon,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppText(
                                          pM.catName,
                                          size: 15,
                                          fontWeight: FontWeight.w500,
                                          alignText: true,
                                          color: AppColors.greyTextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              const SizeBoxHeight16(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      "Featured Products",
                      size: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        final arguments = {'category': 'Featured Products'};
                        print('Navigating with arguments: $arguments');
                        Navigator.pushNamed(
                          context,
                          '/AllProductsScreen',
                          arguments: {
                            'type': 'Featured Products',
                            'show filter': 'no',
                            'productList': featuredProductList,
                            "is category": 'no',
                          },
                        );
                      },
                      child: const AppText(
                        "View All",
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizeBoxHeight16(),

              //Featured list
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.appBlueColor,
                      ),
                    )
                  : featuredProductList.isNotEmpty?  SizedBox(
                      height: 320,
                      child: ListView.builder(
                        itemCount: featuredProductList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          FeaturedProductsModel tM = featuredProductList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/productDetailsScreen',
                                  arguments: {
                                    "id": tM.productId,
                                    "image": tM.productImg,
                                    "price": tM.productPrice,
                                    "name": tM.productName,
                                  });
                            },
                            child: Card(
                              color: AppColors.primaryColor,
                              elevation: 0.2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 170,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: AppColors.noColor,
                                              width: 0.5)),
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
                                    const SizeBoxHeight8(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          tM.productBrand,
                                          size: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTextColor,
                                        ),
                                        AppText(
                                          tM.productName,
                                          size: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                        const SizeBoxHeight8(),
                                        Row(
                                          children: [
                                            AppText(
                                              "\$${tM.productPrice}",
                                              size: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ),
                                        const SizeBoxHeight8(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    '/productDetailsScreen',
                                                    arguments: {
                                                      "id": tM.productId,
                                                      "image": tM.productImg,
                                                      "price": tM.productPrice,
                                                      "name": tM.productName,
                                                    });
                                              },
                                              child: SvgPicture.asset(
                                                Constants.compareButton,
                                              ),
                                            ),
                                            const SizeBoxWidth16(),
                                            GestureDetector(
                                              onTap: () {


                                                // Manually map the fields
                                                final groceryProduct = GroceryProductsModel(
                                                  productId: tM.productId,
                                                  productName: tM.productName,
                                                  productImg: tM.productImg,
                                                  productPrice: tM.productPrice,
                                                  productBrand: tM.productBrand,
                                                  martName: '',


                                                );
                                                CartManager().addToCart(groceryProduct);
                                                Navigator.pushNamed(
                                                    context,
                                                    '/GroceryList',
                                                  );






                                               //MyApp.cart.addToCart(cartModel: CartModel(productId: tM.productId, productName: tM.productName, variants: [], productDetails: ""));
                                                },


                                              child: SvgPicture.asset(
                                                Constants.cartButton,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ): const Center(
                child: AppText(
                  "No Product Found",
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyTextColor,
                ),
              ),
              const SizeBoxHeight16(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            "Showing Products from",
                            size: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.appBlueColor,
                          ),
                          AppText(
                            selectedMarket,
                            size: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.appBlueColor,
                          ),
                        ],
                      ),
                    ),
                    /*SvgPicture.asset(
                      Constants.sortIcon,
                    ),*/
                    SizedBox(
                        width: 140,
                        child: AppDropDownFields<VendorModel>(
                          items: vendorList,
                          hint: "Select SuperMarket",
                          value: selectedVendor,
                          onChange: (value) async {
                            if (value != null) {
                              print("Selected Vendor Name: ${value.vendorName}");

                              setState(() {
                                selectedVendor = value;
                                selectedMarketDropDownValueCode =
                                    value.vendorCode;
                                selectedMarket = value.vendorName;
                                isProductLoading = true;

                                print("Selected Vendor Code: ${selectedMarketDropDownValueCode}");
                                superMarkerProductList.clear();
                                featuredProductList.clear();
                              });
                              if( selectedMarketDropDownValueCode == "-1") {
                                // If "All Supermarkets" is selected, fetch all products
                                List<SuperMarketProductsModel> data =
                                    await apiService.getProducts();
                                List<FeaturedProductsModel> featData = await apiService.getFeaturedProducts();
                                setState(() {
                                  superMarkerProductList.addAll(data);
                                  featuredProductList.addAll(featData);
                                  isProductLoading = false;
                                });
                              } else {
                                // Fetch products for the selected vendor

                              List<SuperMarketProductsModel> data =
                                  await apiService.getProductsbyVendorsCode(
                                      selectedMarketDropDownValueCode);
                              List<FeaturedProductsModel> featureData =
                              await apiService.getFeaturedProductsbyVendorsCode(
                                  selectedMarketDropDownValueCode);
                              setState(() {
                                superMarkerProductList.addAll(data);
                                featuredProductList.addAll(featureData);
                                isProductLoading = false;
                              });
                            }
                          }
                        }))
                  ],
                ),
              ),
              const SizeBoxHeight16(),
              SizedBox(
                child: isProductLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.appBlueColor,
                        ),
                      )
                    : superMarkerProductList.isNotEmpty
                        ? GridView.builder(
                            itemCount: min(superMarkerProductList.length, 8),
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 6, // Space between columns
                              mainAxisSpacing: 30, // Space between rows
                              childAspectRatio:
                                  0.45, // Adjust aspect ratio for item height and width
                            ),

                            scrollDirection: Axis.vertical,

                            itemBuilder: (context, index) {
                              SuperMarketProductsModel sMp =
                                  superMarkerProductList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/productDetailsScreen',
                                      arguments: {
                                        "id": sMp.productId,
                                        "image": sMp.productImg,
                                        "price": sMp.saleTag?sMp.salePrice:sMp.productPrice,
                                        "name": sMp.productName,
                                      });
                                },
                                child: Card(
                                  color: AppColors.primaryColor,
                                  elevation: 0.2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                       sMp.saleTag? Row(
                                         children: [
                                           Container(
                                             width: 30,
                                             color: AppColors.greenColor,
                                             child: const Center(
                                               child: AppText(
                                                 "Sale",
                                                 size: 12,
                                                 fontWeight: FontWeight.w400,
                                                 color: AppColors.appBarBackgroundColor,
                                               ),
                                             ),
                                           ),
                                         ],
                                       ): const SizedBox(),
                                        Container(
                                          width: 170,
                                          height: 195,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: AppColors.noColor,
                                                  width: 0.5)),
                                          child: Image.network(
                                            sMp.productImg,
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
                                        const SizeBoxHeight8(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              sMp.productBrand,
                                              size: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.greyTextColor,
                                            ),
                                            AppText(
                                              sMp.productName,
                                              size: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                            ),
                                            const SizeBoxHeight8(),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$${sMp.productPrice}",
                                                  style:  TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color:sMp.saleTag? AppColors.redColor: AppColors.black,
                                                    decoration: sMp.saleTag? TextDecoration.lineThrough:TextDecoration.none,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizeBoxHeight8(),
                                            sMp.saleTag? Row(
                                              children: [
                                                AppText(
                                                  "\$${sMp.salePrice}",
                                                  size: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ],
                                            ):const SizedBox(),
                                            const SizeBoxHeight8(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  Constants.compareButton,
                                                ),
                                                const SizeBoxWidth4(),
                                                GestureDetector(
                                                  onTap: () {


                                                    // Manually map the fields
                                                    final groceryProduct = GroceryProductsModel(
                                                      productId: sMp.productId,
                                                      productName: sMp.productName,
                                                      productImg: sMp.productImg,
                                                      productPrice: sMp.productPrice,
                                                      productBrand: sMp.productBrand,
                                                      martName: selectedMarket,


                                                    );
                                                    CartManager().addToCart(groceryProduct);
                                                    Navigator.pushNamed(
                                                      context,
                                                      '/GroceryList',
                                                    );






                                                    //MyApp.cart.addToCart(cartModel: CartModel(productId: tM.productId, productName: tM.productName, variants: [], productDetails: ""));
                                                  },
                                                  child: SvgPicture.asset(
                                                    Constants.cartButton,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: AppText(
                              "No Product Found",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyTextColor,
                            ),
                          ),
              ),
              const SizeBoxHeight8(),
              Padding(
                padding: const EdgeInsets.only(top: 25.00, bottom: 20.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/AllProductsScreen',
                        arguments: {
                          'type': 'Products',
                          'show filter': 'no',
                          'productList': superMarkerProductList,
                          "is category": 'no',
                        },
                      );
                    },
                    child: Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.appBlueColor, width: 1)),
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              'View All',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.appBlueColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizeBoxHeight4(),
            ],
          ),
        ),
      ),
    );
  }

}
