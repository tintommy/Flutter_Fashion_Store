import 'package:intl/intl.dart';

extension NumFormat on num {
  String formatWithThousandSeparator() {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(this);
  }
}