import 'package:compareapp/Models/grocery_products_model.dart';
import 'package:flutter/cupertino.dart';

class CartManager extends ChangeNotifier{
  static final CartManager _instance = CartManager._internal();
  final List<GroceryProductsModel> cartList = [];
  final List<VoidCallback> _listeners = [];


  factory CartManager() {
    return _instance;
  }

  CartManager._internal();



  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
  void addToCart(GroceryProductsModel product) {
    // Find the product in the cart
    GroceryProductsModel? existingProduct = cartList.firstWhere(
          (item) => item.productId == product.productId,
      orElse: () => GroceryProductsModel(
        productId: '', // Default or empty values
        productName: '',
        productImg: '',
        productPrice: '0',
        martName: '',
        quantity: 0, productBrand: '',
      ),
    );

    if (existingProduct.productId.isNotEmpty) {
      // Update the quantity if the product already exists
      existingProduct.quantity += 1;
    } else {
      // Add the product to the cart
      cartList.add(product..quantity = 1);
    }
    _notifyListeners();
  }

  List<GroceryProductsModel> getCartItems() {
    return cartList;
  }
  List<String> getProductIds() {
    return cartList.map((item) => item.productId).toList();
  }
  // Calculate the total price of the cart
  double getTotalPrice() {
    return cartList.fold(0, (total, item) {
      double price = double.tryParse(item.productPrice) ?? 0;
      return total + (price * item.quantity);
    });
  }
  List<GroceryProductsModel> get cartItems {
    return List.unmodifiable(cartList);
  }
}
