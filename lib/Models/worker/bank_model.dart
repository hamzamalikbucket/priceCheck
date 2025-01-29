

class BankModel {
  String id;
  String bankName;
  String bankIBAN;
  String bankHolderName;
  String country;
  String routingNumber;
  String address;

  BankModel({
    required this.id,
    required this.bankName,
    required this.bankIBAN,
    required this.bankHolderName,
    required this.country,
    required this.routingNumber,
    required this.address,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'].toString(),
      bankName: json['bankName'],
      bankIBAN: json['bankIBAN'],
      bankHolderName: json['bankHolderName'],
      country: json['country'],
      routingNumber: json['routingNumber'],
      address: json['address'],
    );
  }

  static List<BankModel> bankList = [
    BankModel(
      id: '1',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    BankModel(
      id: '2',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    BankModel(
      id: '3',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    BankModel(
      id: '4',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    BankModel(
      id: '5',
      bankName: 'Bank Al Habib',
      bankIBAN: '054540 46546 666540',
      bankHolderName: 'Buland Khan',
      country: 'Pakistan',
      routingNumber: '112255630',
      address: 'Lahore,Pakistan',
    ),
    BankModel(
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
