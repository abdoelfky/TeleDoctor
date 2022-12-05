class RecoredModel{
  String? data,patientId,selectedDoctorUID,selectedNurseUID,registeredDate;

  RecoredModel({
    required this.data,
    required this.selectedDoctorUID,
    required this.selectedNurseUID,
    required this.patientId,
    required this.registeredDate,



  });

  RecoredModel.fromJson(Map <String,dynamic> json)
  {
    data =json['data'];
    patientId =json['patientId'];
    selectedDoctorUID =json['selectedDoctorUID'];
    selectedNurseUID =json['selectedNurseUID'];
    registeredDate =json['registeredDate'];

  }

  Map <String,dynamic> toMap()
  {
    return {
      'data' :data,
      'selectedDoctorUID':selectedDoctorUID,
      'selectedNurseUID':selectedNurseUID,
      'patientId':patientId,
      'registeredDate':registeredDate,

    };
  }
}