import 'package:compareapp/Models/brands_model.dart';
import 'package:compareapp/Models/categories_product_model.dart';
import 'package:compareapp/Models/grocery_products_model.dart';

import 'package:compareapp/Models/sub_cat_model.dart';
import 'package:compareapp/Models/vendor_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/api_service.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/cart_manager.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/buttons/app_button.dart';
import 'package:compareapp/resources/widgets/buttons/form_drop_down_field.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => ProductState();
}

class ProductState extends State<ProductsListScreen> {
  List<dynamic> productsList = [];
  List<SubCatModel> subCatList = [];
  List<BrandsModel> brandsList = [];
  List<CategoryProductModel> fetchedProducts = [];
  SubCatModel? selectedSubCategoryValue;
  String? selectedSortValue;
  BrandsModel? selectedBrandsValue;
  String? selectedBasketValue;
  String basketValue="Value";
  String sortTag="Value";
  VendorModel? selectedStoreValue;
  bool hasFetchedData = false;
  bool isLoading = true;
  late ApiService apiService;
  List<VendorModel> vendorList = [];

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
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (arguments != null) {
        final category = arguments['type'] ?? 'Default Category';
        final filter = arguments['show filter'] ?? '';
        final conditionCatApi = arguments['is category'] ?? '';
        final searchText = arguments['text'] ?? '';
        final passedProductsList = arguments['productList'] as List<dynamic>?;
        final catCode = arguments['categoryCode'] ?? '';
        final catId = arguments['categoryId'] ?? '';
        final screenType = arguments['type'] ?? '';

        if (screenType == 'Search Products') {
          hasFetchedData = true;
          fetchSearchProducts(searchText); // Fetch products dynamically if needed
        }
        else if (conditionCatApi == 'yes') {
          hasFetchedData = true;
          fetchProducts(category, catCode,catId); // Fetch products dynamically if needed
        } else {
          // Use the passed product list if available
          setState(() {
            isLoading = false;
            productsList = passedProductsList ?? [];
          });
        }
      } else {
        setState(() {
          isLoading = false; // No API call required
        });
      }
    }
  }

  Future<void> fetchProducts(String category, String catCode, String catId) async {
    try {
      final results = await Future.wait([
        apiService.getProductsByCatId(catCode),
        apiService.getSubCategoriesByCatId(catId),
        apiService.getBrands(catCode),
        apiService.getVendors(),
      ]);
      setState(() {
        productsList
          ..clear()
          ..addAll(results[0]);
        subCatList
          ..clear()
          ..add(SubCatModel(subCatName:"All Sub Categories", subCatCode: "null", subCatId: "null"))
          ..addAll(results[1] as Iterable<SubCatModel>);
        brandsList
          ..clear()
          ..add(BrandsModel(brandName:"All Brands",))
          ..addAll(results[2] as Iterable<BrandsModel>);
        vendorList
          ..clear()
          ..add( VendorModel(vendorName:"All Supermarkets", vendorCode: "Value",vendorId:0),)
          ..addAll(results[3] as Iterable<VendorModel>);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching products: $e");
    }
  }
  Future<void> fetchSearchProducts(String searchText) async {
    try {
      final data = await apiService.getSearchProducts(searchText);
      setState(() {
        productsList
          ..clear()
          ..addAll(data);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching products: $e");
    }
  }
  Future<void> fetchFilterProducts(
      String? catId, String? subCatId, String? brandName, String? basketValue,String? sortValue,String? storeId) async {
    try {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      // Call the API service function and fetch the products
      dynamic data = await apiService.getProductsByFilter(catId, subCatId, brandName, basketValue,sortValue,storeId);

      setState(() {
        productsList.clear(); // Clear the existing list
        productsList.addAll(data); // Add the fetched products
        isLoading = false; // Stop loading indicator
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading indicator in case of an error
      });
      print("Error fetching products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    //productsList = ModalRoute.of(context)!.settings.arguments as List<SuperMarketProductsModel>;
    if (arguments is! Map<String, dynamic>) {
      return Scaffold(
          appBar: ToolbarBack(
            appBar: AppBar(),
            title: "Products",
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: GridView.builder(
                      itemCount: productsList.length,
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10, // Space between columns
                        mainAxisSpacing: 10, // Space between rows
                        childAspectRatio:
                            0.52, // Adjust aspect ratio for item height and width
                      ),

                      scrollDirection: Axis.vertical,

                      itemBuilder: (context, index) {
                        dynamic product = productsList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/productDetailsScreen',
                              arguments: product,
                            );
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
                                    height: 170,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.noColor,
                                            width: 0.5)),
                                    child: Image.network(
                                      product.productImg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizeBoxHeight8(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        product.productBrand,
                                        size: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyTextColor,
                                      ),
                                      AppText(
                                        product.productName,
                                        size: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                      const SizeBoxHeight8(),
                                      Row(
                                        children: [
                                          AppText(
                                            product.productPrice,
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
                                          SvgPicture.asset(
                                            Constants.compareButton,
                                          ),
                                          SvgPicture.asset(
                                            Constants.cartButton,
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
                  ),
                  const SizeBoxHeight8(),
                ],
              ),
            ),
          ));
    }
    final category = arguments['type'] ?? 'Default Category';
    final filter = arguments['show filter'] ?? '';
    final id = arguments['categoryId'] ?? '';
    final conditionCatApi = arguments['is category'] ?? '';
    productsList = arguments['productList'] as List<dynamic>;
    final searchText = arguments['text'] ?? '';
    final passedProductsList = arguments['productList'] as List<dynamic>?;
    final catCode = arguments['categoryCode'] ?? '';
    final catId = arguments['categoryId'] ?? '';
    final screenType = arguments['type'] ?? '';

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: filter == 'yes'
          ? AppBar(
              backgroundColor: AppColors.primaryColor,
              automaticallyImplyLeading: true,
              centerTitle: true,
              elevation: 1,
              iconTheme: const IconThemeData(
                color: AppColors.black,

                //change your color here
              ),
              actions: [
                IconButton(
                  icon: SvgPicture.asset(
                    Constants.filterIcon, // Path to your SVG file
                    height: 32, // You can adjust the size
                    width: 32,
                    // Adjust color as needed
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context, // Pass the BuildContext to showDialog
                      barrierDismissible:
                          true, // Allows dismissing the dialog by tapping outside
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius as needed
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizeBoxHeight8(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: SvgPicture.asset(
                                              Constants
                                                  .closeIcon, // Path to your SVG file
                                              height:
                                                  20, // You can adjust the size
                                              width: 20,
                                              // Adjust color as needed
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                selectedSubCategoryValue = null;
                                                selectedSortValue = null;
                                                selectedBrandsValue = null;
                                                selectedBasketValue = null;
                                                selectedStoreValue = null;
                                                basketValue = "Value";
                                                sortTag = "Value";
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                          const AppText(
                                            "Filters",
                                            size: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                          const SizeBoxWidth8(),
                                          const SizeBoxWidth8(),
                                        ],
                                      ),
                                      const SizeBoxHeight16(),
                                      const AppText(
                                        "Sub Category",
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                      const SizeBoxHeight16(),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.containerBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors
                                                        .containerBgColor,
                                                    width: 0.5)),
                                          ),
                                          FormDropDownField<SubCatModel>(
                                            items: subCatList,
                                            hint: "Sub Category",
                                            value: selectedSubCategoryValue,
                                            displayText: (SubCatModel
                                                    subCategory) =>
                                                subCategory
                                                    .subCatName, // Function to get the name to display
                                            onChange: (value) async {
                                              SubCatModel subModel =
                                                  value as SubCatModel;
                                           if(subModel.subCatId=="null"){



                                               List<BrandsModel> brands = await  apiService.getBrands(catCode);
                                               setState(()  {
                                                 brandsList.clear();
                                                 brandsList.add(BrandsModel(brandName: "All Brands"));
                                                 brandsList.addAll(brands);

                                                 selectedSubCategoryValue =
                                                     value;
                                                 selectedBrandsValue=null;
                                                 selectedSubCategoryValue?.subCatCode="";

                                               });

                                              }
                                           else{
                                             List<BrandsModel> brands = await apiService.getBrandsBySubCat(catCode,
                                                 subModel.subCatId);
                                             setState(()  {
                                               brandsList.clear();
                                               brandsList.addAll(brands);

                                               selectedSubCategoryValue =
                                                   value;
                                               selectedBrandsValue=null;

                                             });
                                           }

                                            },
                                          )
                                        ],
                                      ),
                                      const SizeBoxHeight16(),
                                      const AppText(
                                        "Sort By ",
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                      const SizeBoxHeight16(),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.containerBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors
                                                        .containerBgColor,
                                                    width: 0.5)),
                                          ),
                                          FormDropDownField(
                                            items: const [
                                              "Price:Low-High",
                                              "Price:High-Low"
                                            ],
                                            hint: "Sort By",
                                            value: selectedSortValue,
                                            onChange: (value) {
                                              setState(() {
                                                selectedSortValue = value;

                                                if(value=="Price:Low-High"){
                                                  sortTag="low";



                                                }
                                                else{

                                                  sortTag="high";
                                                }
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      const SizeBoxHeight16(),
                                      const AppText(
                                        "Brands",
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                      const SizeBoxHeight16(),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.containerBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors
                                                        .containerBgColor,
                                                    width: 0.5)),
                                          ),

                                          FormDropDownField<BrandsModel>(
                                            items:brandsList,
                                            hint: "Select Brands",
                                            value: selectedBrandsValue,
                                            displayText: (BrandsModel
                                            brands) => brands.brandName,
                                            onChange: (value) {

                                              setState(() {
                                                if (value != null && (value as BrandsModel).brandName == "All Brands") {
                                                  // Keep "All Brands" selected in UI, but set brandName to "" for backend
                                                  selectedBrandsValue = value;
                                                  print(selectedBrandsValue?.brandName.toString());

                                                } else {
                                                  selectedBrandsValue = value;
                                                }
                                              });


                                            },
                                          )
                                        ],
                                      ),
                                      const SizeBoxHeight16(),
                                      const AppText(
                                        "Basket",
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                      const SizeBoxHeight16(),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.containerBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors
                                                        .containerBgColor,
                                                    width: 0.5)),
                                          ),
                                          FormDropDownField(
                                            items: const ["Original Basket", "Compact Basket"],
                                            hint: "Select Basket",
                                            value: selectedBasketValue,

                                            onChange: (value) {
                                              setState(() {

                                              //  selectedBasketValue=value;
                                                selectedBasketValue = value;
                                                if(value=="Compact Basket"){
                                                  basketValue="compact_basket";


                                                  print(basketValue);
                                                }
                                                else{
                                                  basketValue="original_basket";


                                                  print(basketValue);

                                                }

                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      const SizeBoxHeight16(),
                                      const AppText(
                                        "Stores",
                                        size: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                      const SizeBoxHeight16(),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.containerBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors
                                                        .containerBgColor,
                                                    width: 0.5)),
                                          ),
                                          FormDropDownField<VendorModel>(
                                            items: vendorList,
                                            hint: "Select Stores",
                                            value: selectedStoreValue,
                                            displayText: (VendorModel
                                            stores) =>
                                            stores.vendorName,
                                            onChange: (value) {
                                              setState(() {
                                                selectedStoreValue = value;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      const SizeBoxHeight8(),
                                      const SizeBoxHeight8(),
                                      AppGradiantButton(

                                        onTap: () {
                                          print( catCode);
                                          print(selectedSubCategoryValue?.subCatCode.toString());
                                          print(selectedBrandsValue?.brandName.toString());
                                          print(selectedStoreValue?.vendorId.toString());
                                          print( basketValue );

                                          String brandNameToSend = selectedBrandsValue?.brandName == "All Brands" ? "" : selectedBrandsValue?.brandName ?? "";
                                          print( "+>>>>>>>$brandNameToSend" );





                                          fetchFilterProducts(
                                              catCode,
                                              selectedSubCategoryValue?.subCatCode, // Pass sub-category ID
                                              brandNameToSend,    // Pass brand name
                                              basketValue  ,
                                              sortTag,
                                              selectedStoreValue?.vendorId.toString(),

                                            // Pass basket value
                                          );
                                        
                                          Navigator.pop(context);
                                        },
                                        height: 48,
                                        width: MediaQuery.sizeOf(context).width,
                                        btnTextSize: 16,
                                        btnText: "Apply",
                                      ),
                                      const SizeBoxHeight8(),
                                      const SizeBoxHeight8(),
                                      AppGradiantButton(

                                        onTap: () {

                                          setState(() {
                                            selectedSubCategoryValue=null;
                                            selectedSortValue = null;
                                            selectedBrandsValue =  null;
                                            selectedBasketValue = null;
                                            selectedStoreValue = null;
                                            basketValue = "Value";
                                            sortTag = "Value";
                                            isLoading = true;
                                            productsList.clear();
                                          });
                                          fetchProducts(category, catCode,catId);




                                        },
                                        height: 48,
                                        width: MediaQuery.sizeOf(context).width,
                                        btnTextSize: 16,
                                        btnText: "Clear Filters",
                                      ),

                                      // Corrected the typo from SizeBoxHeight16
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
              title: AppText(
                category,
                size: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            )
          : ToolbarBack(
              appBar: AppBar(),
              title: category ?? "Products",
            ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : productsList.isEmpty
              ? const Center(
                  child: AppText(
                    "No Products Found",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyTextColor,
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: GridView.builder(
                            itemCount: productsList.length,
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
                              dynamic product = productsList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/productDetailsScreen',
                                    arguments: {

                                      "id":product.productId,
                                      "image":product.productImg,
                                      "price":product.saleTag?product.salePrice:product.productPrice,
                                      "name":product.productName,

                                    }
                                  );
                                },
                                child: Card(
                                  color: AppColors.primaryColor,
                                  elevation: 0.2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        product.saleTag? Row(
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
                                          height: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: AppColors.noColor,
                                                  width: 0.5)),
                                          child: Image.network(
                                            product.productImg,
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

                                        SizedBox(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                product.productBrand,
                                                size: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyTextColor,
                                              ),
                                              AppText(
                                                product.productName,
                                                size: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black,
                                              ),

                                              const SizeBoxHeight8(),
                                              Row(
                                                children: [
                                                  Text(
                                                    "\$${product.productPrice}",
                                                    style:  TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                      color:product.saleTag? AppColors.redColor: AppColors.black,
                                                      decoration: product.saleTag? TextDecoration.lineThrough:TextDecoration.none,
                                                    ),
                                                  )

                                                ],
                                              ),
                                              const SizeBoxHeight8(),
                                              product.saleTag? Row(
                                                children: [
                                                  AppText(
                                                    "\$${product.salePrice}",
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
                                                    onTap:(){
                                                      // Manually map the fields
                                                      final groceryProduct = GroceryProductsModel(
                                                        productId: product.productId,
                                                        productName: product.productName,
                                                        productImg: product.productImg,
                                                        productPrice: product.productPrice,
                                                        productBrand: product.productBrand,
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
                                            ],
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
                        const SizeBoxHeight4(),
                      ],
                    ),
                  ),
                ),
    );
  }
}
