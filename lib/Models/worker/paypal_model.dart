

class PaypalModel {
  String id;
  String bankName;
  String bankIBAN;
  String bankHolderName;
  String country;
  String routingNumber;
  String address;

  PaypalModel({
    required this.id,
    required this.bankName,
    required this.bankIBAN,
    required this.bankHolderName,
    required this.country,
    required this.routingNumber,
    required this.address,
  });

  factory PaypalModel.fromJson(Map<String, dynamic> json) {
    return PaypalModel(
      id: json['id'].toString(),
      bankName: json['bankName'],
      bankIBAN: json['bankIBAN'],
      bankHolderName: json['bankHolderName'],
      country: json['country'],
      routingNumber: json['routingNumber'],
      address: json['address'],
    );
  }

  static List<PaypalModel> paypalList = [
    PaypalModel(
      id: '1',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Juland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    PaypalModel(
      id: '2',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    PaypalModel(
      id: '3',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    PaypalModel(
      id: '4',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    PaypalModel(
      id: '5',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    PaypalModel(
      id: '6',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
  ];
}
