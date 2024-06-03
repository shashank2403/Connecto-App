class EventSummary {
  EventSummary({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventLocation,
    this.eventImageUrl,
  });
  String eventName;
  String eventDate;
  String eventTime;
  String eventLocation;
  String? eventImageUrl;
}
