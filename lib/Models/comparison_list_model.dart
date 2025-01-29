class ComparisonListModel {
  String vendorImage;
  String vendorName;
  String vendorPrice;
  String priceDate;
  String productImage;
  String productPrice;
  String productName;



  ComparisonListModel(
      {
    required this.vendorName,
        required this.vendorImage,
        required this.vendorPrice,
        required this.priceDate,
        required this.productPrice,
        required this.productImage,
        required this.productName,


        });
  factory ComparisonListModel.fromJson(Map<String, dynamic> json) {
    return ComparisonListModel(

      vendorName: json['vendor']["name"],
      vendorImage: json['vendor']["image"],
      vendorPrice: json["price"].toStringAsFixed(2),
      priceDate: json["price_date"].toString(),
      productPrice: json['product']["price"].toString(),
      productName: json['product']["name"],
      productImage: json['product']["image"],


    );
  }
}
