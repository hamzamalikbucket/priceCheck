import 'package:compareapp/Models/comparison_list_model.dart';
import 'package:compareapp/Models/grocery_products_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/api_service.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/cart_manager.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:compareapp/resources/widgets/Toolbar.dart';
import 'package:compareapp/resources/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return GroceryState();
  }
}

class GroceryState extends State<GroceryListScreen> {
  List<GroceryProductsModel> groceryList = [];
  List<GroceryProductsModel> cartList = [];
  Map<String, List<ComparisonListModel>> suggestedMap =
      {}; // Map to hold suggestions per product
  late ApiService apiService;
  final CartManager cartManager = CartManager();
  bool isLoading = true;
  bool hasFetchedSuggestions = false;
  ScrollController? _scrollController;
  String? selectedVendorName;
  Map<String, String> selectedVendors = {};
  @override
  void initState() {
    super.initState();
    apiService = ApiService(context);
    groceryList = CartManager().getCartItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Load grocery list and fetch supermarket list when dependencies change
    if (groceryList.isEmpty) {
      _loadGroceryList();
    }
    if (!hasFetchedSuggestions && groceryList.isNotEmpty) {
      _onCartChange(); // Fetch suggestions if not already fetched
    }
  }

  @override
  void didUpdateWidget(covariant GroceryListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!hasFetchedSuggestions) {
      _onCartChange(); // Ensure suggestions are fetched on tab revisit
    }
  }

  Future<void> fetchSuggestedComparison(String productId) async {
    try {
      print("Fetching suggestions...");
      await Future.delayed(const Duration(seconds: 5)); // Simulate delay
      dynamic data = await apiService.getSuggestedProductList(productId);
      if (data != null) {
        setState(() {
          suggestedMap[productId] =
              data; // Save the suggestions for the product
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching products: $e");
    }
  }

  void _onCartChange() {
    print("Testing Fetching suggestions...");
    if (cartManager.cartItems.isNotEmpty && !hasFetchedSuggestions) {
      for (var product in cartManager.cartItems) {
        // Only fetch suggestions if they haven't been fetched before
        if (!suggestedMap.containsKey(product.productId)) {
          print("Fetching suggestions for Product ID: " + product.productId);
          try {
            fetchSuggestedComparison(product.productId);
          } catch (e) {
            print(
                "Error fetching comparison for Product ID ${product.productId}: $e");
          }
        }
      }
      setState(() {
        hasFetchedSuggestions = true; // Mark as fetched
      });
    }
  }

  void _loadGroceryList() {
    print("Testing Loading grocery list...");
    setState(() {
      groceryList = cartManager.getCartItems();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        double.parse(cartManager.getTotalPrice().toStringAsFixed(2));

    return Scaffold(
      key: const PageStorageKey('GroceryList'),
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 1,
        title: const AppText(
          "Grocery List",
          size: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadGroceryList();
          _onCartChange();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppHeadings(
                        'Grocery List',
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                      AppText(
                        'Grocery Total: \$ ${totalPrice.toStringAsFixed(2)}',
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  const SizeBoxHeight8(),
                  const AppText(
                    'Product',
                    size: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  const Divider(),
                  SizedBox(
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.appBlueColor,
                            ),
                          )
                        : groceryList.isEmpty
                            ? const Center(
                                child: AppText(
                                  "No items in the grocery list",
                                  size: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyTextColor,
                                ),
                              )
                            : ListView.builder(
                                itemCount: groceryList.length,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  GroceryProductsModel tM = groceryList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Card(
                                              child: Container(
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.noColor,
                                                        width: 0.5)),
                                                child: Image.network(
                                                  tM.productImg,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                      "assets/images/dummy_store.png",
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizeBoxHeight8(),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7.7),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizeBoxHeight8(),
                                                    AppText(
                                                      tM.productName,
                                                      size: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                    ),
                                                    const SizeBoxHeight8(),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 31,
                                                          width: 84,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .appBlueColor,
                                                            border: Border.all(
                                                                width: 1,
                                                                color: AppColors
                                                                    .appBlueColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7.7),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              tM.quantity == 1
                                                                  ? const SizedBox()
                                                                  : GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          tM.quantity -=
                                                                              1;
                                                                        });
                                                                      },
                                                                      child:
                                                                          const AppText(
                                                                        "-",
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        size:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                              Container(
                                                                height: 40,
                                                                width: 29,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: AppColors
                                                                          .appBlueColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7.7),
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    AppText(
                                                                      tM.quantity
                                                                          .toString(),
                                                                      color: AppColors
                                                                          .appBlueColor,
                                                                      size: 18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    tM.quantity +=
                                                                        1;
                                                                  });
                                                                },
                                                                child:
                                                                    const AppText(
                                                                  "+",
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  size: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: SvgPicture
                                                              .asset(Constants
                                                                  .deleteButton),
                                                          onPressed: () {
                                                            if (mounted) {
                                                              setState(() {
                                                                CartManager()
                                                                    .cartList
                                                                    .removeAt(
                                                                        index);
                                                                groceryList =
                                                                    cartManager
                                                                        .getCartItems();
                                                              });
                                                            }
                                                          },
                                                        ),
                                                        const SizeBoxWidth8(),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              AppText(
                                                                "\$ ${tM.productPrice}",
                                                                size: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .appBlueColor,
                                                              ),
                                                              AppText(
                                                                tM.martName,
                                                                size: 9.5,
                                                                underline: true,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .appBlueColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizeBoxHeight8(),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        isLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      color: AppColors.appBlueColor,
                                                    ),
                                              )
                                            : suggestedMap.containsKey(
                                                        tM.productId) &&
                                                    suggestedMap[
                                                            tM.productId] !=
                                                        null &&
                                                    suggestedMap[tM.productId]!
                                                        .isNotEmpty
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        child: ListView.builder(
                                                          itemCount: suggestedMap[
                                                                  tM.productId]!
                                                              .length,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          physics:
                                                              const AlwaysScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            ComparisonListModel
                                                                cM =
                                                                suggestedMap[tM
                                                                        .productId]![
                                                                    index];
                                                            bool isSelected =
                                                                selectedVendors[
                                                                        tM.productId] ==
                                                                    cM.vendorName;

                                                            return Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        selectedVendors[
                                                                            tM
                                                                                .productId] = cM
                                                                            .vendorName;
                                                                        tM.productPrice =
                                                                            cM.vendorPrice;
                                                                        tM.martName =
                                                                            cM.vendorName;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: isSelected
                                                                            ? AppColors.yellowColor // Green color for selected
                                                                            : AppColors.primaryColor,
                                                                        border:
                                                                            Border.all(
                                                                          width:
                                                                              0.5,
                                                                          color:
                                                                              AppColors.greyColor,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(7.7),
                                                                      ),
                                                                      child:
                                                                          GestureDetector(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  AppText(
                                                                                    cM.vendorName,
                                                                                    size: 12,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    color: AppColors.black,
                                                                                  ),
                                                                                  const SizeBoxHeight12(),
                                                                                  AppText(
                                                                                    "\$${cM.vendorPrice}",
                                                                                    size: 16,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    color: AppColors.appBlueColor,
                                                                                  ),
                                                                                  const Divider(
                                                                                    thickness: 2,
                                                                                    color: AppColors.black,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : const Center(
                                                    child: AppText(
                                                      "Fetching.....No suggestions yet",
                                                      size: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .greyTextColor,
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                  const SizeBoxHeight8(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
