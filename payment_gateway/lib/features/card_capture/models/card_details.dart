class CardDetails {
  String number;
  String type;
  String cvv;
  String country;

  CardDetails(
    this.number,
    this.type,
    this.cvv,
    this.country,
  );

  // @override
  // String toString() {
  //   return 'CardDetails -> {number: $number, type: $type, cvv: $cvv, country: $country}';
  // }
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
