import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class AddNewRoomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var roomNameController = TextEditingController();
    var roomNo = TextEditingController();
    var enterBedNo = TextEditingController();
    var enterPricePerNight = TextEditingController();

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
                            'Add New Room',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/Hospital patient-amico.png',
                    width: size.width * .9,
                    height: size.height * .4,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.text,
                        validatorText: 'Name must not be empty',
                        controller: roomNo, labelText: 'Name'),
                  ),


                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.text,
                        validatorText: 'Room Name must not be empty',
                        controller: roomNameController,
                        labelText: 'Enter Room Name'),
                  ),


                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.number,
                        validatorText: 'Bed No must not be empty',
                        controller: enterBedNo, labelText: 'Enter Bed No'),
                  ),


                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.number,
                        validatorText: 'Price Per Night must not be empty',
                        controller: enterPricePerNight,
                        labelText: 'Enter Price Per Night'),
                  ),

                  Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child:defaultButton2(
                          string: 'Add Room',
                          function: ()
                          {

                          }
                      )

                  ),
                ],
              ),
            ),
          );
        });
  }
}