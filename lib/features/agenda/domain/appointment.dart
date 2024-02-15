class Appointment {
  int? appointmentId;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  int? userId;
  int? partnerId;
  Appointment({
    this.appointmentId,
    this.title,
    this.startDate,
    this.endDate,
    this.userId,
    this.partnerId
  });
  factory Appointment.fromJson(Map<String,dynamic>json){
    return Appointment(
      appointmentId : json["appointment_id"],
      title : json["title"],
      userId : json["user_id"],
      startDate : json["start_date"],
      endDate : json["end_date"],
      partnerId : json["partner_id"]
    );
  }
  Map<String,dynamic> toJson()=>{
    'appointment_id':appointmentId,
    'user_id':userId,
    'title':title,
    'start_date':startDate,
    'end_date':endDate,
    'partner_id':partnerId
  };
}