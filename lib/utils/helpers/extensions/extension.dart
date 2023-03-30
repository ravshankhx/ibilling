extension DateTimeExtension on DateTime {
  String weekdayName() {
    const Map<int, String> weekdayName = {1: "Mo", 2: "Tu", 3: "We", 4: "Thu", 5: "Fri", 6: "Sa"};
    return weekdayName[weekday]!;
  }
}