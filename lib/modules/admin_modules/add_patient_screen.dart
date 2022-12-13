import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/models/room_model.dart';
import 'package:teledoctor/modules/admin_modules/home_layout_screen.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class AddNewPatientScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var patientNameController = TextEditingController();
  var patientAgeController = TextEditingController();
  var roomNoController = TextEditingController();
  var selectDoctorController = TextEditingController();
  var selectNurseController = TextEditingController();
  var selectGenderController = TextEditingController();
  var patientIdController = TextEditingController();
  var patientEmailController=TextEditingController();
  final List<String> genders = [
    'Male',
    'Female',
  ];
  List<RoomModel> rooms=[];

  String? genderSelectedValue;
  String? doctorSelectedValue;
  String? roomNoSelectedValue;
  String? nurseSelectedValue;
  @override
  Widget build(BuildContext context) {



    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state)
        {

          if(state is AddNewPatientSuccessState)
          {

            patientNameController.text ='';
            patientAgeController.text ='';
            roomNoController.text ='';
            selectDoctorController.text ='';
            selectNurseController.text ='';
            selectGenderController.text ='';
            patientIdController.text ='';
            patientEmailController.text ='';

            showToast(
                text: 'Patient Added Successfully',
                state: ToastStates.SUCCESS
            );
            AppCubit.get(context).changeBottomNav(0);
            navigateTo(context, HomeLayoutScreen());

          }
          if(state is AddNewPatientErrorState)
          {
            showToast(
                text: '${state.error}',
                state: ToastStates.ERROR
            );
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery
              .of(context)
              .size;

          rooms=[];
          AppCubit.get(context).rooms.forEach((element)
          {
            if(element.roomType.toString().toUpperCase()=='EMPTY')
            {
              rooms.add(element);
            }
          });


          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
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
                        controller: patientNameController,
                        labelText: 'Patient Name',

                      ),
                    ),

                    //patient Age
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: defaultFormFeild1(
                          inputType: TextInputType.number,
                          validatorText: 'Patient Age must not be empty',
                          controller: patientAgeController,
                          labelText: 'Patient Age'),
                    ),

                    //room no
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child:DropdownButtonFormField2(
                          focusColor: primaryColor,
                          decoration: InputDecoration(

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
                              ),),
                            //Add isDense true and zero Padding.
                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Select Room No',
                            style: TextStyle(fontSize: 22,color:primaryColor,
                            ),

                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color:primaryColor,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: rooms
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item.roomNo.toString(),
                                child: Text(
                                  'Room Number ${item.roomNo}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: primaryColor
                                  ),
                                ),
                              ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Room NO';
                            }else {
                              roomNoController.text=value.toString();

                            }
                          },
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                          },
                          onSaved: (value) {
                            roomNoSelectedValue = value.toString();
                          },
                        )

                    ),

                    //select doctor
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child:DropdownButtonFormField2(
                        focusColor: primaryColor,
                        decoration: InputDecoration(

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
                            ),),
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: Text(
                          'Select Doctor',
                          style: TextStyle(fontSize: 22,color:primaryColor,
                          ),

                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color:primaryColor,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: cubit.doctors
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item.uId.toString(),
                              child: Text(
                                item.name.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor
                                ),
                              ),
                            ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select doctor';
                          }else {
                            selectDoctorController.text=value.toString();

                          }
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          doctorSelectedValue = value.toString();
                        },
                      )
                    ),

                    //select nurse
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: DropdownButtonFormField2(
                        focusColor: primaryColor,
                        decoration: InputDecoration(

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
                            ),),
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: Text(
                          'Select Nurse',
                          style: TextStyle(fontSize: 22,color:primaryColor,
                          ),

                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color:primaryColor,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: cubit.nurses
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item.uId,
                              child: Text(
                                item.name.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor
                                ),
                              ),
                            ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Nurse';
                          }else {
                            selectNurseController.text=value.toString();

                          }
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          doctorSelectedValue = value.toString();
                        },
                      )
                    ),

                    //Select Gender

                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: DropdownButtonFormField2(
                        focusColor: primaryColor,
                        decoration: InputDecoration(

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
                            ),),
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: Text(
                          'Select Gender',
                          style: TextStyle(fontSize: 22,color:primaryColor,
                          ),

                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color:primaryColor,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: genders
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor
                                ),
                              ),
                            ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Gender';
                          }else {
                            selectGenderController.text=value.toString();

                          }
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          genderSelectedValue = value.toString();
                        },
                      )
                    ),

                    //patient ID
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: defaultFormFeild1(
                          inputType: TextInputType.number,
                          validatorText: 'Patient ID must not be empty',
                          controller: patientIdController,
                          labelText: 'Patient ID'),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: defaultFormFeild1(
                          inputType: TextInputType.emailAddress,
                          validatorText: 'Patient Email must not be empty',
                          controller: patientEmailController,
                          labelText: 'Patient Email'),
                    ),

                    Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: !cubit.addPatientIsLoading?defaultButton2(
                          height: 60,
                            string: 'Add Patient',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.addNewPatient(
                                    name:patientNameController.text.trim(),
                                    age:patientAgeController.text.trim(),
                                    roomNo: roomNoController.text.trim(),
                                    selectedDoctorUID: selectDoctorController.text.trim(),
                                    selectedNurseUID: selectNurseController.text.trim(),
                                    gender: selectGenderController.text.trim(),
                                    id: patientIdController.text.trim(),
                                    registeredDate:DateTime.now().toString(),
                                    newPatient:patientIdController.text.trim(),
                                    patientEmail: patientEmailController.text.trim()

                                );



// print('patientIdController :${patientIdController.text}');
                              }


                            }
                        ):
                            CircularProgressIndicator()

                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

