import 'package:compareapp/Models/super_market_products_model.dart';
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }


}
class SearchState extends State<SearchScreen>{
  List<SuperMarketProductsModel> superMarkerProductList = [];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor:AppColors.primaryColor,
        elevation: 1,
        title: AppText(
            "Search Products",
          size: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.black,

        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,

          //change your color here
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
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
            ),
          ],
        ),
      ),
    );
  }

}