import 'package:intl/intl.dart';

String formatToHour(DateTime? dateTime) {
  if (dateTime == null) return '--';
  return DateFormat('h:mm').format(dateTime).toLowerCase(); // Format as "5pm"
}
