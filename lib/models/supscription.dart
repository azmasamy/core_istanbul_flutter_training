class Subscription{
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final int quota ;
Subscription({
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.quota
});
}