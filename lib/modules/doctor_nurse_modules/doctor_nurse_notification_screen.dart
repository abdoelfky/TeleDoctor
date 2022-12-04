import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/models/patient_model.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

import '../../shared/local/shared_preference.dart';

class DoctorAndNurseNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          String uId=CacheHelper.getData(key: 'uId');
          List<PatientModel> patients=[];
          cubit.patients.forEach((element)
          {
            if(uId==element.selectedNurseUID||uId==element.selectedDoctorUID)
            {
              patients.insert(patients.length, element);
            }


          });


          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * .08, left: size.width * .215),
                    child: Row(
                      children: [
                        Text(
                          'Notification Area',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        SizedBox(width:15,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                              width:40 ,
                              height:40 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: primaryColor,

                              ),
                              child: IconButton(onPressed:()
                              {
                                cubit.getAllPatients();
                              },

                                  icon: Icon(Icons.refresh,color: Colors.white,))),
                        )

                      ],
                    ),
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:1,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => buildItem(patients,index)
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget buildItem(List<PatientModel>patients,index){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Text(
          '${DateFormat("yyyy-MM-dd")
            .format(DateTime
            .parse(patients[index]
            .registeredDate.toString()))}',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:patients.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) => Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12,
                left: 12,
              ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height:10 ,
                            width:10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        //image
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                width: 3,
                                color: primaryColor,
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
                          child: Padding(
                            padding: const EdgeInsets.only(top:15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'New Patient',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Admin has added new Patient for You',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_rounded,
                                        color: Colors.grey[500],
                                      ),
                                      Text(
                                        '${DateFormat("hh:mm")
                                            .format(DateTime
                                            .parse(patients[index]
                                            .registeredDate.toString()))}',
                                        style: TextStyle(
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    myDivider()
                  ],
                ),
              ),
            ),
          )),
    ],
  );

}