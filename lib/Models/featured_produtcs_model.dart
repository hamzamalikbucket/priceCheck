class FeaturedProductsModel{
  String productImg;
  String productName;
  String productPrice;
  String productBrand;
  String productId;


  FeaturedProductsModel({

   required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.productBrand,
    required this.productId,



});
  factory FeaturedProductsModel.fromJson(Map<String, dynamic> json) {
    return FeaturedProductsModel(

      productId: json["code"].toString(),
      productName: json["name"],
      productImg: json["image"],
      productPrice: json["price"].toStringAsFixed(2),
      productBrand: json["brand"],

    );
  }

}