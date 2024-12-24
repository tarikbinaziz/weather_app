import 'package:intl/intl.dart';

String formatTime(DateTime? dateTime) {
  if (dateTime == null) return '--';
  return DateFormat('ha').format(dateTime).toUpperCase();
}
