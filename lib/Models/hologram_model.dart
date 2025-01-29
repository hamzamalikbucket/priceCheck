class Hologram {
  String id;
  String title;

  Hologram({
    required this.id,
    required this.title,
  });

  factory Hologram.fromJson(Map<String, dynamic> json) {
    return Hologram(
      id: json['id'].toString(),
      title: json['title'],
    );
  }

  @override
  String toString() {
    return title;
  }

  static List<Hologram> hologramList = [
    Hologram(id: '1', title: 'Yes'),
    Hologram(id: '2', title: 'No'),
  ];
}

class HologramType {
  String id;
  String title;

  HologramType({
    required this.id,
    required this.title,
  });

  factory HologramType.fromJson(Map<String, dynamic> json) {
    return HologramType(
      id: json['id'].toString(),
      title: json['title'],
    );
  }

  @override
  String toString() {
    return title;
  }

  static List<HologramType> hologramTypeList = [
    HologramType(id: '1', title: 'Hologram Glass Rental \$3,000'),
    HologramType(id: '2', title: 'Hologram -  Mesh Rental \$1,000'),
    HologramType(id: '3', title: 'Hologram Fan Rental - Preferred \$1,200'),
  ];
}

class EventEngineer {
  String id;
  String title;

  EventEngineer({
    required this.id,
    required this.title,
  });

  factory EventEngineer.fromJson(Map<String, dynamic> json) {
    return EventEngineer(
      id: json['id'].toString(),
      title: json['title'],
    );
  }

  @override
  String toString() {
    return title;
  }

  static List<EventEngineer> eventEngineerList = [
    EventEngineer(id: '1', title: 'Muhammad Ehsan'),

  ];
}
class EventWorker {
  String id;
  String title;

  EventWorker({
    required this.id,
    required this.title,
  });

  factory EventWorker.fromJson(Map<String, dynamic> json) {
    return EventWorker(
      id: json['id'].toString(),
      title: json['title'],
    );
  }

  @override
  String toString() {
    return title;
  }

  static List<EventWorker> eventWorkerList = [
    EventWorker(id: '1', title: 'Cock'),

  ];
}

class TimeZone {
  String id;
  String title;

  TimeZone({
    required this.id,
    required this.title,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      id: json['id'].toString(),
      title: json['title'],
    );
  }

  @override
  String toString() {
    return title;
  }

  static List<TimeZone> timeZoneList = [
    TimeZone(id: '1', title: '(GMT-11:00) Midway Island, Samoa'),
    TimeZone(id: '2', title: '(GMT-10:00) Hawaii'),
    TimeZone(id: '3', title: '(GMT-8:00) Alaska'),
    TimeZone(id: '4', title: '(GMT-8:00) Alaska'),
    TimeZone(id: '5', title: '(GMT-7:00) Dawson, Yukon'),
    TimeZone(id: '7', title: '(GMT-7:00) Arizona'),
    TimeZone(id: '8', title: '(GMT-7:00) Pacific Time'),
    TimeZone(id: '9', title: '(GMT-6:00) Mountain Time'),
    TimeZone(id: '11', title: '(GMT-6:00) Chihuahua, La Paz, Mazatlan'),
    TimeZone(id: '12', title: '(GMT-6:00) Saskatchewan'),
    TimeZone(id: '13', title: '(GMT-6:00) Guadalajara, Mexico City, Monterrey'),
    TimeZone(id: '10', title: '(GMT-6:00) Central America'),
    TimeZone(id: '14', title: '(GMT-6:00) Central America'),
    TimeZone(id: '15', title: '(GMT-5:00) Central Time'),
    TimeZone(id: '16', title: '(GMT-5:00) Bogota, Lima, Quito'),
    TimeZone(id: '17', title: '(GMT-4:00) Eastern Time'),
    TimeZone(id: '18', title: '(GMT-4:00) Caracas, La Paz'),
    TimeZone(id: '19', title: '(GMT-3:00) Santiago'),
    TimeZone(id: '20', title: '(GMT-3:00) Brasilia'),
    TimeZone(id: '21', title: '(GMT-3:00) Montevideo'),
    TimeZone(id: '22', title: '(GMT-3:00) Buenos Aires, Georgetown'),
    TimeZone(id: '23', title: '(GMT-2:30) Newfoundland and Labrador'),
    TimeZone(id: '24', title: '(GMT-2:00) Greenland'),
    TimeZone(id: '25', title: '(GMT-1:00) Cape Verde Islands'),
    TimeZone(id: '26', title: '(GMT+0:00) Azores'),
    TimeZone(id: '27', title: '(GMT+0:00) UTC'),
    TimeZone(id: '28', title: '(GMT+0:00) Casablanca, Monrovia'),
    TimeZone(id: '29', title: '(GMT+1:00) Edinburgh, London'),
    TimeZone(id: '30', title: '(GMT+1:00) Dublin'),
    TimeZone(id: '31', title: '(GMT+1:00) Lisbon'),
    TimeZone(id: '32', title: '(GMT+1:00) West Central Africa'),
    TimeZone(id: '32', title: '(GMT+2:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague'),
    TimeZone(id: '33', title: '(GMT+2:00) Sarajevo, Skopje, Warsaw, Zagreb'),
    TimeZone(id: '34', title: '(GMT +2:00) Brussels, Copenhagen, Madrid, Paris'),
    TimeZone(id: '35', title: '(GMT +2:00) Amsterdam, Berlin, Be Rome, Stockholm, Vienna'),
    TimeZone(id: '36', title: '(GMT+2:00) Harare, Pretoria'),
    TimeZone(id: '37', title: '(GMT+3:00) Bucharest'),
    TimeZone(id: '38', title: '(GMT-3:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius'),
    TimeZone(id: '39', title: '(GMT+3:00) Athens, Minsk'),
    TimeZone(id: '40', title: '(GMT+3:00) Jerusalem'),
    TimeZone(id: '41', title: '(GMT+3:00) Istanbul, Moscow, St. Petersburg, Volgograd'),
    TimeZone(id: '42', title: '(GMT+3:00) Kuwait, Riyadh'),
    TimeZone(id: '43', title: '(GMT+3:00) Nairobi'),
    TimeZone(id: '44', title: '(GMT+3:00) Baghdad'),
    TimeZone(id: '45', title: '(GMT+3:30) Tehran'),
    TimeZone(id: '46', title: '(GMT-4:00) Abu Dhabi, Muscat'),
    TimeZone(id: '47', title: '(GMT+4:00) Baku, Tbilisi, Yerevan'),
    TimeZone(id: '48', title: '(GMT+4:30) Kabul'),
    TimeZone(id: '49', title: '(GMT+5:00) Ekaterinburg'),
    TimeZone(id: '50', title: '(GMT-5:00) Islamabad, Karachi. Tashkent'),
    TimeZone(id: '51', title: '(GMT+5:30) Chennai, Kolkata, Mumbai, New Delhi'),
    TimeZone(id: '52', title: '(GMT+5:30) Sri Jayawardenepura'),
    TimeZone(id: '53', title: '(GMT+5:45) Kathmandu'),
    TimeZone(id: '54', title: '(GMT+6:00) Astana, Dhaka'),
    TimeZone(id: '55', title: '(GMT+6:00) Almaty, Novosibirsk'),
    TimeZone(id: '56', title: '(GMT+6:30) Yangon Rangoon'),
    TimeZone(id: '57', title: '(GMT+7:00) Krasnoyarsk'),
    TimeZone(id: '58', title: '(GMT+8:00) Beijing, Chongqing, Hong Kong SAR, Urumqi'),
    TimeZone(id: '59', title: '(GMT+7:00) Bangkok, Hanoi, Jakarta'),
    TimeZone(id: '60', title: '(GMT-8:00) Kuala Lumpur, Singapore'),
    TimeZone(id: '61', title: '(GMT-8:00) Taipei'),
    TimeZone(id: '62', title: '(GMT +8:00) Irkutsk, Ulaanbaatar'),
    TimeZone(id: '63', title: '(GMT+9:06 Osaka, Sapporo, Tokyo'),
    TimeZone(id: '64', title: '(GMT+9:00) Yakutsk'),
    TimeZone(id: '65', title: '(GMT+9:30) Darwin'),
    TimeZone(id: '66', title: '(GMT+9:30) Adelaide'),
    TimeZone(id: '67', title: '(GMT+10:00) Canberra, Melbourne, Sydney'),
    TimeZone(id: '68', title: '(GMT+10:00) Brisbane'),
    TimeZone(id: '69', title: '(GMT+10:00) Hobart'),
    TimeZone(id: '70', title: '(GMT+10:00) Vladivostok'),
    TimeZone(id: '71', title: '(GMT+10:00) Guam, Port Moresby'),
    TimeZone(id: '72', title: '(GMT+11:00) Magadan, Solomon Islands, New Caledonia'),
    TimeZone(id: '73', title: '(GMT+12:00) Kamchatka, Marshall Islands'),
    TimeZone(id: '74', title: '(GMT+12:00) Fiji Islands'),
    TimeZone(id: '75', title: '(GMT+12:00) Auckland. Wellington'),
    TimeZone(id: '76', title: '(GMT+13:00) Nuku\'alofa'),

  ];
}
