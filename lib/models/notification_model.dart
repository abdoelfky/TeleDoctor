class NotificationModel{
  String? text,patientId,doctorUID,nurseUID,sendDate;

  NotificationModel({
    required this.text,
    required this.doctorUID,
    required this.nurseUID,
    required this.patientId,
    required this.sendDate,



  });

  NotificationModel.fromJson(Map <String,dynamic> json)
  {
    text =json['text'];
    patientId =json['patientId'];
    nurseUID =json['nurseUID'];
    doctorUID =json['doctorUID'];
    sendDate =json['sendDate'];

  }

  Map <String,dynamic> toMap()
  {
    return {
      'text' :text,
      'nurseUID':nurseUID,
      'doctorUID':doctorUID,
      'patientId':patientId,
      'sendDate':sendDate,

    };
  }
}