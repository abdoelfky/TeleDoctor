import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/modules/admin_modules/home_layout_screen.dart';
import 'package:teledoctor/modules/admin_modules/home_screen.dart';
import 'package:teledoctor/shared/component/components.dart';
import '../../models/patient_model.dart';
import '../../shared/constants/constants.dart';

class EditNormalRatesScreen extends StatelessWidget {
  final PatientModel patient;
  var formKey = GlobalKey<FormState>();
  var sugerController = TextEditingController();
  var pressureController = TextEditingController();
  var tempController = TextEditingController();

  EditNormalRatesScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
      if (state is UpdatePatientRecordSuccessState) {
        showToast(
            text: 'Rates Updated Successfully', state: ToastStates.SUCCESS);

        AppCubit.get(context).changeBottomNav(0);
        navigateTo(context,HomeLayoutScreen());

      }
      if (state is UpdatePatientRecordErrorState) {
        showToast(text: '${state.error}', state: ToastStates.ERROR);
      }

    }, builder: (context, state) {
      if (patient.temp != '-' &&
          patient.pressure != '-' &&
          patient.suger != '-'
          &&patient.temp != tempController.text.trim()
          &&patient.pressure != pressureController.text.trim()
          && patient.suger != sugerController.text.trim()) {
        sugerController.text = patient.suger!;
        pressureController.text = patient.pressure!;
        tempController.text = patient.temp!;
      }

      var cubit = AppCubit.get(context);
      Size size = MediaQuery.of(context).size;
      return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07,
                      vertical: size.height * .1),
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
                            EdgeInsets.only(top: 7.0, left: size.width * .07),
                        child: Text(
                          'Edit Normal Rates',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    children: [
                      //Email Form Fields
                      defaultFormFeild1(
                          validatorText: 'Suger-Rate must not be empty',
                          controller: sugerController,
                          inputType: TextInputType.number,
                          labelText: 'suger'),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormFeild1(
                          validatorText: 'Pressure-Rate must not be empty',
                          controller: pressureController,
                          inputType: TextInputType.number,
                          labelText: 'Pressure'),
                      SizedBox(
                        height: 20,
                      ),

                      defaultFormFeild1(
                          validatorText: 'Temp-Rate must not be empty',
                          controller: tempController,
                          inputType: TextInputType.number,
                          labelText: 'Temp'),
                      SizedBox(
                        height: 20,
                      ),

                      defaultButton4(
                          width: 170,
                          string: 'UPDATE',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.updatePatientData(
                                id: patient.id,
                                  suger: sugerController.text,
                                  temp: tempController.text,
                                  pressure: pressureController.text,
                                selectedDoctorUID:patient.selectedDoctorUID ,
                                selectedNurseUID:patient.selectedNurseUID,
                                patientName: patient.name

                              );

                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
