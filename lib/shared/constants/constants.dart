import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledoctor/models/user_model.dart';
import 'dart:ui';

import '../../models/admin_model.dart';

String uId='';
bool? isSuper=false;
bool? isDoctor=false;
bool? isNurse=false;
bool? isAdmin=false;
String? userType;
AdminModel? adminModel;
UserModel? userModel;

Color blue1 = const Color(0xff253d79);
Color primaryColor = const Color(0xff004f9a);
Color blue3 = const Color(0xff2267b2);
Color blue4 = const Color(0xff3280c2);
Color blue5 = const Color(0xff4a9cd6);
Color blue6 = const Color(0xff63b3e4);
Color blue7 = const Color(0xff84c8ef);
Color blue8 = const Color(0xffa4dcf7);
Color blue9 = const Color(0xffc6eafa);
Color blue10 = const Color(0xffeaf7ff);