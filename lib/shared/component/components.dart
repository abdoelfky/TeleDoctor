import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

void navigateAndEnd(context,widget,) =>
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget,),
          (route) {
        return false;
      },
    );

void navigateTo(context, widget) => Navigator.push(

  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget defaultButton({
  var textColor =const Color(0xFF014963),
  double width = 200,
  double height = 50.0,
  Color? color,
  var context,
  required String string,
  required Function? function(),
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: MaterialButton(
            minWidth: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(string,
                  style:GoogleFonts.laila(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontStyle: FontStyle.italic,
                  )),
            ),
            onPressed: function

        ),
      ),
    );

Widget defaultButton2({
  double width =double.infinity,
  double height = 60.0,
  Color? color,
  required String string,
  required Function? function(),
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: TextButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(string.toUpperCase(),
                  style: TextStyle(fontSize: 18.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            onPressed: function!),
      ),
    );

Widget defaultButton3({
  double width =double.infinity,
  double height = 50.0,
  Color? color,
  required String string,
  required Function function,
}) =>Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red)
      ),
      child: Center(
        child: MaterialButton(
            child: Text(string.toUpperCase(),
                style: TextStyle(fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.red)),
            onPressed: function()),
      ),
    );

Widget defaultButton4({
  double width =double.infinity,
  double height = 50.0,
  Color? color,
  required String string,
  required Function function,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: MaterialButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(string.toUpperCase(),
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
            onPressed: function()),
      ),
    );



Widget defaultFormFeild({
  var cursorColor=Colors.black,
  var color=Colors.black,
  var borderColor=Colors.black,
  required String validatorText,
  required var controller,
  required var inputType,
  IconButton? suffixIcon ,
  Function? suffixPressed,
  Icon? prefixIcon ,
  required String labelText,
  bool isObsecured=false,
  context,
  int ?maxLines,

})=>TextFormField(
  maxLines: maxLines,
  cursorColor: cursorColor,
  validator: (value){
    if(value!.isEmpty)
    {return validatorText;}
    return null;
  },
  controller: controller,
  keyboardType: inputType,
  obscureText: isObsecured,
  decoration: InputDecoration(
    labelStyle: GoogleFonts.laila(
      fontSize: 22,
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
    ),
    filled: true,
    fillColor: Colors.black.withOpacity(0),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: BorderSide(
        color: borderColor.withOpacity(.5),
        width: 1,
      ),
    ),
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,


  ),
);



Widget defaultFormFeild1({
  var cursorColor=Colors.black,
  var color=Colors.black,
  var borderColor=Colors.black,
  required String validatorText,
  required var controller,
  required var inputType,
  IconButton? suffixIcon ,
  Function? suffixPressed,
  Icon? prefixIcon ,
  required String labelText,
  bool isObsecured=false,
  context

})=>TextFormField(
  validator: (value){
    if(value!.isEmpty)
    {return validatorText;}
    return null;
  },
  controller: controller,
  keyboardType: inputType,
  obscureText: isObsecured,
  decoration: InputDecoration(
    labelStyle: GoogleFonts.laila(
      fontSize: 22,
      color:primaryColor,
      fontStyle: FontStyle.italic,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color:primaryColor,
        width:2,
      ),
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color:primaryColor,
        width:3,
      ),
    ),
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,


  ),
);


Widget defaultFormFeild2({
  var color=Colors.black,
  var borderColor=Colors.grey,
  String? validatorText,
  required var controller,
  var inputType,
  IconButton? suffixIcon ,
  Function? suffixPressed,
  Icon? prefixIcon ,
  required String labelText,
  bool isObsecured=false,
  context

})=>TextFormField(
  readOnly: true,
  showCursor: false,
  validator: (value){
    if(value!.isEmpty)
    {return validatorText;}
    return null;
  },
  controller: controller,
  keyboardType: inputType,
  obscureText: isObsecured,
  decoration: InputDecoration(
    labelStyle: GoogleFonts.laila(
      fontSize: 22,
      color:Colors.grey[700],
      fontStyle: FontStyle.italic,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color:Colors.grey.shade400,
        width:2,
      ),
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color:Colors.grey.shade400,
        width:3,
      ),
    ),
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,


  ),
);

Widget defaultFormFeild3({
  var color=Colors.black,
  var borderColor=Colors.grey,
  String? validatorText,
  required var controller,
  var inputType,
  IconButton? suffixIcon ,
  Function? suffixPressed,
  Icon? prefixIcon ,
  required String labelText,
  bool isObsecured=false,
  context

})=>TextFormField(
  showCursor: true,
  validator: (value){
    if(value!.isEmpty)
    {return validatorText;}
    return null;
  },
  controller: controller,
  keyboardType: inputType,
  obscureText: isObsecured,
  decoration: InputDecoration(
    labelStyle: GoogleFonts.laila(
      fontSize: 22,
      color:Colors.grey[700],
      fontStyle: FontStyle.italic,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color:Colors.grey.shade400,
        width:2,
      ),
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color:primaryColor,
        width:3,
      ),
    ),
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,


  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 15),
  child: Container(
    width: double.infinity,
    height:3,
    color: Colors.grey[200],
  ),
);

myAppBar({
  required String appBarText,
  List<Widget>? icon,
})=>AppBar(
  actions:icon,
  backgroundColor:primaryColor ,
  title: Text(appBarText,style:
  TextStyle(fontWeight: FontWeight.bold,fontSize: 23)
    ,

  ),
);


void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
// enum
enum ToastStates { SUCCESS, ERROR, WARNING }