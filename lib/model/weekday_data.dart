import 'package:farmer_eats/model/weekday.dart';

class WeekDayData {
  WeekDayData({this.weekday, this.isSelected = false, this.isDone = false});
  WeekDay? weekday;
  bool isSelected;
  bool isDone;

  copyWith() {}
}
