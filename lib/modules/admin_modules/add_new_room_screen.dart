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

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var floorNumberController = TextEditingController();
    var roomNoController = TextEditingController();
    var BedNoController = TextEditingController();
    var PricePerNightController = TextEditingController();

    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state)
        {
          if(state is AddNewRoomSuccessState)
          {

            roomNoController.text ='';
            floorNumberController.text ='';
            PricePerNightController.text ='';
            BedNoController.text ='';
            AppCubit.get(context).getAllRooms();

            showToast(
                text: 'Room Added Successfully',
                state: ToastStates.SUCCESS
            );

          }
          if(state is AddNewRoomErrorState)
          {
            showToast(
                text: '${state.error}',
                state: ToastStates.ERROR
            );
          }
          },
        builder: (context, state) {
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
                          validatorText: 'Rome Number must not be empty',
                          controller: roomNoController, labelText: 'Room No'),
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: defaultFormFeild1(
                          inputType: TextInputType.text,
                          validatorText: 'Floor number must not be empty',
                          controller: floorNumberController,
                          labelText: 'Floor Number'),
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: defaultFormFeild1(
                          inputType: TextInputType.number,
                          validatorText: 'Bed No must not be empty',
                          controller: BedNoController, labelText: 'Bed No'),
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: defaultFormFeild1(
                          inputType: TextInputType.number,
                          validatorText: 'Price Per Night must not be empty',
                          controller: PricePerNightController,
                          labelText: 'Price Per Night'),
                    ),

                    Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child:defaultButton2(
                          height: 60,
                            string: 'Add Room',
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                cubit.addNewRoom(
                                    roomNo:roomNoController.text.trim() ,
                                    floorNumber: floorNumberController.text.trim(),
                                    bedsNo:BedNoController.text.trim() ,
                                    pricePerNight: PricePerNightController.text.trim());
                              }

                            }
                        )

                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}