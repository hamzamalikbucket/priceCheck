class CategoryProductModel{


  String productImg;
  String productName;
  String productPrice;
  String productBrand;
  int productId;

  CategoryProductModel(
      {
        required this.productId,
        required this.productImg,
        required this.productName,
        required this.productPrice,
        required this.productBrand});
  factory CategoryProductModel.fromJson(Map<String, dynamic> json) {
    return  CategoryProductModel(

      productId: json["id"],
      productName: json["name"],
      productImg: json["image"],
      productPrice: json["price"].toString(),
      productBrand: json["brand"],

    );
  }
}