


import 'package:compareapp/resources/utils/constants.dart';

class ParticipantModel {
  String id;
  String image;
  String name;
  String location;

  ParticipantModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      id: json['id'].toString(),
      image: json['image'],
      name: json['name'],
      location: json['location'],
    );
  }

  static List<ParticipantModel> participantsList = [
    ParticipantModel(
      id: '1',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    ParticipantModel(
      id: '2',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    ParticipantModel(
      id: '3',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    ParticipantModel(
      id: '4',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    ParticipantModel(
      id: '5',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
    ParticipantModel(
      id: '6',
      image: Constants.eventPic,
      name: 'Fisayo Olamigoke',
      location: 'Texas, Pakistan',
    ),
  ];
}
