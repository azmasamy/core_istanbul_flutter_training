class Reservation {
  final DateTime fromTime;
  final DateTime toTime;
  final DateTime date;
  final String by;
  final String space;

  Reservation({
    required this.fromTime,
    required this.toTime,
    required this.by,
    required this.date,
    required this.space,
  });
}
