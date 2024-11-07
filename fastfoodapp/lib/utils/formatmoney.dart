import 'package:intl/intl.dart';

class Formatmoney {
  static formatCurrency(double amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );
    return currencyFormatter.format(amount).replaceAll('.', ',');
  }
}
