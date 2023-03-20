class Reservation {
  DateTime fromTime;
  DateTime toTime;
  DateTime date;
  String by;
  String space;

  Reservation(
      {
        required this.fromTime,
        required this.toTime,
        required this.by,
        required this.date,
        required this.space,

      }
      );

}