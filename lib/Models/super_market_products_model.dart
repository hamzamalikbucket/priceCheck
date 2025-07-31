class SuperMarketProductsModel {
  String productImg;
  String productName;
  String productPrice;
  String productBrand;
  String  productId;
   bool saleTag;
   String  salePrice;

  SuperMarketProductsModel(
      {
      required this.productId,
      required this.productImg,
      required this.productName,
      required this.productPrice,
      required this.productBrand,
       this.saleTag=false,
       this.salePrice="22220.00",
      });
  factory SuperMarketProductsModel.fromJson(Map<String, dynamic> json) {
    return SuperMarketProductsModel(

      productId: json["code"].toString(),
      productName: json["name"],
      productImg: json["image"],
      productPrice: json["price"].toStringAsFixed(2),
      productBrand: json["brand"],
      saleTag:json['comparison_data']?["sale"]??false, // Fallback to false if sale is null
      // Use null-aware operator to handle cases where comparison_data or special_price might be null
      // If special_price is null, fallback to price
      salePrice:json['comparison_data']?["special_price"].toString()?? json["price"].toStringAsFixed(2), // Fallback to price if special_price is null

    );
  }
}
