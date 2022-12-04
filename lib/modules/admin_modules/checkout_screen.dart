import 'dart:math';
import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/models/patient_model.dart';
import 'package:teledoctor/models/room_model.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import '../../models/user_model.dart';

class CheckOutScreen extends StatelessWidget {
  final PatientModel model;
  CheckOutScreen({required this.model});


  @override
  Widget build(BuildContext context) {
    var roomNameController = TextEditingController();
    var roomNo = TextEditingController();
    var enterBedNo = TextEditingController();
    var enterPricePerNight = TextEditingController();
    RoomModel? roomModel;
    AppCubit.get(context).rooms.forEach((element)
    {
      if(element.roomNo.toString()==model.roomNo)
      {
        roomModel=element;
      }

    });
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: blue5,
                              borderRadius: BorderRadius.circular(25)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              )),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 7.0, left: size.width * .12),
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
            QrImage(
              data:'Name :${model.name} , '
                  'Room Number :${model.roomNo} , '
                  'Nights Number :${cubit
                  .daysBetween
                (DateTime.parse('${model.registeredDate}')
                  ,DateTime.now())} , '
                  'Patient ID :${model.id} , '
                  'Total Cash :${cubit
                  .daysBetween
                (DateTime
                  .parse('${model.registeredDate}')
                  ,DateTime.now())*int
                  .parse('${roomModel!.pricePerNight}')}  , ',
              version: QrVersions.auto,
              size: 170.0,
            ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 110, left: 110,
                      top: 50,
                    ),
                    child: Divider(

                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 80.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Text(
                              'Room No.',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              model.name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: size.width*.06,
                            ),
                            Text(
                              model.roomNo.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Register Data',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              'Exit Data',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '${DateFormat("yyyy-MM-dd").format(DateTime.parse(model.registeredDate.toString()))}',

                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: size.width*.1,
                            ),
                            Text(
                              '${DateFormat("yyyy-MM-dd").format(DateTime.parse(DateTime.now().toString()))}',

                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Add ons',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 55,
                            ),
                            Text(
                              'Nights No',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '3500LE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: size.width*.15,
                            ),
                            Text(
                              '${cubit
                                  .daysBetween
                                (DateTime.parse('${model.registeredDate}')
                                  ,DateTime.now())}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Patient ID',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Total Cash',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '#${model.id}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: size.width*.15,
                            ),
                            Text(
                              '${cubit
                                  .daysBetween
                                (DateTime
                                  .parse('${model.registeredDate}')
                                  ,DateTime.now())*int
                                  .parse('${roomModel!.pricePerNight}')} \$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Recept No',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '#${Random().nextInt(9999999)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child:
                      defaultButton2(height: 60,string: 'Check Out', function: () {})),
                ],
              ),
            ),
          );
        });
  }
}