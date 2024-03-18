import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    return NumberFormat.compactCurrency(
            decimalDigits: 1, symbol: '', locale: 'en')
        .format(number);
  }

  static String getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return formattedDate;
  }

  static String shortDate(DateTime date) {
    final format = DateFormat.yMMMEd('es');
    return format.format(date);
  }
}
