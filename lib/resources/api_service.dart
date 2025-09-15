import 'dart:convert';
import 'package:compareapp/Models/brands_model.dart';
import 'package:compareapp/Models/categories_product_model.dart';
import 'package:compareapp/Models/categroy_model.dart';
import 'package:compareapp/Models/comparison_list_model.dart';
import 'package:compareapp/Models/featured_produtcs_model.dart';
import 'package:compareapp/Models/post_model.dart';
import 'package:compareapp/Models/sub_cat_model.dart';
import 'package:compareapp/Models/super_market_products_model.dart';
import 'package:compareapp/Models/vendor_model.dart';
import 'package:compareapp/resources/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final BuildContext context;

  ApiService(this.context);

  Future<List<VendorModel>> getVendors() async {
    var url = Uri.parse('${Constants.baseUrl}vendor');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => VendorModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<FeaturedProductsModel>> getFeaturedProducts() async {
    var url = Uri.parse('${Constants.baseUrl}featureProduct');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => FeaturedProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    var url = Uri.parse('${Constants.baseUrl}category');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        dynamic baseUrl = body["baseurl"];
        return (

            body['data'] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<PostModel>> getDeals() async {
    var url = Uri.parse('${Constants.baseUrl}deals');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => PostModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<PostModel>> getSmallBusiness() async {
    var url = Uri.parse('${Constants.baseUrl}business');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => PostModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<SuperMarketProductsModel>> getProducts() async {
    String endpoint = "products";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
          print(body);
        return (body['data'] as List)
            .map((item) => SuperMarketProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<BrandsModel>> getBrands(String catCode) async {
    String endpoint = "brand/$catCode";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => BrandsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }
  Future<List<BrandsModel>> getBrandsBySubCat(String catCode,String subCatId) async {
    String endpoint = "brand/$catCode?sub_category_id=$subCatId";
    print(endpoint);
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => BrandsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<SuperMarketProductsModel>> getProductsbyVendorsCode(String vendorId) async {
    String endpoint = "products?vendor_id=$vendorId";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        print(body);

        return (body['data'] as List)
            .map((item) => SuperMarketProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }
  Future<List<FeaturedProductsModel>> getFeaturedProductsbyVendorsCode(String vendorId) async {
    String endpoint = "featureProduct?vendor_id=$vendorId";

    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => FeaturedProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<SuperMarketProductsModel>> getProductsByCatId(String catId) async {
    String endpoint = "products/category?category_id=$catId";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => SuperMarketProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }
  Future<List<SuperMarketProductsModel>> getProductsByFilter(
      String? catId,
      String? subCatId,
      String? brandName,
      String? basketValue,
      String? price,
      String? vendorId,
      ) async {
    // Define the base endpoint
    String endpoint = "filter-products";

    // Construct the query parameters dynamically
    Map<String, String> queryParams = {};
    if (catId != null && catId.isNotEmpty) queryParams['category_id'] = catId;
    if (subCatId != null && subCatId.isNotEmpty) queryParams['sub_category_id'] = subCatId;
    if (brandName != null && brandName.isNotEmpty) queryParams['brand'] = brandName;
    if (basketValue != null && basketValue.isNotEmpty) queryParams['basket'] = basketValue;
    if (price != null && price.isNotEmpty) queryParams['price'] = price;
    if (vendorId != null && vendorId.isNotEmpty) queryParams['vendor'] = vendorId;

    // Build the URL with query parameters
    Uri url = Uri.parse('${Constants.baseUrl}$endpoint').replace(queryParameters: queryParams);

    try {
      // Perform the GET request
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => SuperMarketProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }


  Future<List<SuperMarketProductsModel>> getSearchProducts(String query) async {
    String endpoint = "search?query=$query";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => SuperMarketProductsModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<ComparisonListModel>> getSuggestedProductList(
      String productId) async {
    String endpoint = "products/other-vendors?product_id=$productId";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        print(body);
        return (body['data'] as List)
            .map((item) => ComparisonListModel.fromJson(item))
            .toList();
      } else {

        //_showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  Future<List<SubCatModel>> getSubCategoriesByCatId(String catId) async {
    String endpoint = "subCategory?category_id=$catId";
    var url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        return (body['data'] as List)
            .map((item) => SubCatModel.fromJson(item))
            .toList();
      } else {
        _showError(body: response.body);
        return [];
      }
    } catch (e) {
      _showError(error: e.toString());
      return [];
    }
  }

  void _showError({String? body, String? error}) {
    String message =
        error ?? jsonDecode(body ?? '{}')['message'] ?? "An error occurred";
    confirmationPopup(context, message);
  }

  void confirmationPopup(BuildContext dialogContext, String message) {
    showDialog(
      context: dialogContext,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Try Again"),
          )
        ],
      ),
    );
  }
}
