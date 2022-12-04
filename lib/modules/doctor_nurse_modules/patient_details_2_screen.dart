import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';

import '../../shared/component/components.dart';
import '../../shared/constants/constants.dart';



class PatientDetailsScreen2 extends StatelessWidget {
  const PatientDetailsScreen2({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var recordController =TextEditingController();
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
                  //AppBar
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .1,
                        vertical: size.height * .07),
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
                            'Patient Details',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Patient Card
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.grey[100],

                      elevation: 5,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),

                      //  color: Colors.blue,

                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                          left: 12,
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              //image
                              Container(
                                width: 80,
                                height: 85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 6,
                                      color: Colors.white,
                                    )),
                                child: Center(
                                  child: Image(
                                    image: AssetImage(
                                      'images/profile.jpeg',
                                    ),
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 10.0,
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      'Ahmed Mohamed Shiref',
                                      style: TextStyle(
                                          fontSize: 16.0, fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          'Dr Shiref',
                                          style: TextStyle(color: primaryColor),
                                        ),
                                        SizedBox(
                                          width: size.width*.2,
                                        ),
                                        Text(
                                          '#1545145',
                                          style: TextStyle(color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25,
                        left: 20, right: 20),
                    child: defaultFormFeild0(
                      maxLines: 4,
                      inputType: TextInputType.text,
                      validatorText: 'Type the record',
                      controller: recordController,
                      labelText: 'Type The record...',

                    ),
                  ),

                  Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child:defaultButton2(
                          string: 'ADD Record',
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




