class RecoredModel{
  String? data,patientId,registeredDate,sendBy;
  List? selectedDoctorUID,selectedNurseUID;
  RecoredModel({
    required this.data,
    required this.selectedDoctorUID,
    required this.selectedNurseUID,
    required this.patientId,
    required this.registeredDate,
    required this.sendBy



  });

  RecoredModel.fromJson(Map <String,dynamic> json)
  {
    data =json['data'];
    patientId =json['patientId'];
    selectedDoctorUID =json['selectedDoctorUID'];
    selectedNurseUID =json['selectedNurseUID'];
    registeredDate =json['registeredDate'];
    sendBy =json['sendBy'];

  }

  Map <String,dynamic> toMap()
  {
    return {
      'data' :data,
      'selectedDoctorUID':selectedDoctorUID,
      'selectedNurseUID':selectedNurseUID,
      'patientId':patientId,
      'registeredDate':registeredDate,
      'sendBy':sendBy,

    };
  }
}