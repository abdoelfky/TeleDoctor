class RoomModel
{
  String? roomNo,floorNumber,bedsNo,pricePerNight,roomType;
  List? patientList;
  RoomModel({
    required this.roomNo,
    required this.floorNumber,
    required this.bedsNo,
    required this.pricePerNight,
    required this.roomType,
    required this.patientList

  });

  RoomModel.fromJson(Map <String,dynamic> json)
  {
    roomNo =json['roomNo'];
    floorNumber =json['floorNumber'];
    bedsNo =json['bedsNo'];
    pricePerNight =json['pricePerNight'];
    roomType =json['roomType'];
    patientList =json['patientList'];


  }

  Map <String,dynamic> toMap()
  {
    return {
      'roomNo':roomNo,
      'floorNumber':floorNumber,
      'bedsNo':bedsNo,
      'pricePerNight':pricePerNight,
      'roomType':roomType,
      'patientList':patientList,


    };
  }

}