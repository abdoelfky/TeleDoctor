import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class DoctorAndNurseProfileScreen extends StatelessWidget {
  const DoctorAndNurseProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController =TextEditingController();
    var emailController =TextEditingController();
    var jopController =TextEditingController();
    var categoryController =TextEditingController();
    return BlocConsumer<AppCubit,AppState>(
        listener:(context,state){} ,
        builder:(context,state)
        {
          nameController.text=userModel!.name!;
          emailController.text=userModel!.email!;
          jopController.text=userModel!.jop!;
          categoryController.text=userModel!.type!;
          Size size=MediaQuery.of(context).size;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
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
                            Stack(
                              fit: StackFit.expand,
                              children: [
                                isAdmin!?
                                Image.asset('images/profile.png', fit: BoxFit.cover):

                                Image.asset('images/${userModel!.type.toString().toLowerCase()}.jpg', fit: BoxFit.cover),                                  ClipRRect( // Clip it cleanly.
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: Container(
                                      color:blue5.withOpacity(0.5),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ],
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
                          child: Text('${userModel!.name}',
                            style: TextStyle(fontSize: 23,
                                color:primaryColor,
                                fontWeight: FontWeight.w600),),
                        ),

                        //admin text
                        Padding(
                          padding: const EdgeInsets.all(60.0),
                          child: Text('${userModel!.type.toString()}',
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
                              controller: categoryController,
                              labelText: 'Category'
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
                              controller: jopController,
                              labelText: 'Specialization'
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

