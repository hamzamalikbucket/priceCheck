class SubCatModel{
  String subCatName;
  String subCatCode;
  String subCatId;


  SubCatModel({
    required this.subCatName,
    required this.subCatCode,
    required this.subCatId
  });
  factory SubCatModel.fromJson(Map<String, dynamic> json) {
    return SubCatModel(

      subCatName: json["name"],
      subCatCode: json["code"],
      subCatId: json["id"].toString(),


    );
  }
}