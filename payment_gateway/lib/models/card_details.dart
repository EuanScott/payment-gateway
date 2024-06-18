class MyCardDetails {
  String number, type, cvv, country;

  MyCardDetails(
    this.number,
    this.type,
    this.cvv,
    this.country,
  );

  @override
  String toString() =>
      'MyCardDetails -> {number: $number, type: $type, cvv: $cvv, country: $country}';

  Map<String, dynamic> toJson() =>
      {'number': number, 'cvv': cvv, 'country': country, 'type': type};

  static MyCardDetails fromJson(Map<String, dynamic> json) =>
      MyCardDetails(json['number'], json['type'], json['cvv'], json['country']);
}

// enum CardType {
//   Master,
//   Visa,
//   Verve,
//   Discover,
//   AmericanExpress,
//   DinersClub,
//   Jcb,
//   Other,
// }
