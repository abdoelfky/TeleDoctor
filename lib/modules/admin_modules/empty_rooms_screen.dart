import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class EmptyRoomsScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<AppCubit,AppState>(
        listener:(context,state){} ,
        builder:(context,state)
        {

          var cubit=AppCubit.get(context);
          Size size=MediaQuery.of(context).size;
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:
                [
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:size.width*.1,
                        vertical:size.height*.09),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration
                            (
                              color:blue5,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: IconButton(
                              onPressed: ()
                              {
                                Navigator.pop(context);
                              },
                              icon:Icon(Icons.arrow_back,
                                color:Colors.white,
                                size: 25,)
                          ),
                        ),

                        Padding(
                          padding:EdgeInsets.only(top:7.0,left:size.width*.12),
                          child: Text('Empty Rooms',style: TextStyle(
                              color:primaryColor,
                              fontWeight:FontWeight.w600 ,
                              fontSize: 22

                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}


