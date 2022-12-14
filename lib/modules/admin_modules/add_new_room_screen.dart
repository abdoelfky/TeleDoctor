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
  var floors = [for(var i=1; i<int.parse(adminModel!.floorNumbers.toString())+1; i+=1) i];

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
                          inputType: TextInputType.number,
                          validatorText: 'Rome Number must not be empty',
                          controller: roomNoController, labelText: 'Room No'),
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child:DropdownButtonFormField2(
                        focusColor: primaryColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 3,
                            ),
                          ),
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
                          'Select Floor',
                          style: TextStyle(
                            fontSize: 22,
                            color: primaryColor,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                        const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: floors
                            .map((item) => DropdownMenuItem<String>(
                          value: '${item}',
                          child: Text(
                            'Floor Number ${item}',
                            style: TextStyle(
                                fontSize: 20, color: primaryColor),
                          ),
                        ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Floor';
                          }
                        },
                        onChanged: (value) {
                          cubit.changeEmptySelectedRoom(
                              floorSelectedVal: value.toString());
                          floorNumberController.text=value.toString();
                          // floorSelectedValue=value.toString();
                        },
                        onSaved: (value) {},
                      ),

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
                        child:!cubit.addRoomIsLoading?defaultButton2(
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
                        ):CircularProgressIndicator()

                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}