/// Utility class for card operations.
///
/// This class provides static methods for cleaning card numbers and determining the card type from the card number.
class CardUtils {
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String getCardTypeFrmNumber(String input) {
    Map<String, String> cardTypes = {
      r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))':
          "Master",
      r'[4]': "Visa",
      r'((506(0|1))|(507(8|9))|(6500))': "Verve",
      r'((34)|(37))': "AmericanExpress",
      r'((6[45])|(6011))': "Discover",
      r'((30[0-5])|(3[89])|(36)|(3095))': "DinersClub",
      r'(352[89]|35[3-8][0-9])': "Jcb",
    };

    for (var entry in cardTypes.entries) {
      if (input.startsWith(RegExp(entry.key))) {
        return entry.value;
      }
    }

    return "Other";
  }
}
