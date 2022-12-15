import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/modules/admin_modules/room_information_screen.dart';
import 'package:teledoctor/shared/constants/constants.dart';

import '../../models/room_model.dart';
import '../../shared/component/components.dart';

class EmptyRoomsScreen extends StatelessWidget {
  var floors = [
    for (var i = 1;
        i < int.parse(adminModel!.floorNumbers.toString()) + 1;
        i += 1)
      i
  ];

  @override
  Widget build(BuildContext context) {
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
                  //text and back arrow
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .06,
                        vertical: size.height * .09),
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
                            'Empty Rooms',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //gridview rooms and search
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: Column(
                      children: [
                        DropdownButtonFormField2(
                          dropdownMaxHeight: 150,
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
                              fontSize: 18,
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
                                          fontSize: 16, color: primaryColor),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select type';
                            }
                          },
                          onChanged: (value) {
                            cubit.changeEmptySelectedRoom(
                                floorSelectedVal: value.toString());
                            // floorSelectedValue=value.toString();
                          },
                          onSaved: (value) {},
                        ),
                        cubit.emptyRoomsInFloor.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: cubit.emptyRoomsInFloor.length,
                                itemBuilder: (context, index) {
                                  return roomItem(
                                      size,
                                      (cubit.emptyRoomsInFloor[index]),
                                      context,
                                      index);
                                },
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        childAspectRatio: 2 / 1.3,
                                        crossAxisSpacing: size.width * .03,
                                        mainAxisSpacing: size.height * .02),
                              )
                            :
                            // cubit.floorSelectedValue=='2'&&cubit.floorNumber2.isNotEmpty?
                            // GridView.builder(
                            //   shrinkWrap:true,
                            //   physics: const BouncingScrollPhysics(),
                            //   itemCount:cubit.floorNumber2.length ,
                            //   itemBuilder:(context,index)
                            //   {
                            //     return roomItem(size,cubit.floorNumber2[index],context,index);
                            //   },
                            //   gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                            //       maxCrossAxisExtent: 150,
                            //       childAspectRatio: 2/1.3,
                            //       crossAxisSpacing: size.width*.03,
                            //       mainAxisSpacing: size.height*.02
                            //
                            //   ),
                            //
                            // ):
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * .2),
                                child: Text(
                                  'No Rooms Added Yet',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                        SizedBox(
                          height: size.height * .5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget roomItem(size, RoomModel roomModel, context, index) => InkWell(
      onTap: () {
        navigateTo(
            context,
            RoomInformation(
              roomModel: roomModel,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: blue5,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Room #${roomModel.roomNo}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: primaryColor)),
            SizedBox(
              height: 2,
            ),
            Text('${roomModel.bedsNo} Beds',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
