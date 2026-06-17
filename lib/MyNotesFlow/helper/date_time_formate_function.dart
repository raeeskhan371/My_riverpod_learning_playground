import 'package:intl/intl.dart';

String formateDateTime(DateTime? date) {
  if (date == null) {
    return "Loading...";
  }
  return DateFormat("MMMM d, y").format(date);
}
