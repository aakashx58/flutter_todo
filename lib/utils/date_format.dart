import 'package:jiffy/jiffy.dart';

String dateFormat(String date) {
  var datesplit = date.split('T');
  var newDate = datesplit[0].split('-');
  return Jiffy.parseFromMap({
    Unit.year: int.parse(newDate[0]),
    Unit.month: int.parse(newDate[1]),
    Unit.day: int.parse(newDate[2]),
  }).format(pattern: 'do, MMM yyyy');
}
