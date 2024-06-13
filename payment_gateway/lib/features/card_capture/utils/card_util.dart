import '../models/card_details.dart';


class CardUtils {
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  // TODO: Convert this to s switch statement
  static String getCardTypeFrmNumber(String input) {
    String cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = "Master";
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = "Visa";
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = "Verve";
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = "AmericanExpress";
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = "Discover";
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = "DinersClub";
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = "Jcb";
    } else {
      cardType = "Other";
    }
    return cardType;
  }
}