class GroceryProductsModel{
  String productImg;
  String productName;
  dynamic productPrice;
  String productBrand;
  String productId;
  String martName;
  int quantity;

  GroceryProductsModel({

    required this.productId,
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.productBrand,
    required this.martName,
    this.quantity = 1,
});



}