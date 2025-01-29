import 'dart:core';

class ServicesModel{

  String serviceName;
  String servicePrice;
  String serviceDesc;
  String currency;
  String serviceType;
  String sellerEmail;
  String sellerPhone;
  List<dynamic> serviceImgList;
  ServicesModel({
    required this.serviceImgList,
    required this.serviceName,
    required this.servicePrice,
    required this.serviceDesc,
    required this.serviceType,
    required this.currency,
    required this.sellerEmail,
    required this.sellerPhone,


});
}