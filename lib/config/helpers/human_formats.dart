import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formattedNumber =
        NumberFormat.compactCurrency(decimalDigits: 1, symbol: '', locale: 'en')
            .format(number);
    return formattedNumber;
  }

  static String getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return formattedDate;
  }
}
