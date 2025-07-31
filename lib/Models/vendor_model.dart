class VendorModel{
  String vendorName;
  String vendorCode;
  int? vendorId;


  VendorModel({
  required this.vendorName,
    required this.vendorCode,
   this.vendorId
  });
  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(

      vendorName: json["name"],
      vendorCode: json["code"],
      vendorId: json["id"],


    );
  }
}