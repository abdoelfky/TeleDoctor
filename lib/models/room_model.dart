class RoomModel
{
  String? roomNo,floorNumber,bedsNo,pricePerNight;
  RoomModel({
    required this.roomNo,
    required this.floorNumber,
    required this.bedsNo,
    required this.pricePerNight,

  });

  RoomModel.fromJson(Map <String,dynamic> json)
  {
    roomNo =json['roomNo'];
    floorNumber =json['floorNumber'];
    bedsNo =json['bedsNo'];
    pricePerNight =json['pricePerNight'];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'roomNo':roomNo,
      'floorNumber':floorNumber,
      'bedsNo':bedsNo,
      'pricePerNight':pricePerNight,

    };
  }

}