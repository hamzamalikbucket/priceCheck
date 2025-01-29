class ProductModel {
  String productImg;
  String productName;
  String productPrice;
  String productBrand;
  String productId;

  ProductModel(
      {
        required this.productId,
        required this.productImg,
        required this.productName,
        required this.productPrice,
        required this.productBrand});
}