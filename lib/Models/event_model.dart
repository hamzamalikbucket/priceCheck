class EventModel {
  String eventName;
  String eventImg;
  String eventStatus;
  String eventDescription;
  String eventStartTime;
  String eventStartDate;
  String eventEndTime;
  String eventEndDate;
  String eventLocation;
  String eventHostName;
  String eventHostLocation;
  String eventHostImg;
  String eventInvitationStatus;
  String eventNature;
  String eventTimeZone;
  String eventPrice;
  bool eventPriceStatus = false;

  EventModel({
    required this.eventName,
    required this.eventImg,
    required this.eventStatus,
    required this.eventDescription,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventLocation,
    required this.eventHostImg,
    required this.eventHostName,
    required this.eventHostLocation,
    required this.eventInvitationStatus,
    required this.eventPriceStatus,
    required  this.eventTimeZone,
    required this.eventNature,
    required this.eventPrice,
  });

}
