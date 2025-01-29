


import 'package:compareapp/resources/utils/constants.dart';

class GiftSpyaredModel {
  String id;
  String image;
  String name;
  String price;
  String location;

  GiftSpyaredModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.location,
  });

  factory GiftSpyaredModel.fromJson(Map<String, dynamic> json) {
    return GiftSpyaredModel(
      id: json['id'].toString(),
      image: json['image'],
      name: json['name'],
      location: json['location'],
      price: json['price'],
    );
  }

  static List<GiftSpyaredModel> giftSpyaredList = [
    GiftSpyaredModel(
      id: '1',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
      price: '2342',
    ),
    GiftSpyaredModel(
      id: '2',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
      price: '2342',
    ),
    GiftSpyaredModel(
      id: '3',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
      price: '2342',
    ),
    GiftSpyaredModel(
      id: '4',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
      price: '2342',
    ),
    GiftSpyaredModel(
      id: '5',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
      price: '2342',
    ),
    GiftSpyaredModel(
      id: '6',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
      price: '2342',
    ),
  ];
}
