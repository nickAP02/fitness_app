class NotificationEntity {
  int? notificationId;
  String? title;
  String? content;
  DateTime? date;
  bool? isMarked;

  NotificationEntity({
    this.notificationId,
    this.title,
    this.content,
    this.date,
    this.isMarked,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json){
    return NotificationEntity(
      notificationId: json["notification_id"],
      title: json["title"],
      content: json["content"],
      date: json["date"],
      isMarked: json["is_marked"],
    );
  }

}