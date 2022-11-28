class AdminModel
{
  String? name,id,email,phone,uId,hospitalName,hospitalLocation,password,type;
  AdminModel({
    required this.uId,
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.hospitalLocation,
    required this.hospitalName,
    required this.password,
    required this.type

  });

  AdminModel.fromJson(Map <String,dynamic> json)
  {
    name =json['name'];
    phone =json['phone'];
    email =json['email'];
    uId =json['uId'];
    id=json['id'];
    hospitalLocation=json['hospitalLocation'];
    hospitalName=json['hospitalName'];
    password =json['password'];
    type =json['type'];

  }

  Map <String,dynamic> toMap()
  {
    return {
      'name':name,
      'phone':phone,
      'email':email,
      'uId':uId,
      'id':id,
      'hospitalLocation':hospitalLocation,
      'hospitalName':hospitalName,
      'password':password,
      'type':type,
    };
  }

}