class BrandsModel{
  String brandName;



  BrandsModel({

    required this.brandName
  });
  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(

      brandName: json["brand"],



    );
  }
}