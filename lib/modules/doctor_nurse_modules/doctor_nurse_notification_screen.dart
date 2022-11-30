import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

class DoctorAndNurseNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Size size = MediaQuery.of(context).size;
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
                              width:30 ,
                              height:30 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: primaryColor,

                              ),
                              child: Icon(Icons.refresh,color: Colors.white,)),
                        )

                      ],
                    ),
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:3,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => buildItem()
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget buildItem(){
  String notificationDate='TODAY';

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Text(
          'Today',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
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
                        notificationDate=='TODAY'?
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
                        ):SizedBox(),
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
                                  'Nurse, Reem',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Has updated islam magdy record',
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
                                        '5mins ago',
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