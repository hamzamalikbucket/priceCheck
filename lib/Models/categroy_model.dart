class CategoryModel{
  String catName;
  String catIcon;
  int catId;
  String catCode;


  CategoryModel({
    required this.catName,
    this.catIcon="assets/images/waterfall.png",
    required this.catId,
    required this.catCode,

});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(

      catId: json["id"],
      catName: json["name"],
      catCode: json["code"],
      catIcon: json["icon"],



    );
  }
}