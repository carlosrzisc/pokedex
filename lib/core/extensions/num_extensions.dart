import 'package:intl/intl.dart';

final none = NumberFormat('#,#0', 'is_IS');
final oCcy = NumberFormat('#,##0', 'is_IS');
final oCcyDec = NumberFormat('#,##0.0#', 'is_IS');

extension DoubleExtensions on double? {
  String toIcelandicCurrency({bool hasDecimals = false}) {
    final isLongEnough = toString().length > 3;
    if (isLongEnough) {
      return hasDecimals ? oCcyDec.format(this) : oCcy.format(this);
    } else {
      return none.format(this);
    }
  }
}
