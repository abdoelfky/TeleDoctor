import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController =TextEditingController();
    var emailController =TextEditingController();
    var hospitalNameController =TextEditingController();
    var hospitalLocationController =TextEditingController();
    return BlocConsumer<AppCubit,AppState>(
        listener:(context,state){} ,
        builder:(context,state)
        {
          nameController.text='Abdo Elfeky';
          emailController.text='Abdo@gmail.com';
          hospitalNameController.text='Elsalam Hospital';
          hospitalLocationController.text='Tanta';
          Size size=MediaQuery.of(context).size;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children:
                [
                  Stack(
                    children:
                    [
                      Container(
                        height: size.height*.43,
                        width: double.infinity,
                        color: Colors.red,
                        child: Stack(
                          children:
                          [
//background
                            Expanded(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset('images/profile.png', fit: BoxFit.cover),
                                  ClipRRect( // Clip it cleanly.
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        color:blue4.withOpacity(0.3),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
//image
                            Center(
                              child: Container(
                                width:size.width*.4 ,
                                height:size.height*.2 ,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      width: 8,
                                      color:Colors.white,
                                    )
                                ),
                                child:Center(
                                  child: Image(image: AssetImage('images/admin.png',),
                                    width:size.width*.32 ,
                                    height:size.height*.15 ,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*.36),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50) ,
                                  topLeft: Radius.circular(50)
                              )
                          ),
                        ),

                        //name
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text('Abdo Elfeky',
                            style: TextStyle(fontSize: 23,
                                color:primaryColor,
                                fontWeight: FontWeight.w600),),
                        ),

                        //admin text
                        Padding(
                          padding: const EdgeInsets.all(60.0),
                          child: Text('Admin',
                            style: TextStyle(fontSize: 20,
                                color:Colors.grey[600],
                                fontWeight: FontWeight.w600),),
                        ),

                        //name formField
                        Padding(
                          padding: EdgeInsets.only(
                              top:size.height*.13,
                              left: 30,
                            right: 30


                          ),
                          child: defaultFormFeild2(
                              controller: nameController,
                              labelText: 'Name'
                            )
                          ,
                        ),

                        //email formField
                        Padding(
                          padding: EdgeInsets.only(
                              top:size.height*.235,
                              left: 30,
                              right: 30


                          ),
                          child: defaultFormFeild2(
                              controller: emailController,
                              labelText: 'Email'
                          )
                          ,
                        ),

                        //hospital name formField
                        Padding(
                          padding: EdgeInsets.only(
                              top:size.height*.34,
                              left: 30,
                              right: 30


                          ),
                          child: defaultFormFeild2(
                              controller: hospitalNameController,
                              labelText: 'Hospital Name'
                          )
                          ,
                        ),

                        //hospital location formField
                        Padding(
                          padding: EdgeInsets.only(
                              top:size.height*.445,
                              left: 30,
                              right: 30


                          ),
                          child: defaultFormFeild2(
                              controller: hospitalLocationController,
                              labelText: 'Hospital Location'
                          )
                          ,
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top:size.height*.53,
                              left: 30,
                              right: 30


                          ),
                          child:SizedBox(
                            width: 100,
                            height: 10,
                          )
                          ,
                        ),








                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}


