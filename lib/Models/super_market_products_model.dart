class SuperMarketProductsModel {
  String productImg;
  String productName;
  String productPrice;
  String productBrand;
  String  productId;

  SuperMarketProductsModel(
      {
        required this.productId,
      required this.productImg,
      required this.productName,
      required this.productPrice,
      required this.productBrand});
  factory SuperMarketProductsModel.fromJson(Map<String, dynamic> json) {
    return SuperMarketProductsModel(

      productId: json["code"].toString(),
      productName: json["name"],
      productImg: json["image"],
      productPrice: json["price"].toStringAsFixed(2),
      productBrand: json["brand"],

    );
  }
}
