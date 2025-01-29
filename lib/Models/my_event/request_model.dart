


import 'package:compareapp/resources/utils/constants.dart';
class RequestModel {
  String id;
  String image;
  String name;
  String location;

  RequestModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'].toString(),
      image: json['image'],
      name: json['name'],
      location: json['location'],
    );
  }

  static List<RequestModel> requestList = [
    RequestModel(
      id: '1',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    RequestModel(
      id: '2',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    RequestModel(
      id: '3',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    RequestModel(
      id: '4',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    RequestModel(
      id: '5',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    RequestModel(
      id: '6',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
  ];
}
