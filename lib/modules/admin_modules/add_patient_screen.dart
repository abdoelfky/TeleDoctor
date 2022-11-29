import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class AddNewPatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var patientName = TextEditingController();
    var patientAge = TextEditingController();
    var roomNo = TextEditingController();
    var selectDoctor = TextEditingController();
    var selectNurse = TextEditingController();
    var selectGender = TextEditingController();
    var patientId = TextEditingController();

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

                        Padding(
                          padding:
                          EdgeInsets.only(top: 7.0, left: size.width * .12),
                          child: Text(
                            'Add New Patient',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //patient name
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: defaultFormFeild1(
                      inputType: TextInputType.text,
                      validatorText: 'Patient Name must not be empty',
                      controller: patientName,
                      labelText: 'Patient Name',

                    ),
                  ),

                  //patient Age
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.text,
                        validatorText: 'Patient Age must not be empty',
                        controller: patientAge,
                        labelText: 'Patient Age'),
                  ),

                  //room no
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.number,
                        validatorText: 'Room No must not be empty',
                        controller: roomNo, labelText: 'Select Room No'),
                  ),

                  //select doctor
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.text,
                        validatorText: 'Doctor must not be empty',
                        controller: selectDoctor,
                        labelText: 'Select Doctor'),
                  ),

                  //select nurse
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.text,
                        validatorText: 'Nurse must not be empty',
                        controller: selectNurse,
                        labelText: 'Select Nurse'),
                  ),

                  //Select Gender
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.text,
                        validatorText: 'Gender must not be empty',
                        controller: selectGender,
                        labelText: 'Select Gender'),
                  ),

                  //patient ID
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: defaultFormFeild1(
                        inputType: TextInputType.number,
                        validatorText: 'Patient ID must not be empty',
                        controller: patientId,
                        labelText: 'Patient ID'),
                  ),

                  Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child:defaultButton2(
                          string: 'Add Patient',
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