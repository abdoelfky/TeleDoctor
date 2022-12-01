class UserModel
{
  String? name,id,email,phone,uId,jop,password,type;
  UserModel({
    required this.uId,
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.jop,
    required this.password,
    required this.type

  });

  UserModel.fromJson(Map <String,dynamic> json)
  {
    name =json['name'];
    phone =json['phone'];
    email =json['email'];
    uId =json['uId'];
    id=json['id'];
    jop=json['jop'];
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
      'jop':jop,
      'password':password,
      'type':type,
    };
  }

}