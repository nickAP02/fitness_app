class NotificationEntity {
  int? notification_id;
  String? title;
  String? content;
  DateTime? date;
  bool? is_marked;

  NotificationEntity({
    this.notification_id,
    this.title,
    this.content,
    this.date,
    this.is_marked,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json){
    return NotificationEntity(
      notification_id: json["notification_id"],
      title: json["title"],
      content: json["content"],
      date: json["date"],
      is_marked: json["is_marked"],
    );
  }

}