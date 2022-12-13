class MessageModel{
  String? senderId,receiverId,dateTime,text,patientID;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
    required this.text,
    required this.patientID,

  });

  MessageModel.fromJson(Map <String,dynamic> json)
  {
    senderId =json['senderId'];
    receiverId =json['receiverId'];
    dateTime =json['dateTime'];
    text =json['text'];
    patientID =json['patientID'];


  }

  Map <String,dynamic> toMap()
  {
    return {
      'senderId' :senderId,
      'receiverId':receiverId,
      'dateTime':dateTime,
      'text':text,
      'patientID':patientID,

    };
  }
}